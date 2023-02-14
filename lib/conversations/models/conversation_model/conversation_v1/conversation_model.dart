// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'conversation_data.dart';

// part 'conversation_model.g.dart';

// @JsonSerializable()
// class ConversationModel extends Equatable {
//   final String? status;
//   final String? message;
//   final ConversationData? data;

//   const ConversationModel({this.status, this.message, this.data});

//   factory ConversationModel.fromJson(Map<String, dynamic> json) {
//     return _$ConversationModelFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$ConversationModelToJson(this);

//   ConversationModel copyWith({
//     String? status,
//     String? message,
//     ConversationData? data,
//   }) {
//     return ConversationModel(
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
