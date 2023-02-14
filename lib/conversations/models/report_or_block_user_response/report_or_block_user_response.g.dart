// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_or_block_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportOrBlockUserResponse _$ReportOrBlockUserResponseFromJson(
        Map<String, dynamic> json) =>
    ReportOrBlockUserResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$ReportOrBlockUserResponseToJson(
        ReportOrBlockUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
