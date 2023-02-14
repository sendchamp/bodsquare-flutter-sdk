import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_message_response.g.dart';

@JsonSerializable()
class DeleteMessageResponse extends Equatable {
  final String? status;
  final int? message;
  final int? code;
  final String? data;

  const DeleteMessageResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory DeleteMessageResponse.fromJson(Map<String, dynamic> json) {
    return _$DeleteMessageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteMessageResponseToJson(this);

  DeleteMessageResponse copyWith({
    String? status,
    int? message,
    int? code,
    String? data,
  }) {
    return DeleteMessageResponse(
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
