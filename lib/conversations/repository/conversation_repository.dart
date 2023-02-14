import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bodsquare_sdk/conversations/models/block_and_unblock_contact_request/block_and_unblock_contact_request.dart';
import 'package:bodsquare_sdk/conversations/models/close_conversation/close_conversation_request.dart';
import 'package:bodsquare_sdk/conversations/models/close_conversation/close_conversation_response.dart';
import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_model.dart';
import 'package:bodsquare_sdk/conversations/models/delete_conversation_response/delete_conversation_response.dart';
import 'package:bodsquare_sdk/conversations/models/delete_message_response/delete_message_response.dart';
import 'package:bodsquare_sdk/conversations/models/file_upload_response/file_upload_response.dart';
import 'package:bodsquare_sdk/conversations/models/get_all_conversations/get_all_conversations.dart';
import 'package:bodsquare_sdk/conversations/models/report_contact_request/report_contact_request.dart';
import 'package:bodsquare_sdk/conversations/models/report_or_block_user_response/report_or_block_user_response.dart';
import 'package:bodsquare_sdk/conversations/models/report_or_block_user_response/report_or_block_user_respponse/report_or_block_user_respponse.dart';
import 'package:bodsquare_sdk/conversations/models/search_conversation/search_conversation.dart';
import 'package:bodsquare_sdk/conversations/models/send_message_request/send_message_request.dart';
import 'package:bodsquare_sdk/conversations/repository/conversation_client.dart';
import 'package:bodsquare_sdk/helpers/token_check_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ConversationRepository {
  final ConversationClient _conversationClient =
      ConversationClient(Dio(BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $publicKeyHolder'
      //  AccessKey: "apikey"
    },
    baseUrl: kReleaseMode
        ? 'https://prod-api.bodsquare.com/api/v1'
        : 'https://staging-api.bodsquare.com/api/v1',
  ))
            ..interceptors.add(TokenCheckInterceptor())
          // ..interceptors.add(PrettyDioLogger(
          //   requestBody: true,
          //   responseBody: true,
          //   // requestHeader: true,
          // )
          // )
          );

  // ConversationClient(Get.find<HttpService>().dio);

  FutureOr<ConversationModel> getConversations({required String id}) async {
    try {
      final response = await _conversationClient.getConversations(id);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetAllConversations> getAllConversations() async {
    try {
      final response = await _conversationClient.getAllConversations();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<DeleteConversationResponse> deleteConversation(String id) async {
    try {
      final response = await _conversationClient.deleteConversation(id);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<CloseConversationResponse> closeConversation(
      CloseConversationRequest request) async {
    try {
      final response = await _conversationClient.closeConversation(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<ConversationModel> sendFacebookMessage(
    SendMessageRequest request,
  ) async {
    try {
      final response = await _conversationClient.sendFacebookMessage(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<ConversationModel> sendInstagramMessage(
    SendMessageRequest request,
  ) async {
    try {
      final response = await _conversationClient.sendInstagramMessage(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<ConversationModel> sendTwitterMessage(
    SendMessageRequest request,
  ) async {
    try {
      final response = await _conversationClient.sendTwitterMessage(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<ReportOrBlockUserResponse> blockConversation(
    BlockAndUnblockContactRequest request,
  ) async {
    try {
      final response = await _conversationClient.blockConversation(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<ReportOrBlockUserResponse> unblockConversation(
      BlockAndUnblockContactRequest request) async {
    try {
      final response = await _conversationClient.unblockConversation(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<ReportOrBlockUserRespponse> reportConversation(
      ReportContactRequest request) async {
    try {
      final response = await _conversationClient.reportConversation(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<SearchConversation> searchConversation(
      Map<String, dynamic> request) async {
    try {
      final response = await _conversationClient.searchConversation(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  /// DELETE MESSAGE

  FutureOr<DeleteMessageResponse> deleteTwitterMessage(String messageId) async {
    try {
      final response = await _conversationClient.deleteTwitterMessage(
        messageId,
      );
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<DeleteMessageResponse> deleteFacebookMessage(
      String messageId) async {
    try {
      final response = await _conversationClient.deleteFacebookMessage(
        messageId,
      );
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<DeleteMessageResponse> deleteInstagramMessage(
      String messageId) async {
    try {
      final response = await _conversationClient.deleteInstagramMessage(
        messageId,
      );
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<FileUploadResponse> uploadFile(
      File file, ProgressCallback onSendProgress) async {
    try {
      final response = await _conversationClient.uploadFile(file,
          onSendProgress: onSendProgress);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }
}
