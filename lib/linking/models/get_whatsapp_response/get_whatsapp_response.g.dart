// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_whatsapp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWhatsappResponse _$GetWhatsappResponseFromJson(Map<String, dynamic> json) =>
    GetWhatsappResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WhatsappResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetWhatsappResponseToJson(
        GetWhatsappResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

WhatsappResponseData _$WhatsappResponseDataFromJson(
        Map<String, dynamic> json) =>
    WhatsappResponseData(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyUid: json['company_uid'] as String?,
      phoneNumber: json['phone_number'] as String?,
      displayName: json['display_name'] as String?,
      facebookBmid: json['facebook_bmid'] as String?,
      isApproved: json['is_approved'] as bool?,
      providerIdentifier: json['provider_identifier'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WhatsappResponseDataToJson(
        WhatsappResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_uid': instance.companyUid,
      'phone_number': instance.phoneNumber,
      'display_name': instance.displayName,
      'facebook_bmid': instance.facebookBmid,
      'is_approved': instance.isApproved,
      'provider_identifier': instance.providerIdentifier,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
