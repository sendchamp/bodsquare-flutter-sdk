// import 'dart:convert';

// class GetSocialMediaConnectionRequest {
//   final String token;
//   final String platform;
//   GetSocialMediaConnectionRequest({
//     required this.token,
//     required this.platform,
//   });

//   GetSocialMediaConnectionRequest copyWith({
//     String? token,
//     String? platform,
//   }) {
//     return GetSocialMediaConnectionRequest(
//       token: token ?? this.token,
//       platform: platform ?? this.platform,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'token': token,
//       'platform': platform,
//     };
//   }

//   factory GetSocialMediaConnectionRequest.fromMap(Map<String, dynamic> map) {
//     return GetSocialMediaConnectionRequest(
//       token: map['token'] ?? '',
//       platform: map['platform'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory GetSocialMediaConnectionRequest.fromJson(String source) =>
//       GetSocialMediaConnectionRequest.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'GetSocialMediaConnectionRequest(token: $token, platform: $platform)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is GetSocialMediaConnectionRequest &&
//         other.token == token &&
//         other.platform == platform;
//   }

//   @override
//   int get hashCode => token.hashCode ^ platform.hashCode;
// }
