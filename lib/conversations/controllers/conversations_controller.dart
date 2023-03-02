import 'dart:convert';
import 'dart:io';

import 'package:bodsquare_sdk/conversations/models/block_and_unblock_contact_request/block_and_unblock_contact_request.dart';
import 'package:bodsquare_sdk/conversations/models/close_conversation/close_conversation_request.dart';
import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_message.dart';
import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_model.dart';
import 'package:bodsquare_sdk/conversations/models/delete_message_response/delete_message_response.dart';
import 'package:bodsquare_sdk/conversations/models/get_all_conversations/get_all_conversations.dart';
import 'package:bodsquare_sdk/conversations/models/report_contact_request/report_contact_request.dart';
import 'package:bodsquare_sdk/conversations/models/send_message_request/send_message_request.dart';
import 'package:bodsquare_sdk/conversations/models/unsent_messages_model.dart';
import 'package:bodsquare_sdk/conversations/repository/conversation_repository.dart';
import 'package:bodsquare_sdk/conversations/widgets/report_received_bottomsheet.dart';
import 'package:bodsquare_sdk/helpers/clipboard_service.dart';
import 'package:bodsquare_sdk/helpers/conversations_service.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:bodsquare_sdk/helpers/storage_service.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConversationsController extends GetxController {
  LoadingService loadingService;
  ConversationsController({required this.loadingService});
  final TextEditingController textMessageController = TextEditingController();
  final TextEditingController reportConversationsController =
      TextEditingController();
  final ConversationRepository _conversationRepository =
      Get.put(ConversationRepository());
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 50);
  late LoadingService _loadingService;
  final StorageService _storageService = Get.put(StorageService());
  // final BodSquareAppData _bodSquareAppData = Get.put(BodSquareAppData());
  final ClipboardService clipboardService = Get.put(ClipboardService());
  // final WebSocketService _webSocketService = Get.put(WebSocketService());
  final ConversationsService _conversationsService =
      Get.put(ConversationsService());
  RxBool isLoading = RxBool(false);
  RxBool isBlocked = RxBool(false);
  // IOWebSocketChannel? channel;
  RxBool singleConversation = RxBool(false);
  RxString currentConversationId = RxString('');
  RxString currentChannel = RxString('');
  RxString currentContactId = RxString('');
  RxList<UnsentMessages> unsentMessages = RxList([]);

  bool textMessageControllerHasText = false;
  final cloudinary = CloudinaryPublic('bodsquare', 'ululzj4d', cache: false);
  RxString token = RxString('');

  @override
  void onInit() async {
    super.onInit();
    _loadingService = loadingService;
    token.value = await _storageService.getString('token');
    getAllConversations();
    // _webSocketService.channelconnect();
  }

  @override
  void onClose() {
    // channel?.sink.close();
  }

  void addListenerToTextMessageController() {
    //log('adding listener to text message controller');

    textMessageController.addListener(() {
      if (textMessageController.text.isNotEmpty) {
        textMessageControllerHasText = true;

        update();
      } else {
        textMessageControllerHasText = false;
        update();
      }
      update();
    });
  }

  void removeTextMessageControllerListener() {
    textMessageController.removeListener(() {});
    //log('info: textcontroller listener disposed');
  }

  /// Get all conversations
  Future<void> getAllConversations() async {
    final response = await _conversationRepository.getAllConversations();
    if (response.status == 'success') {
      _conversationsService.allConversationsList.value = response.data ?? [];

      update();
      _storageService.setString(
          'bodsquareConversations', jsonEncode(response.toJson()));
    }
    update();
    //log(response.toString());
  }

  Future<void> getOfflineMessage(String id) async {
    // individualConversationMessages.clear();
    final oldConvo = await _storageService.getString(id);

    if (oldConvo != null) {
      final oldConvoJson = jsonDecode(oldConvo);
      final oldConvoModel = ConversationModel.fromJson(oldConvoJson);
      individualConversationMessages.value = oldConvoModel.data!.messages ?? [];
      // individualConversationMessages.refresh();

      update();
      await scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut);
      update();
      // update();
    } else {
      //log('oldConvo is null');
    }
    // update();
  }

  Future<void> updateOfflineMessagesFromSocket(
      String id, ConversationMessage message) async {
    final olderConversation =
        await _storageService.getString(currentConversationId.value);
    if (olderConversation != null) {
      final oldMessageJson = jsonDecode(olderConversation);
      ConversationModel oldMessageModel =
          ConversationModel.fromJson(oldMessageJson);
      final messages = oldMessageModel.data!.messages ?? [];
      messages.add(message);
      oldMessageModel = oldMessageModel.copyWith(
          data: oldMessageModel.data!.copyWith(messages: messages));

      _conversationsService.conversation.value = oldMessageModel;

      _storageService.setString(
          currentConversationId.value, jsonEncode(oldMessageModel.toJson()));
      //log('updated offline messages from socket');
      update();
    } else {
      //log('olderConversation is null');
    }
    //log('it got here first');
    getOfflineMessage(currentConversationId.value);
  }

  Future<void> getOfflineConversation(GetAllConversationsData data) async {
    final oldConvo = await _storageService.getString('bodsquareConversations');

    if (oldConvo != null) {
      final oldConvoJson = jsonDecode(oldConvo);
      GetAllConversations? oldConvoModel =
          GetAllConversations.fromJson(oldConvoJson);

      // GetAllConversationsData? valueToChange
      oldConvoModel = oldConvoModel.copyWith(
          data: oldConvoModel.data!.map((e) {
        if (e.contactUid == data.contactUid) {
          e = e.copyWith(
              channel: data.channel,
              companyUid: data.companyUid,
              contactUid: data.contactUid,
              createdAt: data.createdAt,
              id: data.id,
              connectionUid: data.connectionUid,
              lastMessage: data.lastMessage,
              messageType: data.messageType,
              noOfUnseenMessages: data.noOfUnseenMessages,
              status: data.status,
              updatedAt: data.updatedAt,
              uid: data.uid);
        }

        return e;
      }).toList());

      _conversationsService.allConversationsList.value =
          oldConvoModel.data ?? [];
      _storageService.setString(
          'bodsquareConversations', jsonEncode(oldConvoModel.toJson()));
    } else {
      //log('oldConvo is null');
    }
    update();
  }

  Future<void> getSingleConversation(String id, {bool? track}) async {
    try {
      await getOfflineMessage(id);
      final response = await _conversationRepository.getConversations(id: id);

      if (response.status == 'success') {
        _conversationsService.conversation.value = response;
        individualConversationMessages.clear();
        update();
        individualConversationMessages.value = response.data!.messages ?? [];
        individualConversationMessages.refresh();

        update();
        _storageService.setString(id, jsonEncode(response.toJson()));

        isBlocked.value = response.data?.conversation?.contact?.isBlocked == "1"
            ? true
            : false;
        await getOfflineMessage(id);
        // update();
        update();

        if (scrollController.hasClients) {
          await scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        }
        getAllConversations();
        if (track != null && track == true) {}
        update();
      }
      update();
    } catch (e) {
      //log(e.toString());
    }
  }

  Future<void> sendMessage(
      {required String id,
      required String channelName,
      required String message,
      required String messageType}) async {
    final request = SendMessageRequest(
        messageType: messageType, message: message, conversationId: id);
    //log(request.toString());
    ConversationMessage unsentMessage = ConversationMessage(
      message: message,
      messageType: messageType,
      uid: id,
      messageFrom: 'company',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      timestamp: DateTime.now().toString(),
      platform: 'Bodsquare platform',
      status: 'offline',
    );

    await addOfflineMessage(unsentMessage);

    textMessageController.clear();
    final response = channelName.toLowerCase() == 'twitter'
        ? await _conversationRepository.sendTwitterMessage(request)
        : channelName.toLowerCase() == 'facebook'
            ? await _conversationRepository.sendFacebookMessage(request)
            : channelName.toLowerCase() == 'instagram'
                ? await _conversationRepository.sendInstagramMessage(request)
                : const ConversationModel();

    if (response.status == 'success') {
      // _conversationsService.conversation.value = response;
      await getSingleConversation(
        id,
      );
      // getAllConversations();
      // await getOfflineMessage(id);
    } else {
      _loadingService.showError(
        'unable to send message...',
      );
    }
    // getAllConversations();
  }

  Future<void> addOfflineMessage(ConversationMessage message) async {
    final initialMessages = individualConversationMessages;
    initialMessages.add(message);

    individualConversationMessages = initialMessages;
    update();
  }

  Future<void> deleteConversation(String id) async {
    try {
      final response = await _conversationRepository.deleteConversation(id);

      if (response.status == 'success') {
        //log(response.toString());
        getAllConversations();
        _loadingService.showInfo('conversation deleted');
        update();
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError(e.response?.data['message'] ??
            'Error: Unable to delete conversation');
      } else {
        _loadingService.showError(
          'Error: unable to delete conversation...',
        );
      }
      //log(e.toString());
    }
  }

  Future<void> deleteMessage(
      {String? messageId,
      String? conversationId,
      required String channelName}) async {
    final request = messageId.toString();
    try {
      final response = channelName.toLowerCase() == 'twitter'
          ? await _conversationRepository.deleteTwitterMessage(request)
          : channelName.toLowerCase() == 'facebook'
              ? await _conversationRepository.deleteFacebookMessage(request)
              : channelName.toLowerCase() == 'instagram'
                  ? await _conversationRepository
                      .deleteInstagramMessage(request)
                  : const DeleteMessageResponse();

      if (response.status == 'success') {
        getSingleConversation(conversationId ?? '');
        // getAllConversations();
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError(
            e.response?.data['message'] ?? 'Unable to delete message');
      } else {
        _loadingService.showError('Unable to delete message');
      }
    }
  }

  Future<void> closeConversation(String conversationUid) async {
    try {
      final response = await _conversationRepository.closeConversation(
          CloseConversationRequest(conversationUid: conversationUid));

      if (response.status == 'success') {
        //log(response.toString());
        getAllConversations();
        _loadingService.showInfo('conversation closed');
        update();
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError(e.response?.data['message'] ??
            'Error: Unable to close conversation');
      } else {
        _loadingService.showError(
          'Error: unable to close conversation...',
        );
      }
      //log(e.toString());
    }
  }

  Future<void> blockConversation(String id) async {
    _loadingService.show();
    try {
      final response = await _conversationRepository
          .blockConversation(BlockAndUnblockContactRequest(contactUid: id));
      if (response.status == 'success') {
        getSingleConversation(currentConversationId.value);
        _loadingService.showSuccess('conversation blocked');

        update();
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError(
          'unable to block conversation...',
        );
      } else {
        _loadingService.showError(
          'unable to block conversation...',
        );
        //log(e.toString());
      }
    }
  }

  Future<void> unblockConversation(String id) async {
    _loadingService.show();
    try {
      final response = await _conversationRepository
          .unblockConversation(BlockAndUnblockContactRequest(contactUid: id));
      if (response.status == 'success') {
        getSingleConversation(currentConversationId.value);
        _loadingService.showSuccess('conversation unblocked');

        update();
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError(
          'unable to unblock conversation...',
        );
      } else {
        _loadingService.showError(
          'unable to unblock conversation...',
        );
        //log(e.toString());
      }
    }
  }

  Future<void> reportConversation(String id) async {
    final request = ReportContactRequest(
      contactUid: id,
      reason: reportConversationsController.text,
    );
    _loadingService.show();
    try {
      final response =
          await _conversationRepository.reportConversation(request);
      if (response.status == 'success') {
        getAllConversations();

        _loadingService.dismiss();
        reportConversationsController.clear();
        Get.bottomSheet(ReportReceivedBottomSheet(
          conversationId: id,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        //log(e.response.toString());
        _loadingService.showError(
          'Error: unable to report conversation...',
        );
      } else {
        _loadingService.showError(
          'Error: unable to report conversation...',
        );
        //log(e.toString());
      }
    }
  }

  RxDouble uploadProgress = 0.0.obs;

  Future<void> sendMultiFileMessage({
    required String id,
    required String channelName,
    required String messageType,
    required List<File?> files,
  }) async {
    for (var element in files) {
      ConversationMessage unsentMessage = ConversationMessage(
        message: element?.path,
        messageType: messageType,
        uid: id,
        messageFrom: 'company',
        timestamp: DateTime.now().toString(),
        platform: 'Bodsquare platform',
        createdAt: DateTime.now(),
        status: 'offline',
      );
      //log(element!.path);
      await addOfflineMessage(unsentMessage).then((value) => update);
    }

    if (files[0] != null) {
      var ff = files[0]?.path.contains('file:///');
      if (ff == true) {
        files[0] = File(files[0]!.path.replaceFirst('file://', ''));
      }
    }

    isLoading.value = true;
    var imageUrlList = await uploadMultiCloudinaryImages(files);
    for (var imageUrl in imageUrlList) {
      await sendFileMessage(
          id: id,
          message: imageUrl.secureUrl,
          messageType: messageType,
          channelName: channelName);
      isLoading.value = false;
    }
  }

  Future<List<CloudinaryResponse>> uploadMultiCloudinaryImages(
      List<File?> files) {
    Future<List<CloudinaryResponse>> uploadedImages = cloudinary.multiUpload(
      files
          .map((file) async => CloudinaryFile.fromFile(file!.path,
              resourceType: CloudinaryResourceType.Auto))
          .toList(),
    );

    return uploadedImages;
  }

  Future<void> sendFileMessage(
      {required String id,
      required String message,
      required String channelName,
      required String messageType}) async {
    final request = SendMessageRequest(
      messageType: messageType,
      message: message,
      conversationId: id,
    );

    final response = channelName.toLowerCase() == 'twitter'
        ? await _conversationRepository.sendTwitterMessage(request)
        : channelName.toLowerCase() == 'facebook'
            ? await _conversationRepository.sendFacebookMessage(request)
            : channelName.toLowerCase() == 'instagram'
                ? await _conversationRepository.sendInstagramMessage(request)
                : const ConversationModel();

    textMessageController.clear();

    if (response.status == 'success') {
      _conversationsService.conversation.value = response;
      await getSingleConversation(
        id,
      );

      getAllConversations();
    } else {
      _loadingService.showError(
        'unable to send message...',
      );
      getAllConversations();
    }
  }

  RxInt get activeConversationsListLength =>
      _conversationsService.allConversationsList
          // .where((convo) => (convo.status == 'opened'))
          .toList()
          .length
          .obs;

  RxInt get pendingConversationsListLength =>
      _conversationsService.allConversationsList
          .where((convo) => (convo.status == 'pending'))
          .toList()
          .length
          .obs;
  RxInt get closedConversationsListLength =>
      _conversationsService.allConversationsList
          .where((convo) => (convo.status == 'closed'))
          .toList()
          .length
          .obs;

  RxList<GetAllConversationsData> get activeConversationsList {
    final activeList = _conversationsService.allConversationsList
        // .where((convo) => (convo.status == 'opened'))
        .toList()
        .obs;
    activeList.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
    return activeList;
  }

  RxList<GetAllConversationsData> get pendingConversationsList {
    final pendingList = _conversationsService.allConversationsList
        .where((convo) => (convo.status == 'pending'))
        .toList()
        .obs;

    pendingList.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
    return pendingList;
  }

  RxList<GetAllConversationsData> get closedConversationsList {
    final closedList = _conversationsService.allConversationsList
        .where((convo) => (convo.status == 'closed'))
        .toList()
        .obs;

    closedList.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
    return closedList;
  }

  Rx<ConversationModel> get individualConversation =>
      _conversationsService.conversation;

  var individualConversationMessages = <ConversationMessage>[].obs;
}
