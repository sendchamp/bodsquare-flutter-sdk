import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_facebook_or_instagram_request.g.dart';

@JsonSerializable()
class AddFacebookOrInstagramRequest extends Equatable {
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'page_id')
  final String? pageId;
  @JsonKey(name: 'page_name')
  final String? pageName;

  const AddFacebookOrInstagramRequest({
    this.accessToken,
    this.pageId,
    this.pageName,
  });

  factory AddFacebookOrInstagramRequest.fromJson(Map<String, dynamic> json) {
    return _$AddFacebookOrInstagramRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddFacebookOrInstagramRequestToJson(this);

  AddFacebookOrInstagramRequest copyWith({
    String? accessToken,
    String? pageId,
    String? pageName,
  }) {
    return AddFacebookOrInstagramRequest(
      accessToken: accessToken ?? this.accessToken,
      pageId: pageId ?? this.pageId,
      pageName: pageName ?? this.pageName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [accessToken, pageId, pageName];
}
