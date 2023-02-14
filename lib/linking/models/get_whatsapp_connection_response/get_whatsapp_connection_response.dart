import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_whatsapp_connection_response.g.dart';

@JsonSerializable()
class GetWhatsappConnectionResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;
  final GetWhatsappConnectionResponseData? data;

  const GetWhatsappConnectionResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory GetWhatsappConnectionResponse.fromJson(Map<String, dynamic> json) {
    return _$GetWhatsappConnectionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetWhatsappConnectionResponseToJson(this);

  GetWhatsappConnectionResponse copyWith({
    String? status,
    String? message,
    int? code,
    GetWhatsappConnectionResponseData? data,
  }) {
    return GetWhatsappConnectionResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, code, data];
}

@JsonSerializable()
class GetWhatsappConnectionResponseData extends Equatable {
  final String? qrcode;

  const GetWhatsappConnectionResponseData({this.qrcode});

  factory GetWhatsappConnectionResponseData.fromJson(
          Map<String, dynamic> json) =>
      _$GetWhatsappConnectionResponseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetWhatsappConnectionResponseDataToJson(this);

  GetWhatsappConnectionResponseData copyWith({
    String? qrcode,
  }) {
    return GetWhatsappConnectionResponseData(
      qrcode: qrcode ?? this.qrcode,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [qrcode];
}
