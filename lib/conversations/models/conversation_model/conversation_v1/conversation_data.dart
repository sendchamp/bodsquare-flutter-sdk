// import 'package:bodsquare/app/modules/conversations/models/conversation_model/conversation_message.dart';
// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'social_account.dart';

// part 'conversation_data.g.dart';

// @JsonSerializable()
// class ConversationData extends Equatable {
//   final int? id;
//   @JsonKey(name: 'company_id')
//   final String? companyId;
//   @JsonKey(name: 'social_account_id')
//   final String? socialAccountId;
//   @JsonKey(name: 'contact_id')
//   final dynamic contactId;
//   @JsonKey(name: 'sender_id')
//   final String? senderId;
//   @JsonKey(name: 'sender_name')
//   final String? senderName;
//   @JsonKey(name: 'sender_photo')
//   final String? senderPhoto;
//   @JsonKey(name: 'receiver_id')
//   final String? receiverId;
//   @JsonKey(name: 'receiver_name')
//   final String? receiverName;
//   @JsonKey(name: 'receiver_photo')
//   final String? receiverPhoto;
//   @JsonKey(name: 'last_message')
//   final String? lastMessage;
//   @JsonKey(name: 'last_message_type')
//   final String? lastMessageType;
//   @JsonKey(name: 'messages_unseen')
//   final String? messagesUnseen;
//   @JsonKey(name: 'profile_photo')
//   final String? profilePhoto;
//   final String? status;
//   @JsonKey(name: 'created_at')
//   final DateTime? createdAt;
//   @JsonKey(name: 'updated_at')
//   final DateTime? updatedAt;
//   @JsonKey(name: 'social_account')
//   final SocialAccount? socialAccount;
//   @JsonKey(name: 'messages')
//   final List<ConversationMessage>? messages;

//   const ConversationData({
//     this.id,
//     this.companyId,
//     this.socialAccountId,
//     this.contactId,
//     this.senderId,
//     this.senderName,
//     this.senderPhoto,
//     this.receiverId,
//     this.receiverName,
//     this.receiverPhoto,
//     this.lastMessage,
//     this.lastMessageType,
//     this.messagesUnseen,
//     this.profilePhoto,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.socialAccount,
//     this.messages,
//   });

//   factory ConversationData.fromJson(Map<String, dynamic> json) =>
//       _$ConversationDataFromJson(json);

//   Map<String, dynamic> toJson() => _$ConversationDataToJson(this);

//   ConversationData copyWith({
//     int? id,
//     String? companyId,
//     String? socialAccountId,
//     dynamic contactId,
//     String? senderId,
//     String? senderName,
//     String? senderPhoto,
//     String? receiverId,
//     String? receiverName,
//     String? receiverPhoto,
//     String? lastMessage,
//     String? lastMessageType,
//     String? messagesUnseen,
//     String? profilePhoto,
//     String? status,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     SocialAccount? socialAccount,
//     List<ConversationMessage>? messages,
//   }) {
//     return ConversationData(
//       id: id ?? this.id,
//       companyId: companyId ?? this.companyId,
//       socialAccountId: socialAccountId ?? this.socialAccountId,
//       contactId: contactId ?? this.contactId,
//       senderId: senderId ?? this.senderId,
//       senderName: senderName ?? this.senderName,
//       senderPhoto: senderPhoto ?? this.senderPhoto,
//       receiverId: receiverId ?? this.receiverId,
//       receiverName: receiverName ?? this.receiverName,
//       receiverPhoto: receiverPhoto ?? this.receiverPhoto,
//       lastMessage: lastMessage ?? this.lastMessage,
//       lastMessageType: lastMessageType ?? this.lastMessageType,
//       messagesUnseen: messagesUnseen ?? this.messagesUnseen,
//       profilePhoto: profilePhoto ?? this.profilePhoto,
//       status: status ?? this.status,
//       createdAt: createdAt?.toLocal() ?? this.createdAt?.toLocal(),
//       updatedAt: updatedAt ?? this.updatedAt,
//       socialAccount: socialAccount ?? this.socialAccount,
//       messages: messages ?? this.messages,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       companyId,
//       socialAccountId,
//       contactId,
//       senderId,
//       senderName,
//       senderPhoto,
//       receiverId,
//       receiverName,
//       receiverPhoto,
//       lastMessage,
//       lastMessageType,
//       messagesUnseen,
//       profilePhoto,
//       status,
//       createdAt,
//       updatedAt,
//       socialAccount,
//       messages,
//     ];
//   }
// }
