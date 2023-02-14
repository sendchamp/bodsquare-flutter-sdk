// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SocketModel extends Equatable {
  final String? socketName;
  final String? companyUid;
  final String? contactUid;

  const SocketModel({
    this.socketName,
    this.companyUid,
    this.contactUid,
  });

  // factory SocketModel.fromMap(Map<String, dynamic> data) => SocketModel(
  //       socketName: data['socket_name'] as String?,
  //       companyUid: data['company_uid'] as String?,
  //       contactUid: data['contact_uid'] as String?,
  //     );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'socketName': socketName,
      'companyUid': companyUid,
      'contactUid': contactUid,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SocketModel].
  // factory SocketModel.fromJson(String data) {
  //   return SocketModel.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [SocketModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SocketModel copyWith({
    String? socketName,
    String? companyUid,
    String? contactUid,
  }) {
    return SocketModel(
      socketName: socketName ?? this.socketName,
      companyUid: companyUid ?? this.companyUid,
      contactUid: contactUid ?? this.contactUid,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [socketName, companyUid, contactUid];

  factory SocketModel.fromMap(Map<String, dynamic> map) {
    return SocketModel(
      socketName:
          map['socketName'] != null ? map['socketName'] as String : null,
      companyUid:
          map['companyUid'] != null ? map['companyUid'] as String : null,
      contactUid:
          map['contactUid'] != null ? map['contactUid'] as String : null,
    );
  }

  // factory SocketModel.fromMap(Map<String, dynamic> data) => SocketModel(
  //     socketName: data['socket_name'] as String?,
  //     companyUid: data['company_uid'] as String?,
  //     contactUid: data['contact_uid'] as String?,
  //   );

  factory SocketModel.fromJson(String source) =>
      SocketModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
