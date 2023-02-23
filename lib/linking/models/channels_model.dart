// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:equatable/equatable.dart';

class ChannelModel extends Equatable {
  String? channelId;
  String? channelName;
  String? channelDescription;
  String? channelImage;
  bool? channelIsConnected;
  GetSocialAccountData? socialAccountData;
  ChannelModel({
    this.channelId,
    this.channelName,
    this.channelDescription,
    this.channelImage,
    this.channelIsConnected,
    this.socialAccountData,
  });

  ChannelModel copyWith({
    String? channelId,
    String? channelName,
    String? channelDescription,
    String? channelImage,
    bool? channelIsConnected,
    GetSocialAccountData? socialAccountData,
  }) {
    return ChannelModel(
      channelId: channelId ?? this.channelId,
      channelName: channelName ?? this.channelName,
      channelDescription: channelDescription ?? this.channelDescription,
      channelImage: channelImage ?? this.channelImage,
      channelIsConnected: channelIsConnected ?? this.channelIsConnected,
      socialAccountData: socialAccountData ?? this.socialAccountData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'channelId': channelId,
      'channelName': channelName,
      'channelDescription': channelDescription,
      'channelImage': channelImage,
      'channelIsConnected': channelIsConnected,
      'socialAccountData': socialAccountData,
    };
  }

  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      channelId: map['channelId'],
      channelName: map['channelName'],
      channelDescription: map['channelDescription'],
      channelImage: map['channelImage'],
      channelIsConnected: map['channelIsConnected'],
      socialAccountData: map['socialAccountData'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelModel.fromJson(String source) =>
      ChannelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChannelModel(channelId: $channelId, channelName: $channelName, channelDescription: $channelDescription, channelImage: $channelImage, channelIsConnected: $channelIsConnected, socialAccountData: $socialAccountData)';
  }

  @override
  List<Object?> get props {
    return [
      channelId,
      channelName,
      channelDescription,
      channelImage,
      channelIsConnected,
      socialAccountData,
    ];
  }
}
