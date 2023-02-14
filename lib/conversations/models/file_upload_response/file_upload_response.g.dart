// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadResponse _$FileUploadResponseFromJson(Map<String, dynamic> json) =>
    FileUploadResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : FileUploadData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileUploadResponseToJson(FileUploadResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FileUploadData _$FileUploadDataFromJson(Map<String, dynamic> json) =>
    FileUploadData(
      fileName: json['file_name'] as String?,
      fileSize: json['file_size'] as int?,
    );

Map<String, dynamic> _$FileUploadDataToJson(FileUploadData instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'file_size': instance.fileSize,
    };
