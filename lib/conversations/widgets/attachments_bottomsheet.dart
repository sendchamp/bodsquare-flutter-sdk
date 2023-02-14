import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/views/file_preview_page.dart';
import 'package:bodsquare_sdk/conversations/views/video_preview_page.dart';
import 'package:bodsquare_sdk/helpers/file_picker_service.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttachmentsBottomSheet extends StatelessWidget {
  AttachmentsBottomSheet({
    Key? key,
    required this.conversationId,
    required this.channelName,
  }) : super(key: key);

  final ConversationsController controller = Get.find();
  final String conversationId;
  final String channelName;
  final FilePickerService filePickerService = Get.put(FilePickerService());
  final LoadingService loadingService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: borderRadiusTopLR32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: ffffff, borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Container(
                    constraints:
                        BoxConstraints(minHeight: 61, minWidth: Get.width),
                    child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          final file =
                              await filePickerService.pickImageFromCamera();
                          if (file != null) {
                            // Get.to(() => FilePreviewPage(
                            //       files: [file],
                            //       messageType: MessageType.image,
                            //       conversationId: conversationId,
                            //       channelName: channelName,
                            //     ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilePreviewPage(
                                  files: [file],
                                  messageType: MessageType.image,
                                  conversationId: conversationId,
                                  channelName: channelName,
                                ),
                              ),
                            );
                          } else {
                            loadingService.showError(
                              'Unable to capture image',
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Camera',
                          style: satoshiMedium14.copyWith(color: oneA1A1A),
                        )),
                  ),
                  const Divider(
                    color: f8F8F8,
                    thickness: 2,
                  ),
                  Container(
                    constraints:
                        BoxConstraints(minHeight: 61, minWidth: Get.width),
                    child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          final file =
                              await filePickerService.pickImageFromGallery();
                          if (file.isNotEmpty) {
                            // Get.to(() => FilePreviewPage(
                            //       files: file,
                            //       messageType: MessageType.image,
                            //       conversationId: conversationId,
                            //       channelName: channelName,
                            //     ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilePreviewPage(
                                  files: file,
                                  messageType: MessageType.image,
                                  conversationId: conversationId,
                                  channelName: channelName,
                                ),
                              ),
                            );
                          } else {
                            loadingService.showError(
                              'Unable to pick image',
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Photo Library',
                          style: satoshiMedium14.copyWith(color: oneA1A1A),
                        )),
                  ),
                  const Divider(
                    color: f8F8F8,
                    thickness: 2,
                  ),
                  Container(
                    constraints:
                        BoxConstraints(minHeight: 61, minWidth: Get.width),
                    child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          final file =
                              await filePickerService.pickVideoFromGallery();
                          if (file != null) {
                            // Get.to(() => VideoPreviewPage(
                            //       file: file,
                            //       messageType: MessageType.video,
                            //       conversationId: conversationId,
                            //       channelName: channelName,
                            //     ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPreviewPage(
                                  file: file,
                                  messageType: MessageType.video,
                                  conversationId: conversationId,
                                  channelName: channelName,
                                ),
                              ),
                            );
                          } else {
                            loadingService.showError(
                              'Unable to pick video',
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Video Library',
                          style: satoshiMedium14.copyWith(color: oneA1A1A),
                        )),
                  ),
                  const Divider(
                    color: f8F8F8,
                    thickness: 2,
                  ),
                  Container(
                    constraints:
                        BoxConstraints(minHeight: 61, minWidth: Get.width),
                    child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          final file = await filePickerService.selectFile();
                          if (file != null) {
                            controller.sendMultiFileMessage(
                                id: conversationId,
                                messageType: 'document',
                                files: file,
                                channelName: channelName);
                          } else {
                            loadingService.showError(
                              'Unable to get document',
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Documents',
                          style: satoshiMedium14.copyWith(color: oneA1A1A),
                        )),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            constraints: BoxConstraints(minHeight: 61, minWidth: Get.width),
            decoration: BoxDecoration(
                color: ffffff, borderRadius: BorderRadius.circular(6)),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Cancel',
                  style: satoshiMedium14.copyWith(color: oneA1A1A),
                )),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
