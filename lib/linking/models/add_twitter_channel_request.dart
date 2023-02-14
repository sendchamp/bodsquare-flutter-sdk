import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_twitter_channel_request.g.dart';

@JsonSerializable()
class AddTwitterChannelRequest extends Equatable {
  @JsonKey(name: 'auth_token')
  final String? authToken;
  @JsonKey(name: 'auth_verifier')
  final String? authVerifier;

  const AddTwitterChannelRequest({this.authToken, this.authVerifier});

  factory AddTwitterChannelRequest.fromJson(Map<String, dynamic> json) {
    return _$AddTwitterChannelRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddTwitterChannelRequestToJson(this);

  AddTwitterChannelRequest copyWith({
    String? authToken,
    String? authVerifier,
  }) {
    return AddTwitterChannelRequest(
      authToken: authToken ?? this.authToken,
      authVerifier: authVerifier ?? this.authVerifier,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [authToken, authVerifier];
}
