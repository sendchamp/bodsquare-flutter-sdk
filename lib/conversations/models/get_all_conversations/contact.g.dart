// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyUid: json['company_uid'] as String?,
      profilePicture: json['profile_picture'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'],
      phoneNumber: json['phone_number'] as String?,
      instagramUsername: json['instagram_username'],
      instagramId: json['instagram_id'],
      facebookUsername: json['facebook_username'] as String?,
      facebookId: json['facebook_id'] as String?,
      twitterUsername: json['twitter_username'],
      twitterId: json['twitter_id'],
      isBlocked: json['is_blocked'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_uid': instance.companyUid,
      'profile_picture': instance.profilePicture,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'instagram_username': instance.instagramUsername,
      'instagram_id': instance.instagramId,
      'facebook_username': instance.facebookUsername,
      'facebook_id': instance.facebookId,
      'twitter_username': instance.twitterUsername,
      'twitter_id': instance.twitterId,
      'is_blocked': instance.isBlocked,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
