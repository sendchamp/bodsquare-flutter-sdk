import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_helper.dart';
import 'package:bodsquare_sdk/linking/controllers/linking_controller.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DisconnectAccountsBottomsheet extends StatelessWidget {
  const DisconnectAccountsBottomsheet({
    Key? key,
    required this.accountId,
    required this.channel,
  }) : super(key: key);

  final String accountId;
  final String channel;

  @override
  Widget build(BuildContext context) {
    return GetX<LinkingController>(
        init: LinkingController(context: context)..init(),
        builder: (controller) {
          Future<void> disconnectAccount() async {
            if (channel.toLowerCase() == 'facebook') {
              await controller.deleteFacebook(accountId);
            } else if (channel.toLowerCase() == 'instagram') {
              await controller.deleteInstagram(accountId);
            } else if (channel.toLowerCase() == 'twitter') {
              await controller.deleteTwitter(accountId);
            } else if (channel.toLowerCase() == 'whatsapp') {
              await controller.deleteWhatsapp(accountId);
            }
          }

          return Container(
            //give a max height to the bottomsheet
            //so that it doesn't take up the whole screen
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: ffffff,
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  R.svg.asset.forbidden.assetName,
                  height: 50,
                  width: 50,
                  package: 'bodsquare_sdk',
                ),
                const SizedBox(
                  height: 47,
                ),
                const Text(
                  'Are you sure you want to \ndisconnect this account?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: one71D26,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 52,
                ),
                controller.getConnectionUrlLoadingStatus.value == true
                    ? const LoadingHelper(description: 'Disconnecting account')
                    : TextButton(
                        onPressed: () async {
                          await disconnectAccount()
                              .then((value) =>
                                  controller.linkingSuccess.listen((event) {
                                    if (event != '') {
                                      // LoadingService(context: context).dismiss();

                                      ElegantNotification.success(
                                          description: Text(
                                        event,
                                      )).show(context);
                                    }
                                  }))
                              .then((value) => Navigator.pop(context, true));
                          // .then((value) =>
                          //     Future.delayed(Duration(seconds: 1), () {
                          //       Navigator.pop(context, true);
                          //     }));
                          // Navigator.pop(context, true);
                        },
                        child: const Text('Disconnect account',
                            style: TextStyle(
                              color: eD6C5A,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ))),
                const SizedBox(
                  height: 44,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    'Go back',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: seven489AA,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
