// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_facebook_or_instagram_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFacebookOrInstagramRequest _$AddFacebookOrInstagramRequestFromJson(
        Map<String, dynamic> json) =>
    AddFacebookOrInstagramRequest(
      accessToken: json['access_token'] as String?,
      pageId: json['page_id'] as String?,
      pageName: json['page_name'] as String?,
    );

Map<String, dynamic> _$AddFacebookOrInstagramRequestToJson(
        AddFacebookOrInstagramRequest instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'page_id': instance.pageId,
      'page_name': instance.pageName,
    };
