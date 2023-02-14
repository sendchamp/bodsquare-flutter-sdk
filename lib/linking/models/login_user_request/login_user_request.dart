import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_user_request.g.dart';

@JsonSerializable()
class LoginUserRequest extends Equatable {
  final String? email;
  final String? companyName;

  const LoginUserRequest({this.email, this.companyName});

  factory LoginUserRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginUserRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginUserRequestToJson(this);

  LoginUserRequest copyWith({
    String? email,
    String? companyName,
  }) {
    return LoginUserRequest(
      email: email ?? this.email,
      companyName: companyName ?? this.companyName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, companyName];
}
