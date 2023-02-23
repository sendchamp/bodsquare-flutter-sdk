import 'package:bodsquare_sdk/helpers/channel_helper.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/linking/controllers/linking_controller.dart';
import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:bodsquare_sdk/helpers/get_social_account_data.dart';
import 'package:bodsquare_sdk/linking/views/disconnect_insta_or_fb_page.dart';
import 'package:bodsquare_sdk/linking/views/linking_connect_view.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkingView extends StatefulWidget {
  const LinkingView({Key? key}) : super(key: key);

  static const linkingStep1Text = 'Connect your channel';

  static const linkingStep1Subtext = 'Select the channels you want to connect';

  static const linkingStep2Text = 'Connecting ';

  static const linkingStep2Subtext =
      'This integration allows your team to chat with your customers over ';

  @override
  State<LinkingView> createState() => _LinkingViewState();
}

class _LinkingViewState extends State<LinkingView> {
  @override
  void initState() {
    super.initState();
  }

  final GetSocialAccountData bodSquareAppData =
      GetSocialAccounts().getSocialAccountData;

  bool checkIfConnected(String platform) {
    bool isConnected = false;

    switch (platform) {
      case 'Instagram':
        isConnected = bodSquareAppData.instagram != null &&
            bodSquareAppData.instagram!.isNotEmpty;
        break;
      case 'Facebook':
        isConnected = bodSquareAppData.facebook != null &&
            bodSquareAppData.facebook!.isNotEmpty;

        break;
      case 'Twitter':
        isConnected = bodSquareAppData.twitter != null &&
            bodSquareAppData.twitter!.isNotEmpty;
        break;
      // case 'Sms':
      //   isConnected =   data!.sms!.isNotEmpty;
      //   break;
    }

    // log(isConnected.toString());
    return isConnected;
  }

  @override
  Widget build(BuildContext context) {
    // EasyLoading.init();
    // ignore: unused_local_variable
    LinkingController linkingController = LinkingController(context: context)
      ..init();
    // final LoadingService _loadingService = LoadingService(context: context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 65,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Skip for now',
                        style: satoshiMedium14.copyWith(color: oneA1A1A))),
              ),
              Text(
                LinkingView.linkingStep1Text,
                style: satoshiBold24.copyWith(color: oneA1A1A),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                LinkingView.linkingStep1Subtext,
                style: satoshiRegular14.copyWith(color: oneA1A1A),
              ),
              const SizedBox(
                height: 32,
              ),
              for (var item in BodsquareChannels().bodsquareChannels)
                Column(
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: checkIfConnected(item.channelName ?? '')
                              ? fourDAF3F
                              : zero066FF.withOpacity(0.24),
                          width: 1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      leading: SvgPicture.asset(
                        item.channelImage ?? '',
                        height: 32,
                        width: 32,
                        package: "bodsquare_sdk",
                      ),
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.channelName ?? '',
                            style: satoshiMedium16.copyWith(color: oneA1A1A),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          item.channelName?.toLowerCase() == 'twitter'
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: zero066FF.withOpacity(0.24),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  child: Text(
                                    'Pro',
                                    style: satoshiMedium14.copyWith(
                                        color: oneA1A1A, fontSize: 10),
                                  ),
                                  // backgroundColor:
                                  //     seven489AA.withOpacity(.8)
                                )
                              : item.channelName?.toLowerCase() == 'sms'
                                  ? FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: zero066FF.withOpacity(0.24),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        child: Text(
                                          'Coming soon',
                                          style: satoshiMedium14.copyWith(
                                              color: oneA1A1A, fontSize: 9),
                                        ),
                                        // backgroundColor:
                                        //     c2DAFF.withOpacity(0.16)
                                      ),
                                    )
                                  : const SizedBox(),
                        ],
                      ),
                      subtitle: Text(
                        item.channelDescription ?? '',
                        style: satoshiRegular14.copyWith(
                          color: oneA1A1A,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Chip(
                          backgroundColor:
                              checkIfConnected(item.channelName ?? '')
                                  ? fourDAF3F.withOpacity(0.16)
                                  : c2DAFF.withOpacity(0.32),
                          label: Text(
                            checkIfConnected(item.channelName ?? '')
                                ? 'Connected'
                                : item.channelName?.toLowerCase() == 'whatsapp'
                                    ? 'Coming soon'
                                    : 'Not Connected',
                            style: satoshiMedium14.copyWith(
                                color: checkIfConnected(item.channelName ?? '')
                                    ? fourDAF3F
                                    : item.channelName?.toLowerCase() ==
                                            'whatsapp'
                                        ? seven489AA
                                        : eight2B3FE,
                                fontSize: 12),
                          )),
                      onTap: () {
                        if (item.channelName?.toLowerCase() == 'sms' ||
                            item.channelName?.toLowerCase() == 'whatsapp') {
                          // _loadingService.showToast('Coming soon...',
                          //     toastPosition:
                          //         EasyLoadingToastPosition.center);
                          ElegantNotification.info(
                              description: Text(
                            'Coming soon...',
                            style: satoshiRegular14.copyWith(
                                color: oneA1A1A, fontSize: 14),
                          ));
                        } else {
                          checkIfConnected(item.channelName ?? '')
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      LinkingDisconnectInstaOrFbPageView(
                                          channel: item)))
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      LinkingConnectView(channel: item)));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              const SizedBox(
                height: 52,
              ),
              ElevatedButton(
                onPressed: bodSquareAppData.facebook != null &&
                            bodSquareAppData.facebook!.isNotEmpty ||
                        bodSquareAppData.facebook != null &&
                            bodSquareAppData.instagram != null &&
                            bodSquareAppData.instagram!.isNotEmpty ||
                        bodSquareAppData.twitter != null &&
                            bodSquareAppData.twitter!.isNotEmpty
                    ? () {
                        // Get.offNamed(Routes.MAIN);
                        Navigator.pop(context);
                      }
                    : null,
                style: primaryButtonStyle,
                child: const Text('Next'),
              ),
              const SizedBox(
                height: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
