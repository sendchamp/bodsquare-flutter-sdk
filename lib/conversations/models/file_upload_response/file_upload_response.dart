import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_upload_response.g.dart';

@JsonSerializable()
class FileUploadResponse extends Equatable {
  final String? status;
  final String? message;
  final FileUploadData? data;

  const FileUploadResponse({this.status, this.message, this.data});

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) {
    return _$FileUploadResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FileUploadResponseToJson(this);

  FileUploadResponse copyWith({
    String? status,
    String? message,
    FileUploadData? data,
  }) {
    return FileUploadResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, data];
}

@JsonSerializable()
class FileUploadData extends Equatable {
  @JsonKey(name: 'file_name')
  final String? fileName;
  @JsonKey(name: 'file_size')
  final int? fileSize;

  const FileUploadData({this.fileName, this.fileSize});

  factory FileUploadData.fromJson(Map<String, dynamic> json) =>
      _$FileUploadDataFromJson(json);

  Map<String, dynamic> toJson() => _$FileUploadDataToJson(this);

  FileUploadData copyWith({
    String? fileName,
    int? fileSize,
  }) {
    return FileUploadData(
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fileName, fileSize];
}
