// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_or_block_user_respponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportOrBlockUserRespponse _$ReportOrBlockUserRespponseFromJson(
        Map<String, dynamic> json) =>
    ReportOrBlockUserRespponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportOrBlockUserRespponseToJson(
        ReportOrBlockUserRespponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      companyUid: json['company_uid'] as String?,
      contactUid: json['contact_uid'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'company_uid': instance.companyUid,
      'contact_uid': instance.contactUid,
      'reason': instance.reason,
    };
