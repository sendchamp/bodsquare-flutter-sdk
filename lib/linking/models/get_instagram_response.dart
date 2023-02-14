import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_instagram_response.g.dart';

@JsonSerializable()
class GetInstagramResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;
  final List<Instagram>? data;

  const GetInstagramResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetInstagramResponse.fromJson(Map<String, dynamic> json) {
    return _$GetInstagramResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetInstagramResponseToJson(this);

  GetInstagramResponse copyWith({
    String? status,
    String? message,
    int? code,
    List<Instagram>? data,
  }) {
    return GetInstagramResponse(
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
