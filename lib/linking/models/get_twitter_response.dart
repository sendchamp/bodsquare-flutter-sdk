import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_twitter_response.g.dart';

@JsonSerializable()
class GetTwitterResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;
  final List<Twitter>? data;

  const GetTwitterResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetTwitterResponse.fromJson(Map<String, dynamic> json) {
    return _$GetTwitterResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTwitterResponseToJson(this);

  GetTwitterResponse copyWith({
    String? status,
    String? message,
    int? code,
    List<Twitter>? data,
  }) {
    return GetTwitterResponse(
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
