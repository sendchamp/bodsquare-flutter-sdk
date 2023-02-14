import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_whatsapp_response.g.dart';

@JsonSerializable()
class GetWhatsappResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;
  final List<WhatsappResponseData>? data;

  const GetWhatsappResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetWhatsappResponse.fromJson(Map<String, dynamic> json) {
    return _$GetWhatsappResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetWhatsappResponseToJson(this);

  GetWhatsappResponse copyWith({
    String? status,
    String? message,
    int? code,
    List<WhatsappResponseData>? data,
  }) {
    return GetWhatsappResponse(
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

@JsonSerializable()
class WhatsappResponseData extends Equatable {
  final int? id;
  final String? uid;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'display_name')
  final String? displayName;
  @JsonKey(name: 'facebook_bmid')
  final String? facebookBmid;
  @JsonKey(name: 'is_approved')
  final bool? isApproved;
  @JsonKey(name: 'provider_identifier')
  final dynamic providerIdentifier;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const WhatsappResponseData({
    this.id,
    this.uid,
    this.companyUid,
    this.phoneNumber,
    this.displayName,
    this.facebookBmid,
    this.isApproved,
    this.providerIdentifier,
    this.createdAt,
    this.updatedAt,
  });

  factory WhatsappResponseData.fromJson(Map<String, dynamic> json) =>
      _$WhatsappResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$WhatsappResponseDataToJson(this);

  WhatsappResponseData copyWith({
    int? id,
    String? uid,
    String? companyUid,
    String? phoneNumber,
    String? displayName,
    String? facebookBmid,
    bool? isApproved,
    dynamic providerIdentifier,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WhatsappResponseData(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyUid: companyUid ?? this.companyUid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      displayName: displayName ?? this.displayName,
      facebookBmid: facebookBmid ?? this.facebookBmid,
      isApproved: isApproved ?? this.isApproved,
      providerIdentifier: providerIdentifier ?? this.providerIdentifier,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      uid,
      companyUid,
      phoneNumber,
      displayName,
      facebookBmid,
      isApproved,
      providerIdentifier,
      createdAt,
      updatedAt,
    ];
  }
}
