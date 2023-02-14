import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_social_media_connection_response.g.dart';

@JsonSerializable()
class GetSocialMediaConnectionResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;
  final String? data;

  const GetSocialMediaConnectionResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetSocialMediaConnectionResponse.fromJson(Map<String, dynamic> json) {
    return _$GetSocialMediaConnectionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSocialMediaConnectionResponseToJson(this);
  }

  GetSocialMediaConnectionResponse copyWith({
    String? status,
    String? message,
    int? code,
    String? data,
  }) {
    return GetSocialMediaConnectionResponse(
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
