// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_whatsapp_connection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWhatsappConnectionResponse _$GetWhatsappConnectionResponseFromJson(
        Map<String, dynamic> json) =>
    GetWhatsappConnectionResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : GetWhatsappConnectionResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetWhatsappConnectionResponseToJson(
        GetWhatsappConnectionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

GetWhatsappConnectionResponseData _$GetWhatsappConnectionResponseDataFromJson(
        Map<String, dynamic> json) =>
    GetWhatsappConnectionResponseData(
      qrcode: json['qrcode'] as String?,
    );

Map<String, dynamic> _$GetWhatsappConnectionResponseDataToJson(
        GetWhatsappConnectionResponseData instance) =>
    <String, dynamic>{
      'qrcode': instance.qrcode,
    };
