import 'dart:io';

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum MessageType {
  text,
  image,
  video,
  audio,
}

class FilePreviewPage extends StatelessWidget {
  FilePreviewPage(
      {Key? key,
      required this.files,
      required this.messageType,
      required this.conversationId,
      required this.channelName})
      : super(key: key);

  final List<File?> files;
  final ConversationsController _controller = Get.find();
  final MessageType messageType;
  final String conversationId;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body:
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      height: MediaQuery.of(context).size.height * 0.8,
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.all(8),
                  // tapTargetSize: MaterialTapTargetSize.shrinkWrap
                ),
                child: SvgPicture.asset(
                  R.svg.asset.file_preview_cancel.assetName,
                  package: 'bodsquare_sdk',
                )),
          ]),
          SizedBox(
            height: 285,
            width: Get.width,
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      width: 5.0,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: files.length,
                itemBuilder: (BuildContext context, int index) {
                  return files.isNotEmpty && kIsWeb
                      ? Image.network(
                          files[index]!.path,
                          fit: BoxFit.fitHeight,
                          height: 285,
                          width: Get.width - 40,
                        )
                      : files.isNotEmpty && !kIsWeb
                          ? Image.file(
                              files[index] ?? File('/'),
                              fit: BoxFit.fitHeight,
                              height: 285,
                              width: Get.width - 40,
                            )
                          : Container(
                              height: 40.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(
                                Icons.not_interested,
                                color: Colors.grey,
                              ));
                }),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 40,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: f6F6F8,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _controller.textMessageController,
                      minLines: 1,
                      maxLines: 4,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Attach a message'),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _controller.sendMultiFileMessage(
                        id: conversationId,
                        messageType:
                            messageType == MessageType.image ? 'image' : '',
                        files: files,
                        channelName: channelName);
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.all(8),
                  ),
                  child: SvgPicture.asset(
                    R.svg.asset.send_message_icon.assetName,
                    package: 'bodsquare_sdk',
                  )),
            ],
          ),
        ],
      ),
    );
    // ));
  }
}
