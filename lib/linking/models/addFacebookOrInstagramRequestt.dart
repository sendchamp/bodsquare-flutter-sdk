// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class AddFaceBookOrInstagramRequest extends Equatable {
//   final String platform;
//   final String token;
//   final String page_id;
//   final String page_name;
//   final String access_token;
//   AddFaceBookOrInstagramRequest({
//     required this.platform,
//     required this.token,
//     required this.page_id,
//     required this.page_name,
//     required this.access_token,
//   });

//   AddFaceBookOrInstagramRequest copyWith({
//     String? platform,
//     String? token,
//     String? page_id,
//     String? page_name,
//     String? access_token,
//   }) {
//     return AddFaceBookOrInstagramRequest(
//       platform: platform ?? this.platform,
//       token: token ?? this.token,
//       page_id: page_id ?? this.page_id,
//       page_name: page_name ?? this.page_name,
//       access_token: access_token ?? this.access_token,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'platform': platform,
//       'token': token,
//       'page_id': page_id,
//       'page_name': page_name,
//       'access_token': access_token,
//     };
//   }

//   factory AddFaceBookOrInstagramRequest.fromMap(Map<String, dynamic> map) {
//     return AddFaceBookOrInstagramRequest(
//       platform: map['platform'] ?? '',
//       token: map['token'] ?? '',
//       page_id: map['page_id'] ?? '',
//       page_name: map['page_name'] ?? '',
//       access_token: map['access_token'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AddFaceBookOrInstagramRequest.fromJson(String source) =>
//       AddFaceBookOrInstagramRequest.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'AddFaceBookOrInstagramRequest(platform: $platform, token: $token, page_id: $page_id, page_name: $page_name, access_token: $access_token)';
//   }

//   @override
//   List<Object> get props => [platform, token, page_id, page_name, access_token];
// }
