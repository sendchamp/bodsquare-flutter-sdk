// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_social_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSocialAccount _$GetSocialAccountFromJson(Map<String, dynamic> json) =>
    GetSocialAccount(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GetSocialAccountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSocialAccountToJson(GetSocialAccount instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

GetSocialAccountData _$GetSocialAccountDataFromJson(
        Map<String, dynamic> json) =>
    GetSocialAccountData(
      facebook: (json['facebook'] as List<dynamic>?)
          ?.map((e) => Facebook.fromJson(e as Map<String, dynamic>))
          .toList(),
      twitter: (json['twitter'] as List<dynamic>?)
          ?.map((e) => Twitter.fromJson(e as Map<String, dynamic>))
          .toList(),
      instagram: (json['instagram'] as List<dynamic>?)
          ?.map((e) => Instagram.fromJson(e as Map<String, dynamic>))
          .toList(),
      whatsapp: (json['whatsapp'] as List<dynamic>?)
          ?.map((e) => WhatsappResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSocialAccountDataToJson(
        GetSocialAccountData instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'whatsapp': instance.whatsapp,
    };

Facebook _$FacebookFromJson(Map<String, dynamic> json) => Facebook(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyUid: json['company_uid'] as String?,
      pageId: json['page_id'] as String?,
      pageName: json['page_name'] as String?,
      payload: json['payload'] as String?,
      accessToken: json['access_token'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$FacebookToJson(Facebook instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_uid': instance.companyUid,
      'page_id': instance.pageId,
      'page_name': instance.pageName,
      'payload': instance.payload,
      'access_token': instance.accessToken,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Instagram _$InstagramFromJson(Map<String, dynamic> json) => Instagram(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyUid: json['company_uid'] as String?,
      pageName: json['page_name'] as String?,
      pageId: json['page_id'] as String?,
      payload: json['payload'] as String?,
      accessToken: json['access_token'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$InstagramToJson(Instagram instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_uid': instance.companyUid,
      'page_id': instance.pageId,
      'page_name': instance.pageName,
      'payload': instance.payload,
      'access_token': instance.accessToken,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Twitter _$TwitterFromJson(Map<String, dynamic> json) => Twitter(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyUid: json['company_uid'] as String?,
      pageId: json['page_id'] as String?,
      payload: json['payload'] as String?,
      accessToken: json['access_token'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TwitterToJson(Twitter instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_uid': instance.companyUid,
      'page_id': instance.pageId,
      'payload': instance.payload,
      'access_token': instance.accessToken,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
