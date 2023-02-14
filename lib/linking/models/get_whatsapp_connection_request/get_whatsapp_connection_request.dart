import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_whatsapp_connection_request.g.dart';

@JsonSerializable()
class GetWhatsappConnectionRequest extends Equatable {
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  const GetWhatsappConnectionRequest({this.phoneNumber});

  factory GetWhatsappConnectionRequest.fromJson(Map<String, dynamic> json) {
    return _$GetWhatsappConnectionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetWhatsappConnectionRequestToJson(this);

  GetWhatsappConnectionRequest copyWith({
    String? phoneNumber,
  }) {
    return GetWhatsappConnectionRequest(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [phoneNumber];
}
