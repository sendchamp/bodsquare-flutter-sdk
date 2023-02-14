// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_twitter_channel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTwitterChannelRequest _$AddTwitterChannelRequestFromJson(
        Map<String, dynamic> json) =>
    AddTwitterChannelRequest(
      authToken: json['auth_token'] as String?,
      authVerifier: json['auth_verifier'] as String?,
    );

Map<String, dynamic> _$AddTwitterChannelRequestToJson(
        AddTwitterChannelRequest instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken,
      'auth_verifier': instance.authVerifier,
    };
