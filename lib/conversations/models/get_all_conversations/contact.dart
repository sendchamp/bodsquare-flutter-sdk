import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact extends Equatable {
  final int? id;
  final String? uid;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final dynamic email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'instagram_username')
  final dynamic instagramUsername;
  @JsonKey(name: 'instagram_id')
  final dynamic instagramId;
  @JsonKey(name: 'facebook_username')
  final String? facebookUsername;
  @JsonKey(name: 'facebook_id')
  final String? facebookId;
  @JsonKey(name: 'twitter_username')
  final dynamic twitterUsername;
  @JsonKey(name: 'twitter_id')
  final dynamic twitterId;
  @JsonKey(name: 'is_blocked')
  final String? isBlocked;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Contact({
    this.id,
    this.uid,
    this.companyUid,
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.instagramUsername,
    this.instagramId,
    this.facebookUsername,
    this.facebookId,
    this.twitterUsername,
    this.twitterId,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return _$ContactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  Contact copyWith({
    int? id,
    String? uid,
    String? companyUid,
    String? profilePicture,
    String? firstName,
    String? lastName,
    dynamic email,
    String? phoneNumber,
    dynamic instagramUsername,
    dynamic instagramId,
    String? facebookUsername,
    String? facebookId,
    dynamic twitterUsername,
    dynamic twitterId,
    String? isBlocked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Contact(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyUid: companyUid ?? this.companyUid,
      profilePicture: profilePicture ?? this.profilePicture,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      instagramUsername: instagramUsername ?? this.instagramUsername,
      instagramId: instagramId ?? this.instagramId,
      facebookUsername: facebookUsername ?? this.facebookUsername,
      facebookId: facebookId ?? this.facebookId,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      twitterId: twitterId ?? this.twitterId,
      isBlocked: isBlocked ?? this.isBlocked,
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
      profilePicture,
      firstName,
      lastName,
      email,
      phoneNumber,
      instagramUsername,
      instagramId,
      facebookUsername,
      facebookId,
      twitterUsername,
      twitterId,
      isBlocked,
      createdAt,
      updatedAt,
    ];
  }
}
