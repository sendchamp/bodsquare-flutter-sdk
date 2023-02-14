import 'dart:developer';

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/widgets/delete_conversation_warning.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseOrDeleteChatBottomsheet extends StatelessWidget {
  CloseOrDeleteChatBottomsheet({
    Key? key,
    required this.uid,
    required this.type,
  }) : super(key: key);

  final ConversationsController controller = Get.find();
  final String? uid;
  final ConversationType type;

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
              decoration:
                  BoxDecoration(color: ffffff, borderRadius: borderRadius6),
              child: Column(
                children: [
                  type == ConversationType.closed
                      ? const SizedBox()
                      : Container(
                          constraints: BoxConstraints(
                              minHeight: 61, minWidth: Get.width),
                          child: TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                // log('Close chat pressed');
                                controller.closeConversation(uid ?? '');
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Close chat',
                                style:
                                    satoshiMedium14.copyWith(color: oneA1A1A),
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
                          await showDialog(
                              context: context,
                              builder: (_) {
                                return DismissAlertDialog(
                                  activeConversationController: controller,
                                  uid: uid ?? '',
                                );
                              });
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Delete chat',
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
            decoration:
                BoxDecoration(color: ffffff, borderRadius: borderRadius6),
            child: TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Cancel',
                  style: satoshiMedium14.copyWith(color: f63115),
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
