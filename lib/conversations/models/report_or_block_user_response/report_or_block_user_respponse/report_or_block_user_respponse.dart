import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_or_block_user_respponse.g.dart';

@JsonSerializable()
class ReportOrBlockUserRespponse extends Equatable {
  final String? status;
  final String? message;
  final Data? data;

  const ReportOrBlockUserRespponse({this.status, this.message, this.data});

  factory ReportOrBlockUserRespponse.fromJson(Map<String, dynamic> json) {
    return _$ReportOrBlockUserRespponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportOrBlockUserRespponseToJson(this);

  ReportOrBlockUserRespponse copyWith({
    String? status,
    String? message,
    Data? data,
  }) {
    return ReportOrBlockUserRespponse(
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

@JsonSerializable()
class Data extends Equatable {
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  final String? reason;

  const Data({this.companyUid, this.contactUid, this.reason});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? companyUid,
    String? contactUid,
    String? reason,
  }) {
    return Data(
      companyUid: companyUid ?? this.companyUid,
      contactUid: contactUid ?? this.contactUid,
      reason: reason ?? this.reason,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [companyUid, contactUid, reason];
}
