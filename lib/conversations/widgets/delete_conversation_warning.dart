import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ConversationType { open, pending, closed }

class DismissAlertDialog extends StatelessWidget {
  const DismissAlertDialog({
    Key? key,
    required this.activeConversationController,
    required this.uid,
    // required this.type,
  }) : super(key: key);

  final ConversationsController activeConversationController;
  final String uid;
  // final ConversationType type;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      alignment: Alignment.center,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Deleting this message will only delete a copy of the message on the Bodsquare app',
            style: satoshiMedium14.copyWith(color: oneA1A1A, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const Divider(
            color: f8F8F8,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text(
                      'Cancel',
                      style: satoshiMedium14.copyWith(color: oneA1A1A),
                    ),
                    onPressed: () {
                      //                         Navigator.pop(context);

                      Navigator.pop(context);
                      activeConversationController.update();
                    },
                  ),
                ),
                const VerticalDivider(
                  color: f8F8F8,
                ),
                Expanded(
                  child: TextButton(
                    child: Text('Delete',
                        style: satoshiMedium14.copyWith(color: f63115)),
                    onPressed: () {
                      activeConversationController
                          .deleteConversation(uid.toString())
                          .then(
                            (value) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("text dismissed"),
                              ),
                            ),
                          );

                      activeConversationController.update();
                      //                         Navigator.pop(context);

                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
