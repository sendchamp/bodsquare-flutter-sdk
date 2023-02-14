// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportContactRequest _$ReportContactRequestFromJson(
        Map<String, dynamic> json) =>
    ReportContactRequest(
      contactUid: json['contact_uid'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ReportContactRequestToJson(
        ReportContactRequest instance) =>
    <String, dynamic>{
      'contact_uid': instance.contactUid,
      'reason': instance.reason,
    };
