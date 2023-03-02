// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:bodsquare_sdk/helpers/clipboard_service.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_helper.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:bodsquare_sdk/helpers/my_phone_form_field_web.dart';
import 'package:bodsquare_sdk/linking/controllers/linking_controller.dart';
import 'package:bodsquare_sdk/linking/models/channels_model.dart';
import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:bodsquare_sdk/helpers/get_social_account_data.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import 'package:webview_flutt/er/webview_flutter.dart';

class LinkingConnectViewG extends StatelessWidget {
  LinkingConnectViewG({Key? key, required this.channel}) : super(key: key);

  final ChannelModel channel;
  static const linkingStep2Text = 'Connecting ';
  static const linkingStep2Subtext =
      'This integration allows your team to chat with your customers over ';

//   @override
//   State<LinkingConnectView> createState() => _LinkingConnectViewState();
// }

// class _LinkingConnectViewState extends State<LinkingConnectView> {
  // final BodSquareAppData bodSquareAppData = Get.put(BodSquareAppData());
  final GetSocialAccountData bodSquareAppData =
      GetSocialAccounts().getSocialAccountData;

  bool checkIfConnected(String platform) {
    bool isConnected = false;

    switch (platform) {
      case 'Instagram':
        isConnected = bodSquareAppData.instagram!.isNotEmpty;
        break;
      case 'Facebook':
        isConnected = bodSquareAppData.facebook!.isNotEmpty;
        break;
      case 'Twitter':
        isConnected = bodSquareAppData.twitter!.isNotEmpty;
        // case 'WhatsApp':
        //   isConnected =
        //       bodSquareAppData.getSocialAccountData.value.whatsapp!.isNotEmpty;
        break;
      // case 'Sms':
      //   isConnected =   data!.sms!.isNotEmpty;
      //   break;
    }

    // log(isConnected.toString());
    return isConnected;
  }

  // late final LinkingController linkingController;

  // @override
  // void initState() {
  //   linkingController = LinkingController(context: context)..init();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GetX<LinkingController>(
      init: LinkingController(context: context)..init(),
      builder: (_) {
        _.linkingError.listen((p0) {
          ElegantNotification.error(description: Text(p0)).show(context);
        });
        _.linkingSuccess.listen((p0) {
          ElegantNotification.success(description: Text(p0)).show(context);
        });
        return Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(
                      color: one71D26,
                    ),
                    Text(
                      'Connecting ${channel.channelName}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: one71D26,
                      ),
                    ),
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
                  height: 34,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        channel.channelName?.toLowerCase() == 'facebook'
                            ? R.svg.asset.facebook_logo.assetName
                            : channel.channelName?.toLowerCase() == 'instagram'
                                ? R.svg.asset.instagram_logo.assetName
                                : channel.channelName?.toLowerCase() ==
                                        'twitter'
                                    ? R.svg.asset.twitter.assetName
                                    : channel.channelName?.toLowerCase() ==
                                            'whatsapp'
                                        ? R.svg.asset.whatsapp_logo.assetName
                                        : '',

