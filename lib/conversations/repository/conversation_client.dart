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
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'conversation_client.g.dart';

@RestApi()
abstract class ConversationClient {
  factory ConversationClient(Dio dio, {String? baseUrl}) = _ConversationClient;

  /// CONVERSATIONS
  @GET('/conversation/show/{id}')
  Future<ConversationModel> getConversations(@Path('id') String id);

  @GET('/conversation/list')
  Future<GetAllConversations> getAllConversations();

  @DELETE('/conversation/delete/{id}')
  Future<DeleteConversationResponse> deleteConversation(@Path('id') String id);

  @POST('/conversation/close')
  Future<CloseConversationResponse> closeConversation(
      @Body() CloseConversationRequest request);

  /// MESSAGING
  @POST('/facebook/message/send')
  Future<ConversationModel> sendFacebookMessage(
    @Body() SendMessageRequest request,
  );

  @POST('/instagram/message/send')
  Future<ConversationModel> sendInstagramMessage(
    @Body() SendMessageRequest request,
  );

  @POST('/twitter/message/send')
  Future<ConversationModel> sendTwitterMessage(
    @Body() SendMessageRequest request,
  );

  @DELETE('/twitter/message/delete/{uid}')
  Future<DeleteMessageResponse> deleteTwitterMessage(
    @Path('uid') String uid,
  );

  @DELETE('/instagram/message/delete/{uid}')
  Future<DeleteMessageResponse> deleteInstagramMessage(
    @Path('uid') String uid,
  );

  @DELETE('/facebook/message/delete/{uid}')
  Future<DeleteMessageResponse> deleteFacebookMessage(
    @Path('uid') String uid,
  );

  // @POST('/dashboard/delete-conversation-message/{conversationId}/{messageId}')
  // Future<DeleteConversationResponse> deleteConversationMessage(
  //   @Path('conversationId') String conversationId,
  //   @Path('messageId') String messageId,
  //   @Part() String token,
  // );

  /// SEARCH CONVERSATION
  @POST('/dashboard/search-conversation')
  Future<SearchConversation> searchConversation(
      @Part() Map<String, dynamic> request);

  /// REPORT, BLOCK AND UNBLOCK CONTACT
  @POST('/contact/block')
  Future<ReportOrBlockUserResponse> blockConversation(
      @Body() BlockAndUnblockContactRequest request);

  @POST('/contact/report')
  Future<ReportOrBlockUserRespponse> reportConversation(
      @Body() ReportContactRequest request);

  @POST('/contact/unblock')
  Future<ReportOrBlockUserResponse> unblockConversation(
      @Body() BlockAndUnblockContactRequest request);

  /// FILE UPLOAD
  @POST('/files/upload')
  @MultiPart()
  Future<FileUploadResponse> uploadFile(
    @Part(value: 'documents') File files, {
    @SendProgress() required ProgressCallback onSendProgress,
  });
}
