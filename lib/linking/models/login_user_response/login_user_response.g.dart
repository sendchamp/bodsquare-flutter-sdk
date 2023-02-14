// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserResponse _$LoginUserResponseFromJson(Map<String, dynamic> json) =>
    LoginUserResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : LoginUserResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginUserResponseToJson(LoginUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

LoginUserResponseData _$LoginUserResponseDataFromJson(
        Map<String, dynamic> json) =>
    LoginUserResponseData(
      companyUid: json['company_uid'] as String?,
      apiKey: json['api_key'] as String?,
    );

Map<String, dynamic> _$LoginUserResponseDataToJson(
        LoginUserResponseData instance) =>
    <String, dynamic>{
      'company_uid': instance.companyUid,
      'api_key': instance.apiKey,
    };
