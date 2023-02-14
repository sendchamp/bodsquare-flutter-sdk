import 'package:bodsquare_sdk/linking/models/add_social_media_response.dart';
import 'package:bodsquare_sdk/linking/models/add_facebook_or_instagram_request.dart';
import 'package:bodsquare_sdk/linking/models/add_twitter_channel_request.dart';
import 'package:bodsquare_sdk/linking/models/delete_social_media_response.dart';
import 'package:bodsquare_sdk/linking/models/get_facebook_response.dart';
import 'package:bodsquare_sdk/linking/models/get_instagram_response.dart';
import 'package:bodsquare_sdk/linking/models/get_social_media_connection_response.dart';
import 'package:bodsquare_sdk/linking/models/get_twitter_response.dart';
import 'package:bodsquare_sdk/linking/models/get_whatsapp_connection_request/get_whatsapp_connection_request.dart';
import 'package:bodsquare_sdk/linking/models/get_whatsapp_connection_response/get_whatsapp_connection_response.dart';
import 'package:bodsquare_sdk/linking/models/get_whatsapp_response/get_whatsapp_response.dart';
import 'package:bodsquare_sdk/linking/models/login_user_request/login_user_request.dart';
import 'package:bodsquare_sdk/linking/models/login_user_response/login_user_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'linking_client.g.dart';

@RestApi()
abstract class LinkingClient {
  factory LinkingClient(Dio dio, {String? baseUrl}) = _LinkingClient;

  @POST('/open/auth/login')
  Future<LoginUserResponse> loginUser(@Body() LoginUserRequest request);

  @POST('/dashboard/add-social-media-account')
  Future<AddSocialMediaResponse> addSocialMedia(
      @Part() Map<String, dynamic> socialMediaRequest);

  /// CONNECT SOCIAL MEDIA ACCOUNTS
  @POST('/twitter/account/connect')
  Future<GetTwitterResponse> addTwitterConnection(
      @Body() AddTwitterChannelRequest request);

  @POST('/facebook/account/connect')
  Future<GetFacebookResponse> addFacebookConnection(
      @Body() AddFacebookOrInstagramRequest request);

  @POST('/instagram/account/connect')
  Future<GetInstagramResponse> addInstagramConnection(
      @Body() AddFacebookOrInstagramRequest request);

  @POST('/dashboard/delete-social-account/{id}')
  Future<DeleteSocialMediaResponse> deleteSocialMedia(
      @Path() String id, @Part() Map<String, dynamic> token);

  /// DELETE SOCIAL MEDIA ACCOUNTS
  @DELETE('/twitter/account/delete/{uid}')
  Future<DeleteSocialMediaResponse> deleteTwitterConnection(@Path() String uid);

  @DELETE('/facebook/account/delete/{uid}')
  Future<DeleteSocialMediaResponse> deleteFacebookConnection(
      @Path() String uid);

  @DELETE('/instagram/account/delete/{uid}')
  Future<DeleteSocialMediaResponse> deleteInstagramConnection(
      @Path() String uid);

  @DELETE('/whatsapp/account/delete/{uid}')
  Future<DeleteSocialMediaResponse> deleteWhatsappConnection(
      @Path() String uid);

  /// GET SOCIAL MEDIA CONNECTION URL
  @GET('/twitter/connection-url/show')
  Future<GetSocialMediaConnectionResponse> getTwitterConnectionUrl();

  @GET('/facebook/connection-url/show')
  Future<GetSocialMediaConnectionResponse> getFacebookConnectionUrl();

  @GET('/instagram/connection-url/show')
  Future<GetSocialMediaConnectionResponse> getInstagramConnectionUrl();

  //whatsapp
  @POST('/whatsapp/account/connect/quick')
  Future<GetWhatsappConnectionResponse> getWhatsappConnectionUrl(
    @Body() GetWhatsappConnectionRequest request,
  );

  @GET('/whatsapp/account/connect/quick/complete?phone_number={phoneNumber}')
  Future<DeleteSocialMediaResponse> completeWhatsappConnection(
    @Path() String phoneNumber,
  );

  /// GET SOCIAL MEDIA ACCOUNTS
  @GET('/instagram/account/list')
  Future<GetInstagramResponse> getInstagramAccounts();

  @GET('/facebook/account/list')
  Future<GetFacebookResponse> getFacebookAccounts();

  @GET('/twitter/account/list')
  Future<GetTwitterResponse> getTwitterAccounts();

  @GET('/whatsapp/account/connections')
  Future<GetWhatsappResponse> getWhatsappAccounts();
}
