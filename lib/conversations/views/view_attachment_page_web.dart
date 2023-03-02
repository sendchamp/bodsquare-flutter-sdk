// ignore_for_file: unused_local_variable

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_message.dart';
import 'package:bodsquare_sdk/conversations/views/file_preview_page.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

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
                              ? Image.network(
                                  message.message ?? '',
                                )
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

  /// downloadsImage from the web for flutter web.
  downloadFile(String url, BuildContext context) async {
    await WebImageDownloader.downloadImageFromWeb(url);
  }
}
