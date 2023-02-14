import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_contact_request.g.dart';

@JsonSerializable()
class ReportContactRequest extends Equatable {
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  final String? reason;

  const ReportContactRequest({this.contactUid, this.reason});

  factory ReportContactRequest.fromJson(Map<String, dynamic> json) {
    return _$ReportContactRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportContactRequestToJson(this);

  ReportContactRequest copyWith({
    String? contactUid,
    String? reason,
  }) {
    return ReportContactRequest(
      contactUid: contactUid ?? this.contactUid,
      reason: reason ?? this.reason,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [contactUid, reason];
}
