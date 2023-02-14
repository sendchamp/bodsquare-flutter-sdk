// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'socketso.g.dart';

@JsonSerializable()
class Socketso extends Equatable {
  @JsonKey(name: 'socket_name')
  final String? socketName;
  // company_uid
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  // contact_uid
  @JsonKey(name: 'contact_uid')
  final String? contactUid;

  const Socketso(this.companyUid, this.contactUid, this.socketName);

  factory Socketso.fromJson(Map<String, dynamic> json) {
    return _$SocketsoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocketsoToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [socketName, companyUid, contactUid];

  Socketso copyWith({
    String? socketName,
    String? companyUid,
    String? contactUid,
  }) {
    return Socketso(
      socketName ?? this.socketName,
      companyUid ?? this.companyUid,
      contactUid ?? this.contactUid,
    );
  }
}
