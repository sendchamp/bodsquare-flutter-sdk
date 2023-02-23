import 'dart:async';

import 'package:bodsquare_sdk/helpers/token_check_interceptor.dart';
import 'package:bodsquare_sdk/linking/models/get_whatsapp_connection_request/get_whatsapp_connection_request.dart';
import 'package:bodsquare_sdk/linking/models/get_whatsapp_connection_response/get_whatsapp_connection_response.dart';
import 'package:bodsquare_sdk/linking/models/login_user_request/login_user_request.dart';
import 'package:bodsquare_sdk/linking/models/login_user_response/login_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:bodsquare_sdk/linking/models/add_facebook_or_instagram_request.dart';
import 'package:bodsquare_sdk/linking/models/add_social_media_response.dart';
import 'package:bodsquare_sdk/linking/models/add_twitter_channel_request.dart';
import 'package:bodsquare_sdk/linking/models/delete_social_media_response.dart';
import 'package:bodsquare_sdk/linking/models/get_facebook_response.dart';
import 'package:bodsquare_sdk/linking/models/get_instagram_response.dart';
import 'package:bodsquare_sdk/linking/models/get_social_media_connection_response.dart';
import 'package:bodsquare_sdk/linking/models/get_twitter_response.dart';
import 'package:bodsquare_sdk/linking/models/get_whatsapp_response/get_whatsapp_response.dart';
import 'package:bodsquare_sdk/linking/repository/linking_client.dart';

class LinkingRepository {
  final LinkingClient _linkingClient = LinkingClient(Dio(BaseOptions(
    headers: {},
    baseUrl: kReleaseMode
        ? 'https://prod-api.bodsquare.com/api/v1'
        : 'https://staging-api.bodsquare.com/api/v1',
  ))
        ..interceptors.add(TokenCheckInterceptor())
      // ..interceptors.add(PrettyDioLogger(
      //   requestBody: true,
      //   responseBody: true,
      //   // requestHeader: true,
      // ))
      );

  FutureOr<LoginUserResponse> loginUser(LoginUserRequest request) async {
    try {
      final response = await _linkingClient.loginUser(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());

      rethrow;
    }
  }

  /// DELETE SOCIAL MEDIA ACCOUNTS
  FutureOr<DeleteSocialMediaResponse> deleteSocialMedia(
      String id, Map<String, dynamic> request) async {
    try {
      final response = await _linkingClient.deleteSocialMedia(id, request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<DeleteSocialMediaResponse> deleteTwitterConnection(
      String uid) async {
    try {
      final response = await _linkingClient.deleteTwitterConnection(uid);
      //log(response.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<DeleteSocialMediaResponse> deleteFacebookConnection(
      String uid) async {
    try {
      final response = await _linkingClient.deleteFacebookConnection(uid);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  //whatsapp
  FutureOr<DeleteSocialMediaResponse> deleteWhatsappConnection(
      String uid) async {
    try {
      final response = await _linkingClient.deleteWhatsappConnection(uid);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<DeleteSocialMediaResponse> deleteInstagramConnection(
      String uid) async {
    try {
      final response = await _linkingClient.deleteInstagramConnection(uid);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  /// GET SOCIAL MEDIA CONNECTION URL
  FutureOr<GetSocialMediaConnectionResponse> getTwitterConnectionUrl() async {
    try {
      final response = await _linkingClient.getTwitterConnectionUrl();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetSocialMediaConnectionResponse> getFacebookConnectionUrl() async {
    try {
      final response = await _linkingClient.getFacebookConnectionUrl();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetSocialMediaConnectionResponse> getInstagramConnectionUrl() async {
    try {
      final response = await _linkingClient.getInstagramConnectionUrl();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  //whatsapp
  FutureOr<GetWhatsappConnectionResponse> getWhatsappConnectionUrl(
      GetWhatsappConnectionRequest request) async {
    try {
      final response = await _linkingClient.getWhatsappConnectionUrl(request);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<DeleteSocialMediaResponse> completeWhatsappConnection(
      String phoneNumber) {
    try {
      final response = _linkingClient.completeWhatsappConnection(phoneNumber);
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<AddSocialMediaResponse> addSocialMediaConnection(
      Map<String, dynamic> request) async {
    try {
      final response = await _linkingClient.addSocialMedia(request);
      //log(response.toString());

      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  /// CONNECT SOCIAL MEDIA CHANNELS
  FutureOr<GetTwitterResponse> addTwitterConnection(
      AddTwitterChannelRequest request) async {
    try {
      final response = await _linkingClient.addTwitterConnection(request);
      //log(response.toString());

      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetFacebookResponse> addFacebookConnection(
      AddFacebookOrInstagramRequest request) async {
    try {
      final response = await _linkingClient.addFacebookConnection(request);
      //log(response.toString());

      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetInstagramResponse> addInstagramConnection(
      AddFacebookOrInstagramRequest request) async {
    try {
      final response = await _linkingClient.addInstagramConnection(request);
      //log(response.toString());

      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  /// GET SOCIAL MEDIA ACCOUNTS
  FutureOr<GetInstagramResponse> getInstagramAccounts() async {
    try {
      final response = await _linkingClient.getInstagramAccounts();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetFacebookResponse> getFacebookAccounts() async {
    try {
      final response = await _linkingClient.getFacebookAccounts();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetTwitterResponse> getTwitterAccounts() async {
    try {
      final response = await _linkingClient.getTwitterAccounts();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }

  FutureOr<GetWhatsappResponse> getWhatsappAccounts() async {
    try {
      final response = await _linkingClient.getWhatsappAccounts();
      //log(response.toString());
      return response;
    } catch (e) {
      //log(e.toString());
      rethrow;
    }
  }
}
