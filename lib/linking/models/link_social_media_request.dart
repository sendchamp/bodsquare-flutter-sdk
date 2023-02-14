import 'dart:convert';

class LinkSocialMediaRequest {
  LinkSocialMediaRequest({
    required this.socialToken,
    required this.platform,
    required this.token,
  });

  final String socialToken;
  final String platform;
  final String token;

  LinkSocialMediaRequest copyWith({
    String? socialToken,
    String? platform,
    String? token,
  }) {
    return LinkSocialMediaRequest(
      socialToken: socialToken ?? this.socialToken,
      platform: platform ?? this.platform,
      token: token ?? this.token,
    );
  }

  @override
  String toString() =>
      'LinkSocialMediaRequest(socialToken: $socialToken, platform: $platform, token: $token)';

  Map<String, dynamic> toMap() {
    return {
      'socialToken': socialToken,
      'platform': platform,
      'token': token,
    };
  }

  factory LinkSocialMediaRequest.fromMap(Map<String, dynamic> map) {
    return LinkSocialMediaRequest(
      socialToken: map['socialToken'] ?? '',
      platform: map['platform'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LinkSocialMediaRequest.fromJson(String source) =>
      LinkSocialMediaRequest.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LinkSocialMediaRequest &&
        other.socialToken == socialToken &&
        other.platform == platform &&
        other.token == token;
  }

  @override
  int get hashCode => socialToken.hashCode ^ platform.hashCode ^ token.hashCode;
}
