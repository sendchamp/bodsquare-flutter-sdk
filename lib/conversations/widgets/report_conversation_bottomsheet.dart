import 'dart:developer';
import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/models/get_all_conversations/contact.dart';
import 'package:bodsquare_sdk/conversations/widgets/report_conversation_detail_bottomsheet.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportConversationBottomSheet extends StatelessWidget {
  ReportConversationBottomSheet({
    Key? key,
    required this.conversationId,
    required this.contact,
  }) : super(key: key);

  final String conversationId;
  final Contact contact;
  final ConversationsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
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
                  Container(
                    constraints:
                        BoxConstraints(minHeight: 61, minWidth: Get.width),
                    child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          // TODO : Add to list bottomsheet
                          // Get.bottomSheet(
                          //     AddToListBottomsheet(
                          //       item: ContactResponseData(
                          //         id: contact.id,
                          //         firstName: contact.firstName ?? '',
                          //         lastName: contact.lastName ?? '',
                          //         email: contact.email ?? '',
                          //         phoneNumber: contact.phoneNumber ?? '',
                          //         isBlocked: contact.isBlocked,
                          //         uid: contact.uid,
                          //       ),
                          //     ),
                          //     isScrollControlled: true);
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Add to list',
                          style: satoshiMedium14.copyWith(color: oneA1A1A),
                        )),
                  ),
                  Divider(
                    color: f8F8F8,
                    thickness: 2,
                  ),
                  Container(
                    constraints:
                        BoxConstraints(minHeight: 61, minWidth: Get.width),
                    child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          Get.bottomSheet(
                              ReportConversationDetailBottomSheet(
                                  conversationId: conversationId),
                              isScrollControlled: true);
                          // log('Report in progress');
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Report',
                          style: satoshiMedium14.copyWith(color: oneA1A1A),
                        )),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            constraints: BoxConstraints(minHeight: 61, minWidth: Get.width),
            decoration:
                BoxDecoration(color: ffffff, borderRadius: borderRadius6),
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
                  style: satoshiMedium14.copyWith(color: f63115),
                )),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
