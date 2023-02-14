import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_id_response.g.dart';

@JsonSerializable()
class PageIdResponse extends Equatable {
  final String? id;
  final String? name;

  const PageIdResponse({this.id, this.name});

  factory PageIdResponse.fromJson(Map<String, dynamic> json) {
    return _$PageIdResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PageIdResponseToJson(this);

  PageIdResponse copyWith({
    String? id,
    String? name,
  }) {
    return PageIdResponse(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
