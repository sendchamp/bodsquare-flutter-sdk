// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socketso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Socketso _$SocketsoFromJson(Map<String, dynamic> json) => Socketso(
      json['company_uid'] as String?,
      json['contact_uid'] as String?,
      json['socket_name'] as String?,
    );

Map<String, dynamic> _$SocketsoToJson(Socketso instance) => <String, dynamic>{
      'socket_name': instance.socketName,
      'company_uid': instance.companyUid,
      'contact_uid': instance.contactUid,
    };
