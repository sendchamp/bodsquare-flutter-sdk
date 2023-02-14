// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserRequest _$LoginUserRequestFromJson(Map<String, dynamic> json) =>
    LoginUserRequest(
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$LoginUserRequestToJson(LoginUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'companyName': instance.companyName,
    };