                        height: 40,
                        package: "bodsquare_sdk",
                        // color: five75A65,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        LinkingConnectViewG.linkingStep2Subtext +
                            (channel.channelName ?? ''),
                        style: satoshiRegular14.copyWith(color: oneA1A1A),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: sevenE7E7E3D,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'What you’ll need:',
                  style: satoshiMedium14.copyWith(color: oneA1A1A),
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                channel.channelName?.toLowerCase() == 'instagram'
                    ? const InstagramInstructions()
                    : channel.channelName?.toLowerCase() == 'facebook'
                        ? const FacebookInstructions()
                        : channel.channelName?.toLowerCase() == 'twitter'
                            ? const TwitterInstructions()
                            : channel.channelName?.toLowerCase() == 'whatsapp'
                                ? WhatsappInstructions(
                                    controller: _.phoneNumberController,
                                    countryCodeController:
                                        _.countryCodeController,
                                  )
                                : const SizedBox(),
                const SizedBox(
                  height: 48,
                ),
                _.getConnectionUrlLoadingStatus.value
                    ? const LoadingHelper(description: 'Loading...')
                    : ElevatedButton(
                        onPressed: () async {
                          channel.channelName!.toLowerCase() == 'twitter'
                              ? await _.getTwitterConnectionUrl()
                              : channel.channelName!.toLowerCase() == 'facebook'
                                  ? await _
                                      .getFacebookConnectionUrl()
                                      .then((value) {
                                      kIsWeb
                                          ? showModalBottomSheet(
                                              context: context,
                                              builder: ((bcontext) {
                                                final TextEditingController
                                                    urlController =
                                                    TextEditingController();
                                                return Container(
                                                  // textfield to input url
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 24,
                                                      vertical: 24),
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        controller:
                                                            urlController,
                                                        decoration:
                                                            inputDecoration
                                                                .copyWith(
                                                          hintText:
                                                              'Enter the copied URL here',
                                                        ),
                                                        keyboardType:
                                                            TextInputType.name,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .characters,
                                                        onChanged: (value) {},
                                                        validator: (value) {
                                                          if (value
                                                              .toString()
                                                              .isNotEmpty) {
                                                            return null;
                                                          }
                                                          return 'invalid url';
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      ElevatedButton(
                                                          style:
                                                              primaryButtonStyle,
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                bcontext);
                                                            await _.processLink(
                                                                urlController
                                                                    .text);
                                                          },
                                                          child: const Text(
                                                              'Continue'))
                                                    ],
                                                  ),
                                                );
                                              }))
                                          : debugPrint('done');
                                    })
                                  : channel.channelName!.toLowerCase() ==
                                          'instagram'
                                      ? await _
                                          .getInstagramConnectionUrl()
                                          .then((value) {
                                          kIsWeb
                                              ? showModalBottomSheet(
                                                  context: context,
                                                  builder: ((bcontext) {
                                                    final TextEditingController
                                                        urlController =
                                                        TextEditingController();
                                                    return Container(
                                                      // textfield to input url
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 24,
                                                          vertical: 24),
                                                      child: Column(
                                                        children: [
                                                          TextFormField(
                                                            controller:
                                                                urlController,
                                                            decoration:
                                                                inputDecoration
                                                                    .copyWith(
                                                              hintText:
                                                                  'Enter the copied URL here',
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .name,
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .characters,
                                                            onChanged:
                                                                (value) {},
                                                            validator: (value) {
                                                              if (value
                                                                  .toString()
                                                                  .isNotEmpty) {
                                                                return null;
                                                              }
                                                              return 'invalid url';
                                                            },
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          ElevatedButton(
                                                              style:
                                                                  primaryButtonStyle,
                                                              onPressed:
                                                                  () async {
                                                                Navigator.pop(
                                                                    bcontext);
                                                                await _.processLink(
                                                                    urlController
                                                                        .text);
                                                              },
                                                              child: const Text(
                                                                  'Submit'))
                                                        ],
                                                      ),
                                                    );
                                                  }))
                                              : debugPrint('done');
                                        })
                                      : channel.channelName!.toLowerCase() ==
                                              'whatsapp'
                                          ? await _
                                              .getWhatsappConnectionUrl()
                                              .then((value) =>
                                                  showModalBottomSheet(
                                                      isDismissible: true,
                                                      isScrollControlled: true,
                                                      shape: bottomsheetRadius,
                                                      context: context,
                                                      builder: (context) =>
                                                          FinishWhatsappSetup(
                                                            link: value,
                                                            controller: _,
                                                          )))
                                          : Navigator.pop(context);
                          // : Navigator.pop(context);

                          // await _.getSocialMediaConnection(
                          //     channel.channelName ?? '');
                        },
                        style: primaryButtonStyle.copyWith(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(zero066FF)),
                        child: const Text('Continue'),
                      ),
                const SizedBox(
                  height: 58,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TwitterInstructions extends StatelessWidget {
  const TwitterInstructions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                R.svg.asset.tick_circle.assetName,
                package: "bodsquare_sdk",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Ensure you have a Twitter account',
                  style: satoshiRegular14.copyWith(color: oneA1A1A),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class WhatsappInstructions extends StatefulWidget {
  const WhatsappInstructions({
    Key? key,
    required this.controller,
    required this.countryCodeController,
  }) : super(key: key);

  final TextEditingController controller;
  final TextEditingController countryCodeController;

  @override
  State<WhatsappInstructions> createState() => _WhatsappInstructionsState();
}

class _WhatsappInstructionsState extends State<WhatsappInstructions> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final LoadingService loadingService =
          Get.put(LoadingService(context: context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                R.svg.asset.tick_circle.assetName,
                package: "bodsquare_sdk",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Kindly enter your whatsapp number and click continue.',
                  style: satoshiRegular14.copyWith(color: oneA1A1A),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: zero066FF.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyPhoneField(
                  controller: widget.controller,
                  countryCodeController: widget.countryCodeController,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class FacebookInstructions extends StatelessWidget {
  const FacebookInstructions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                R.svg.asset.tick_circle.assetName,
                package: "bodsquare_sdk",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Ensure you have a Facebook Account',
                  style: satoshiRegular14.copyWith(color: oneA1A1A),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                R.svg.asset.tick_circle.assetName,
                package: "bodsquare_sdk",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Ensure you own or have admin access to your Facebook page.',
                  style: satoshiRegular14.copyWith(color: oneA1A1A),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          kIsWeb
              ? const SizedBox(
                  height: 24,
                )
              : const SizedBox(),
          kIsWeb
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      R.svg.asset.tick_circle.assetName,
                      package: "bodsquare_sdk",
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Copy the url on the connection success screen and come back to paste in the box provided',
                        style: satoshiRegular14.copyWith(color: oneA1A1A),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class InstagramInstructions extends StatelessWidget {
  const InstagramInstructions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                R.svg.asset.tick_circle.assetName,
                package: "bodsquare_sdk",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text:
                          'Please ensure your instagram account is set up as professional/business account. \n',
                      style: satoshiRegular14.copyWith(color: oneA1A1A),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'See Guide here',
                          style: satoshiRegular14.copyWith(
                            color: zero066FF,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Single tapped.
                              // launchUrl(Uri.parse(
                              //     'https://guides.bodsquare.com/channels/instagram/convert-to-business-ig-page'));
                              // kIsWeb
                              // ?
                              launchUrl(Uri.parse(
                                  'https://guides.bodsquare.com/channels/instagram/convert-to-business-ig-page'));
                              // : showModalBottomSheet(
                              //     context: context,
                              //     isDismissible: true,
                              //     shape: bottomsheetRadius,
                              //     builder: (context) =>
                              //         const _GuidesBottomSheet(
                              //             url:
                              //                 'https://guides.bodsquare.com/channels/instagram/convert-to-business-ig-page'),
                              //     isScrollControlled: true,
                              //   );
                            },
                        )
                      ]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                R.svg.asset.tick_circle.assetName,
                package: "bodsquare_sdk",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: 'Enable',
                      style: satoshiRegular14.copyWith(color: oneA1A1A),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' "Allow Access to Messages"',
                          style: satoshiRegular14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: oneA1A1A,
                          ),
                        ),
                        const TextSpan(
                          text: 'in Instagram settings. ',
                        ),
                        TextSpan(
                          text: 'See Guide here',
                          style: satoshiRegular14.copyWith(
                            color: zero066FF,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Single tapped.
                              // kIsWeb
                              //     ?
                              launchUrl(Uri.parse(
                                  'https://guides.bodsquare.com/channels/instagram/convert-to-business-ig-page'));
                              // : showModalBottomSheet(
                              //     context: context,
                              //     isDismissible: true,
                              //     shape: bottomsheetRadius,
                              //     builder: (context) =>
                              //         const _GuidesBottomSheet(
                              //             url:
                              //                 'https://guides.bodsquare.com/channels/instagram/allow-access-to-messages'),
                              //     isScrollControlled: true,
                              //   );
                            },
                        )
                      ]),
                ),

                // child: Text(
                //   'Enable "Allow Access to Messages" in Instagram settings. See Guide here',
                //   style: satoshiRegular14.copyWith(
                //       color: oneA1A1A),
                //   textAlign: TextAlign.left,
                // ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                R.svg.asset.tick_circle.assetName,
                package: "bodsquare_sdk",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Ensure you have Admin access to your linked Facebook Page',
                  style: satoshiRegular14.copyWith(color: oneA1A1A),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          kIsWeb
              ? const SizedBox(
                  height: 24,
                )
              : const SizedBox(),
          kIsWeb
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      R.svg.asset.tick_circle.assetName,
                      package: "bodsquare_sdk",
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Copy the url on the connection success screen and come back to paste in the box provided',
                        style: satoshiRegular14.copyWith(color: oneA1A1A),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

