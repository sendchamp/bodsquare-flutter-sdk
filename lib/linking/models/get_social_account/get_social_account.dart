import 'package:bodsquare_sdk/linking/models/get_whatsapp_response/get_whatsapp_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_social_account.g.dart';

@JsonSerializable()
class GetSocialAccount extends Equatable {
  final String? status;
  final String? message;
  final GetSocialAccountData? data;

  const GetSocialAccount({this.status, this.message, this.data});

  factory GetSocialAccount.fromJson(Map<String, dynamic> json) {
    return _$GetSocialAccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSocialAccountToJson(this);

  GetSocialAccount copyWith({
    String? status,
    String? message,
    GetSocialAccountData? data,
  }) {
    return GetSocialAccount(
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
class GetSocialAccountData extends Equatable {
  final List<Facebook>? facebook;
  final List<Twitter>? twitter;
  final List<Instagram>? instagram;
  final List<WhatsappResponseData>? whatsapp;

  const GetSocialAccountData(
      {this.facebook, this.twitter, this.instagram, this.whatsapp});

  factory GetSocialAccountData.fromJson(Map<String, dynamic> json) =>
      _$GetSocialAccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetSocialAccountDataToJson(this);

  GetSocialAccountData copyWith({
    List<Facebook>? facebook,
    List<Twitter>? twitter,
    List<Instagram>? instagram,
    List<WhatsappResponseData>? whatsapp,
  }) {
    return GetSocialAccountData(
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      instagram: instagram ?? this.instagram,
      whatsapp: whatsapp ?? this.whatsapp,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [facebook, twitter, instagram, whatsapp];
}

@JsonSerializable()
class Facebook extends Equatable {
  final int? id;
  final String? uid;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'page_id')
  final String? pageId;
  @JsonKey(name: 'page_name')
  final String? pageName;
  final String? payload;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Facebook({
    this.id,
    this.uid,
    this.companyUid,
    this.pageId,
    this.pageName,
    this.payload,
    this.accessToken,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Facebook.fromJson(Map<String, dynamic> json) {
    return _$FacebookFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FacebookToJson(this);

  Facebook copyWith({
    int? id,
    String? uid,
    String? companyUid,
    String? pageId,
    String? pageName,
    String? payload,
    String? accessToken,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Facebook(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyUid: companyUid ?? this.companyUid,
      pageId: pageId ?? this.pageId,
      pageName: pageName ?? this.pageName,
      payload: payload ?? this.payload,
      accessToken: accessToken ?? this.accessToken,
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
      uid,
      companyUid,
      pageId,
      pageName,
      payload,
      accessToken,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

@JsonSerializable()
class Instagram extends Equatable {
  final int? id;
  final String? uid;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'page_id')
  final String? pageId;
  @JsonKey(name: 'page_name')
  final String? pageName;
  final String? payload;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Instagram({
    this.id,
    this.uid,
    this.companyUid,
    this.pageName,
    this.pageId,
    this.payload,
    this.accessToken,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Instagram.fromJson(Map<String, dynamic> json) {
    return _$InstagramFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InstagramToJson(this);

  Instagram copyWith({
    int? id,
    String? uid,
    String? companyUid,
    String? pageId,
    String? pageName,
    String? payload,
    String? accessToken,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Instagram(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyUid: companyUid ?? this.companyUid,
      pageId: pageId ?? this.pageId,
      pageName: pageName ?? this.pageName,
      payload: payload ?? this.payload,
      accessToken: accessToken ?? this.accessToken,
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
      uid,
      companyUid,
      pageId,
      pageName,
      payload,
      accessToken,
      status,
      createdAt,
      updatedAt,
    ];
  }
}

@JsonSerializable()
class Twitter extends Equatable {
  final int? id;
  final String? uid;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'page_id')
  final String? pageId;
  final String? payload;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Twitter({
    this.id,
    this.uid,
    this.companyUid,
    this.pageId,
    this.payload,
    this.accessToken,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Twitter.fromJson(Map<String, dynamic> json) {
    return _$TwitterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TwitterToJson(this);

  Twitter copyWith({
    int? id,
    String? uid,
    String? companyUid,
    String? pageId,
    String? payload,
    String? accessToken,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Twitter(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyUid: companyUid ?? this.companyUid,
      pageId: pageId ?? this.pageId,
      payload: payload ?? this.payload,
      accessToken: accessToken ?? this.accessToken,
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
      uid,
      companyUid,
      pageId,
      payload,
      accessToken,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
