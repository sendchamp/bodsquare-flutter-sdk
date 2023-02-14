// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'conversation_message.g.dart';

// @JsonSerializable()
// class ConversationMessage extends Equatable {
//   final int? id;
//   @JsonKey(name: 'chat_head_id')
//   final String? chatHeadId;
//   final String? message;
//   @JsonKey(name: 'message_uid')
//   final String? messageUid;
//   @JsonKey(name: 'message_type')
//   final String? messageType;
//   @JsonKey(name: 'message_from')
//   final dynamic messageFrom;
//   @JsonKey(name: 'time_received')
//   final String? timeReceived;
//   @JsonKey(name: 'date_received')
//   final String? dateReceived;
//   final String? status;
//   @JsonKey(name: 'created_at')
//   final DateTime? createdAt;
//   @JsonKey(name: 'updated_at')
//   final DateTime? updatedAt;
//   final List<dynamic>? replies;

//   const ConversationMessage({
//     this.id,
//     this.chatHeadId,
//     this.message,
//     this.messageUid,
//     this.messageType,
//     this.messageFrom,
//     this.timeReceived,
//     this.dateReceived,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.replies,
//   });

//   factory ConversationMessage.fromJson(Map<String, dynamic> json) {
//     return _$ConversationMessageFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$ConversationMessageToJson(this);

//   ConversationMessage copyWith({
//     int? id,
//     String? chatHeadId,
//     String? message,
//     String? messageUid,
//     String? messageType,
//     dynamic messageFrom,
//     String? timeReceived,
//     String? dateReceived,
//     String? status,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     List<dynamic>? replies,
//   }) {
//     return ConversationMessage(
//       id: id ?? this.id,
//       chatHeadId: chatHeadId ?? this.chatHeadId,
//       message: message ?? this.message,
//       messageUid: messageUid ?? this.messageUid,
//       messageType: messageType ?? this.messageType,
//       messageFrom: messageFrom ?? this.messageFrom,
//       timeReceived: timeReceived ?? this.timeReceived,
//       dateReceived: dateReceived ?? this.dateReceived,
//       status: status ?? this.status,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//       replies: replies ?? this.replies,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       chatHeadId,
//       message,
//       messageUid,
//       messageType,
//       messageFrom,
//       timeReceived,
//       dateReceived,
//       status,
//       createdAt,
//       updatedAt,
//       replies,
//     ];
//   }
// }
