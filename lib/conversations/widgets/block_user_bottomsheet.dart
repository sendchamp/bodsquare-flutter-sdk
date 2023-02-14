import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockUserBottomSheet extends StatelessWidget {
  BlockUserBottomSheet({
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
          const SizedBox(
            height: 12,
          ),
          Container(
            width: 32,
            height: 4,
            decoration:
                BoxDecoration(color: d8D8D8, borderRadius: borderRadius3),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Block User',
            style: satoshiBold16.copyWith(color: oneA1A1A),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Blocking this user only prevents Bodsquare \nfrom showing copies of the conversation, and \nwould still require you block them on \nyour social media profiles.',
            style: satoshiRegular14.copyWith(color: oneA1A1A),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          const Divider(
            color: f8F8F8,
            thickness: 2,
          ),
          // SizedBox(
          //   height: 16,
          // ),
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                controller.blockConversation(conversationId);
              },
              child: Text(
                'Proceed',
                style: satoshiMedium14.copyWith(color: fFF1C36),
              )),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: f8F8F8,
            thickness: 2,
          ),
          const SizedBox(
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
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}