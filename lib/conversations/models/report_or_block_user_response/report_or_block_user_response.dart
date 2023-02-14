import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_or_block_user_response.g.dart';

@JsonSerializable()
class ReportOrBlockUserResponse extends Equatable {
  final String? status;
  final String? message;
  final List<dynamic>? data;

  const ReportOrBlockUserResponse({this.status, this.message, this.data});

  factory ReportOrBlockUserResponse.fromJson(Map<String, dynamic> json) {
    return _$ReportOrBlockUserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportOrBlockUserResponseToJson(this);

  ReportOrBlockUserResponse copyWith({
    String? status,
    String? message,
    List<dynamic>? data,
  }) {
    return ReportOrBlockUserResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, data];
}
