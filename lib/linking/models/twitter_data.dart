import 'dart:convert';

import 'package:equatable/equatable.dart';

class TwitterData extends Equatable {
  final String? oAuthVerifier;
  final String? oAuthToken;
  TwitterData({
    this.oAuthVerifier,
    this.oAuthToken,
  });

  TwitterData copyWith({
    String? oAuthVerifier,
    String? oAuthToken,
  }) {
    return TwitterData(
      oAuthVerifier: oAuthVerifier ?? this.oAuthVerifier,
      oAuthToken: oAuthToken ?? this.oAuthToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'oAuthVerifier': oAuthVerifier,
      'oAuthToken': oAuthToken,
    };
  }

  factory TwitterData.fromMap(Map<String, dynamic> map) {
    return TwitterData(
      oAuthVerifier: map['oAuthVerifier'],
      oAuthToken: map['oAuthToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TwitterData.fromJson(String source) =>
      TwitterData.fromMap(json.decode(source));

  @override
  String toString() =>
      'TwitterData(oAuthVerifier: $oAuthVerifier, oAuthToken: $oAuthToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TwitterData &&
        other.oAuthVerifier == oAuthVerifier &&
        other.oAuthToken == oAuthToken;
  }

  @override
  int get hashCode => oAuthVerifier.hashCode ^ oAuthToken.hashCode;

  @override
  List<Object?> get props => [oAuthVerifier, oAuthToken];
}
