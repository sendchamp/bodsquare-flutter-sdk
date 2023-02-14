import 'dart:convert';
import 'package:bodsquare_sdk/conversations/views/conversations_view.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/storage_service.dart';
import 'package:bodsquare_sdk/linking/controllers/linking_controller.dart';
import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:bodsquare_sdk/linking/views/select_channel_bottomsheet.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class InitialLinkingView extends StatefulWidget {
  const InitialLinkingView(
      {super.key, required this.email, required this.userName});
  final String email;
  final String userName;

  @override
  State<InitialLinkingView> createState() => _InitialLinkingViewState();
}

class _InitialLinkingViewState extends State<InitialLinkingView> {
  final StorageService _storageService = StorageService();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () async {
      LinkingController linkingController = LinkingController(context: context);
      await getSocialAccounts(linkingController);
    });

    super.initState();
  }

  bool loader = true;

  getSocialAccounts(LinkingController controller) async {
    await controller.loginUser(username: widget.userName, email: widget.email);
    await controller.getSocialMediaAccounts();
    final String ii = await _storageService.getString('socialAccounts');

    final jj = jsonDecode(ii);

    final getSocialAccount = GetSocialAccountData.fromJson(jj);

    if (getSocialAccount.facebook != null &&
            getSocialAccount.facebook!.isNotEmpty ||
        getSocialAccount.instagram != null &&
            getSocialAccount.instagram!.isNotEmpty ||
        getSocialAccount.twitter != null &&
            getSocialAccount.twitter!.isNotEmpty ||
        getSocialAccount.whatsapp != null &&
            getSocialAccount.whatsapp!.isNotEmpty) {
      setState(() {
        loader = false;
      });
      Navigator.pop(context);
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: true,
          shape: bottomsheetRadius,
          builder: (context) => const ConversationsView());
    } else {
      setState(() {
        loader = false;
      });
      // showModalBottomSheet(
      //     context: context,
      //     isScrollControlled: true,
      //     isDismissible: true,
      //     shape: bottomsheetRadius,
      //     builder: (context) => const ConversationsView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: ffffff,
      ),
      child: loader
          ? SizedBox(
              height: 350,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpinKitFadingCircle(color: zero066FF.withOpacity(.5)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Initializing Bodsquare...',
                      style: satoshiMedium14.copyWith(
                        color: zero066FF,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(
                //   height: 25,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: one71D26,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        shape: bottomsheetRadius,
                        builder: (context) => const ConversationsView()),
                    child: Container(
                      height: 96,
                      width: 96,
                      decoration: BoxDecoration(
                          color: zero066FF.withOpacity(.08),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: SvgPicture.asset(
                          R.svg.asset.add_channel.assetName,
                          package: "bodsquare_sdk",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'Connect channel',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'To send and receive messages from your customers, you’d need to connect your social accounts.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: true,
                          shape: bottomsheetRadius,
                          builder: (context) {
                            return const SelectChannelBottomsheet();
                          });
                    },
                    style: primaryButtonStyle,
                    child: const Text('Continue')),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
    );
  }
}
