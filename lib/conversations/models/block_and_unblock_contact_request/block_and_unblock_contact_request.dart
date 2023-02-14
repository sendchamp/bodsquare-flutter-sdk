import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'block_and_unblock_contact_request.g.dart';

@JsonSerializable()
class BlockAndUnblockContactRequest extends Equatable {
  @JsonKey(name: 'contact_uid')
  final String? contactUid;

  const BlockAndUnblockContactRequest({this.contactUid});

  factory BlockAndUnblockContactRequest.fromJson(Map<String, dynamic> json) {
    return _$BlockAndUnblockContactRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlockAndUnblockContactRequestToJson(this);

  BlockAndUnblockContactRequest copyWith({
    String? contactUid,
  }) {
    return BlockAndUnblockContactRequest(
      contactUid: contactUid ?? this.contactUid,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [contactUid];
}