// class _GuidesBottomSheet extends StatefulWidget {
//   const _GuidesBottomSheet({
//     Key? key,
//     required this.url,
//   }) : super(key: key);

//   final String? url;

//   @override
//   State<_GuidesBottomSheet> createState() => _GuidesBottomSheetState();
// }

// class _GuidesBottomSheetState extends State<_GuidesBottomSheet> {
//   @override
//   void initState() {
//     super.initState();

//     // launchUrl(Uri.parse(url ?? ''));
//     // super.initState();
//   }

//   final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
//     Factory(() => EagerGestureRecognizer())
//   };

//   final UniqueKey _key = UniqueKey();

//   @override
//   Widget build(BuildContext context) {
//     LinkingController controller = LinkingController(context: context);

//     return Container(
//       height: MediaQuery.of(context).size.height * .80,
//       decoration: const BoxDecoration(
//           color: ffffff,
//           borderRadius:
//               // borderRadiusTopLR32
//               BorderRadius.only(
//                   topLeft: Radius.circular(24), topRight: Radius.circular(24))),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(24), topRight: Radius.circular(24)),
//         child: WebView(
//           key: _key,
//           gestureRecognizers: gestureRecognizers,
//           javascriptMode: JavascriptMode.unrestricted,
//           initialUrl: widget.url ?? '',
//         ),
//       ),
//     );
//   }
// }

