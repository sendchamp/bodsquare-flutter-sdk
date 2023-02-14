import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_user_response.g.dart';

@JsonSerializable()
class LoginUserResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;
  final LoginUserResponseData? data;

  const LoginUserResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginUserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginUserResponseToJson(this);

  LoginUserResponse copyWith({
    String? status,
    String? message,
    int? code,
    LoginUserResponseData? data,
  }) {
    return LoginUserResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, code, data];
}

@JsonSerializable()
class LoginUserResponseData extends Equatable {
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'api_key')
  final String? apiKey;

  const LoginUserResponseData({this.companyUid, this.apiKey});

  factory LoginUserResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseDataToJson(this);

  LoginUserResponseData copyWith({
    String? companyUid,
    String? apiKey,
  }) {
    return LoginUserResponseData(
      companyUid: companyUid ?? this.companyUid,
      apiKey: apiKey ?? this.apiKey,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [companyUid, apiKey];
}
