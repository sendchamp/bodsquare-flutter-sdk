import 'dart:developer';

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportConversationDetailBottomSheet extends StatelessWidget {
  ReportConversationDetailBottomSheet({
    Key? key,
    required this.conversationId,
  }) : super(key: key);

  final ConversationsController controller = Get.find();
  final LoadingService _loadingService = Get.find();
  final String conversationId;
  @override
  Widget build(BuildContext context) {
    // log(conversationId + 'detail');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      // height: 375,
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
            'Report Conversation',
            style: satoshiBold16.copyWith(color: oneA1A1A),
          ),
          SizedBox(
            height: 43,
          ),
          _ReportConversationTextBox(),
          Flexible(
              child: SizedBox(
            height: 257,
          )),
          Divider(
            color: f8F8F8,
            thickness: 2,
          ),
          // SizedBox(
          //   height: 16,
          // ),
          TextButton(
              onPressed: () {
                if (controller.reportConversationsController.text.isEmpty) {
                  _loadingService
                      .showError('Please enter a reason in your report');
                } else {
                  Navigator.pop(context);

                  controller.reportConversation(conversationId);

                  // log('Report in progress');
                }
              },
              child: Text(
                'Submit',
                style: satoshiMedium14.copyWith(color: zero066FF),
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

class _ReportConversationTextBox extends StatelessWidget {
  final ConversationsController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Kindly enter the details  of your report',
          style: satoshiMedium14.copyWith(color: oneA1A1A),
        ),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: _controller.reportConversationsController,
          decoration: inputDecoration.copyWith(
            hintText: 'Enter details of your report',
          ),
          maxLines: 4,
          onChanged: (value) {},
          validator: (value) {
            if (!value.toString().isNotEmpty) {
              return 'Please enter your business description';
            }
            return null;
          },
        ),
      ],
    );
  }
}
