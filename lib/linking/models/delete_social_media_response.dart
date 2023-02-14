import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_social_media_response.g.dart';

@JsonSerializable()
class DeleteSocialMediaResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;

  const DeleteSocialMediaResponse({this.status, this.message, this.code});

  factory DeleteSocialMediaResponse.fromJson(Map<String, dynamic> json) {
    return _$DeleteSocialMediaResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteSocialMediaResponseToJson(this);

  DeleteSocialMediaResponse copyWith({
    String? status,
    String? message,
    int? code,
  }) {
    return DeleteSocialMediaResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      code: code ?? this.code,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, code];
}
