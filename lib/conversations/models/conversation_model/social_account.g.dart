// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialAccount _$SocialAccountFromJson(Map<String, dynamic> json) =>
    SocialAccount(
      id: json['id'] as int?,
      companyId: json['company_id'] as String?,
      platform: json['platform'] as String?,
      pageId: json['page_id'] as String?,
      payload: json['payload'],
      accessToken: json['access_token'],
      accessTokenSecret: json['access_token_secret'],
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SocialAccountToJson(SocialAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'platform': instance.platform,
      'page_id': instance.pageId,
      'payload': instance.payload,
      'access_token': instance.accessToken,
      'access_token_secret': instance.accessTokenSecret,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
