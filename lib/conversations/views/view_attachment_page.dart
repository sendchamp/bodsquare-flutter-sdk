// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:typed_data';

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_message.dart';
import 'package:bodsquare_sdk/conversations/views/file_preview_page.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ViewAttachmentPage extends StatelessWidget {
  ViewAttachmentPage({
    Key? key,
    required this.message,
    required this.messageType,
    required this.conversationId,
  }) : super(key: key);

  final ConversationMessage message;
  // ignore: unused_field
  final ConversationsController _controller = Get.find();
  final LoadingService _loadingService = Get.find();
  final MessageType messageType;
  final String conversationId;

  @override
  Widget build(BuildContext context) {
    // log(message.message.toString());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ffffff,
          foregroundColor: two92D32,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: SizedBox()),
              messageType == MessageType.image
                  ? SizedBox(
                      height: 285,
                      width: 329,
                      child: message.message!.contains('http')
                          ? CachedNetworkImage(
                              imageUrl: message.message ?? '',
                              placeholder: (context, url) => const Center(
                                child: Icon(
                                  Icons.image,
                                  color: ffffff,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Center(
                                child: Icon(
                                  Icons.broken_image_rounded,
                                  color: ffffff,
                                ),
                              ),
                            )
                          : !message.message!.contains('http')
                              ? Image.file(File(
                                  message.message ?? '',
                                ))
                              : Container(),
                    )
                  : Container(),
              const Expanded(
                child: SizedBox(),
              ),
              TextButton(
                  onPressed: () {
                    downloadFile(message.message.toString(), context);
                  },
                  child: const Text('Download')),
              const SizedBox(
                height: 45,
              )
            ],
          ),
        ));
  }

  Future<bool> saveImageUrl(
      String url, String fileName, BuildContext context) async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        await _requestPermission(Permission.storage);
        await _requestPermission(Permission.accessMediaLocation);

        directory = await getExternalStorageDirectory();
        String newPath = "";
        debugPrint(directory.toString());
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }
        newPath = "$newPath/Image";
        directory = Directory(newPath);
        if (!directory.existsSync()) {
          directory.create(recursive: true);
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
          // log(directory.path);
        } else {
          return false;
        }
      }
      File saveFile = File("${directory.path}/$fileName");

      if (await directory.exists()) {
        final dd = await directory.exists();
        // log(dd.toString());
        // SnackBarService().downloadingSnackBar;
        _loadingService.showInfo(
          'Downloading',
        );
        var response = await Dio()
            .get(url, options: Options(responseType: ResponseType.bytes));
        final result =
            await ImageGallerySaver.saveImage(Uint8List.fromList(response.data),
                // quality: 60,
                name: DateTime.now().toString());

        return result['isSuccess'];
      }
      return false;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile(String url, BuildContext context) async {
    bool downloadedImage =
        await saveImageUrl(url, DateTime.now().toString(), context);

    if (downloadedImage) {
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _loadingService.showSuccess(
        'Downloaded Successfully',
      );
      // log("File Downloaded");
    } else {
      _loadingService.showError(
        'An error occured',
      ); // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // log("Problem Downloading File");
    }
  }
}
