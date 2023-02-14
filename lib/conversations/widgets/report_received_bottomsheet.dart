import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/widgets/block_user_bottomsheet.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportReceivedBottomSheet extends StatelessWidget {
  ReportReceivedBottomSheet({
    Key? key,
    required this.conversationId,
  }) : super(key: key);

  final ConversationsController controller = Get.find();
  final String conversationId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: ffffff, borderRadius: borderRadiusTopLR32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            width: 32,
            height: 4,
            decoration:
                BoxDecoration(color: d8D8D8, borderRadius: borderRadius3),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Report Recieved',
            style: satoshiBold16.copyWith(color: oneA1A1A),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Would you like to block this user \nfrom sending messages to you?',
            style: satoshiRegular14.copyWith(color: nine99999),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32,
          ),
          Divider(
            color: f8F8F8,
            thickness: 2,
          ),
          // SizedBox(
          //   height: 16,
          // ),
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                Get.bottomSheet(
                    BlockUserBottomSheet(conversationId: conversationId),
                    isScrollControlled: true);
              },
              child: Text(
                'Block user',
                style: satoshiMedium14.copyWith(color: fFF1C36),
              )),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: f8F8F8,
            thickness: 2,
          ),
          SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: satoshiMedium14.copyWith(color: oneA1A1A),
              )),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