// import 'package:bodsquare_sdk/linking/models/channels_model.dart';
// import 'package:flutter/material.dart';

// class LinkingConnectView extends StatelessWidget {
//   const LinkingConnectView({super.key, required this.channel});

//   final ChannelModel channel;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Text('Linking Connect View : ${channel.channelName}'),
//     ));
//   }
// }

class FinishWhatsappSetup extends StatelessWidget {
  const FinishWhatsappSetup({super.key, this.link, required this.controller});

  final String? link;
  final LinkingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(
                color: one71D26,
              ),
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
            height: 24,
          ),
          Text(
            'Kindly copy the link below and open it on another device to scan the QR code.',
            style: satoshiRegular14.copyWith(color: oneA1A1A),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            link ?? '',
            style: satoshiRegular14.copyWith(color: oneA1A1A),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () async {
              await ClipboardService().copy(link ?? '').then((value) async {
                BuildContext? dialogContext;
                showDialog(
                    context: context,
                    builder: (context) {
                      dialogContext = context;
                      return const AlertDialog(
                        content: Text('Copied'),
                      );
                    });
                await Future.delayed(const Duration(seconds: 1), () {
                  // log('dialog is current ${ModalRoute.of(dialogContext!)?.isCurrent}');
                  Navigator.pop(dialogContext!);
                });
              });
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: primaryButtonStyle.copyWith(
              shadowColor:
                  MaterialStateProperty.all<Color>(zero066FF.withOpacity(.08)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(zero066FF.withOpacity(.08)),
            ),
            child: Text(
              'Copy Link'.toUpperCase(),
              style: const TextStyle(
                color: zero066FF,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // Text(
          //   'Instructions:',
          //   textAlign: TextAlign.start,
          //   style: satoshiRegular14.copyWith(
          //       color: oneA1A1A, fontSize: 13, fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
          // Text(
          //   '· Open WhatsApp on your phone\n· Tap Menu or Settings and select WhatsApp Web\n· Point your phone at this screen and capture the code above.',
          //   textAlign: TextAlign.start,
          //   style: satoshiRegular14.copyWith(
          //     color: seven489AA,
          //     fontSize: 13,
          //   ),
          // ),
          // const SizedBox(
          //   height: 103,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //     controller.completeWhatsappConnection();
          //   },
          //   style: primaryButtonStyle,
          //   child: const Text('I have scanned the QR code'),
          // ),

          const SizedBox(
            height: 55,
          )
        ],
      ),
    );
  }

  Widget getImagenBase64(String? imagen) {
    String? imageBase64 = imagen;
    const Base64Codec base64 = Base64Codec();
    if (imageBase64 == null || imageBase64.isEmpty) return Container();
    var bytes = base64.decode(imageBase64);
    return Image.memory(
      bytes,
      width: 96,
      fit: BoxFit.fitWidth,
    );
  }
}
