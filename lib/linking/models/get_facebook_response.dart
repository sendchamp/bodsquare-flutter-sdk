import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_facebook_response.g.dart';

@JsonSerializable()
class GetFacebookResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;
  final List<Facebook>? data;

  const GetFacebookResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetFacebookResponse.fromJson(Map<String, dynamic> json) {
    return _$GetFacebookResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetFacebookResponseToJson(this);

  GetFacebookResponse copyWith({
    String? status,
    String? message,
    int? code,
    List<Facebook>? data,
  }) {
    return GetFacebookResponse(
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
