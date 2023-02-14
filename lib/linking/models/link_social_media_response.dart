import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'link_social_media_response.g.dart';

@JsonSerializable()
class LinkSocialMediaResponse extends Equatable {
  final String? status;
  final String? message;
  final List<Datum>? data;

  const LinkSocialMediaResponse({this.status, this.message, this.data});

  factory LinkSocialMediaResponse.fromJson(Map<String, dynamic> json) {
    return _$LinkSocialMediaResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LinkSocialMediaResponseToJson(this);

  LinkSocialMediaResponse copyWith({
    String? status,
    String? message,
    List<Datum>? data,
  }) {
    return LinkSocialMediaResponse(
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
class Datum extends Equatable {
  final int? id;
  @JsonKey(name: 'company_id')
  final String? companyId;
  final String? platform;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Datum({
    this.id,
    this.companyId,
    this.platform,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? companyId,
    String? platform,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      platform: platform ?? this.platform,
      status: status ?? this.status,
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
      companyId,
      platform,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
