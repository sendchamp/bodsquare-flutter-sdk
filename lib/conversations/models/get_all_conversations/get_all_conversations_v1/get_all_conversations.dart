// import 'package:bodsquare/app/modules/conversations/models/conversation_model/conversation_data.dart';
// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'get_all_conversations.g.dart';

// @JsonSerializable()
// class GetAllConversations extends Equatable {
//   final String? status;
//   final String? message;
//   final List<ConversationData>? data;

//   const GetAllConversations({this.status, this.message, this.data});

//   factory GetAllConversations.fromJson(Map<String, dynamic> json) {
//     return _$GetAllConversationsFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$GetAllConversationsToJson(this);

//   GetAllConversations copyWith({
//     String? status,
//     String? message,
//     List<ConversationData>? data,
//   }) {
//     return GetAllConversations(
//       status: status ?? this.status,
//       message: message ?? this.message,
//       data: data ?? this.data,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [status, message, data];
// }
