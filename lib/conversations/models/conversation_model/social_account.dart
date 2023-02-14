import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'social_account.g.dart';

@JsonSerializable()
class SocialAccount extends Equatable {
  final int? id;
  @JsonKey(name: 'company_id')
  final String? companyId;
  final String? platform;
  @JsonKey(name: 'page_id')
  final String? pageId;
  final dynamic payload;
  @JsonKey(name: 'access_token')
  final dynamic accessToken;
  @JsonKey(name: 'access_token_secret')
  final dynamic accessTokenSecret;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const SocialAccount({
    this.id,
    this.companyId,
    this.platform,
    this.pageId,
    this.payload,
    this.accessToken,
    this.accessTokenSecret,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SocialAccount.fromJson(Map<String, dynamic> json) {
    return _$SocialAccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SocialAccountToJson(this);

  SocialAccount copyWith({
    int? id,
    String? companyId,
    String? platform,
    String? pageId,
    dynamic payload,
    dynamic accessToken,
    dynamic accessTokenSecret,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SocialAccount(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      platform: platform ?? this.platform,
      pageId: pageId ?? this.pageId,
      payload: payload ?? this.payload,
      accessToken: accessToken ?? this.accessToken,
      accessTokenSecret: accessTokenSecret ?? this.accessTokenSecret,
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
      pageId,
      payload,
      accessToken,
      accessTokenSecret,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
