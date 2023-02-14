import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_message.dart';
import 'package:bodsquare_sdk/conversations/models/get_all_conversations/get_all_conversations.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:bodsquare_sdk/helpers/socketso.dart';
import 'package:bodsquare_sdk/helpers/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/io.dart';

import 'websocket_new_message/websocket_new_message.dart';
import 'websocket_updated_conversation/websocket_updated_conversation.dart';

class WebSocketService extends GetxService {
  IOWebSocketChannel? channel;
  RxBool isConnected = RxBool(false);
  ConversationMessage? convoMessage;
  StorageService _storageService = StorageService();

  final ConversationsController _conversationsController = Get.put(
      ConversationsController(
          loadingService: Get.put(LoadingService(context: Get.context))));
  // final BodSquareAppData _bodSquareAppData = Get.put(BodSquareAppData());

  @override
  Future<void> onInit() async {
    super.onInit();

    channelconnect();
  }

  channelconnect() async {
    // var businessUId = _bodSquareAppData.companyInformation.value.data?.uid;

    // //log('businessUId: ${kReleaseMode ? "wss://prod-api.bodsquare.com/$businessUId" : "wss://staging-api.bodsquare.com/$businessUId"}');

    int? counter;

    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //log("Internet Active");

      final String businessUid = await _storageService.getString('companyUid');

      try {
        //log('businessUid: $businessUid');
        await Future.delayed(const Duration(seconds: 10));
        channel = IOWebSocketChannel.connect(
          // "ws://178.62.97.4:3004",
          kReleaseMode
              ? "wss://prod-api.bodsquare.com/$businessUid"
              : "wss://staging-api.bodsquare.com/$businessUid",

          pingInterval: const Duration(seconds: 10),
        ); //channel IP : Port
        isConnected.value = true;
        channel?.stream.listen(
          (message) async {
            //log(message);
            //log('counter: ${counter ?? 0 + 1}');

            var fina = jsonDecode(message);
            final name = Socketso.fromJson(fina);

            if (name.socketName == 'newMessage' &&
                _conversationsController.singleConversation.value &&
                name.contactUid ==
                    _conversationsController.currentContactId.value) {
              final value = WebsocketNewMessage.fromJson(fina);
              final json = jsonEncode(value.data);
              convoMessage = ConversationMessage.fromJson(jsonDecode(json));

              _conversationsController.updateOfflineMessagesFromSocket(
                  _conversationsController.currentConversationId.toString(),
                  convoMessage ?? const ConversationMessage());

              //log('inside web socket');
              // _conversationsController.getSingleConversation(
              //     _conversationsController.currentConversationId.value);
            } else if (name.socketName == 'updatedConversation') {
              final value = WebsocketUpdatedConversation.fromJson(fina);
              final formattedValue = jsonEncode(value.data);

              GetAllConversationsData conversations =
                  GetAllConversationsData.fromJson(jsonDecode(formattedValue));
              _conversationsController.getOfflineConversation(conversations);

              _conversationsController.update();
            }
          },
          onDone: () {
            //log("Web socket is closed");
            isConnected.value = false;
            channelconnect();
          },
          onError: (error) {
            //log(error.toString());
            isConnected.value = false;
            channelconnect();
          },
        );
      } catch (_) {
        //log("error on connecting to websocket.");
        isConnected.value = false;
        channelconnect();
      }
    } else {
      //log("No network coverage");
    }
  }

  @override
  void onClose() {
    channel?.sink.close();

    super.onClose();
    //log('info: web socket disposed');
  }

  sendMessageThroughWebSocket() {
    if (isConnected.value) {
      channel?.sink.add('');
    }
  }
}