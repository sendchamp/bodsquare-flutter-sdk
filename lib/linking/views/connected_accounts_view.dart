// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, unused_element
import 'dart:convert';

import 'package:bodsquare_sdk/helpers/channel_helper.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/storage_service.dart';
import 'package:bodsquare_sdk/linking/controllers/linking_controller.dart';
import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:bodsquare_sdk/linking/models/get_whatsapp_response/get_whatsapp_response.dart';
import 'package:bodsquare_sdk/linking/views/disconnect_account_view.dart';
import 'package:bodsquare_sdk/linking/views/linking_connect_view.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ConnectedAccountsBottomsheet extends StatefulWidget {
  const ConnectedAccountsBottomsheet({
    Key? key,
    required this.channelName,
  }) : super(key: key);

  final String channelName;

  @override
  State<ConnectedAccountsBottomsheet> createState() =>
      _ConnectedAccountsBottomsheetState();
}

class _ConnectedAccountsBottomsheetState
    extends State<ConnectedAccountsBottomsheet> {
  late final channel;
  @override
  void initState() {
    super.initState();
    channel = getAccountsFromStorage(widget.channelName);
  }

  final StorageService _storageService = StorageService();

  List<Facebook> facebook = [];
  List<Instagram> instagram = [];
  List<Twitter> twitter = [];
  List<WhatsappResponseData> whatsapp = [];

  getAccountsFromStorage(String channelName) async {
    final String ii = await _storageService.getString('socialAccounts');
    final jj = jsonDecode(ii);
    final getSocialAccount = GetSocialAccountData.fromJson(jj);
    if (channelName.toLowerCase() == 'facebook') {
      facebook = getSocialAccount.facebook!;
    } else if (channelName.toLowerCase() == 'instagram') {
      instagram = getSocialAccount.instagram!;
    } else if (channelName.toLowerCase() == 'twitter') {
      twitter = getSocialAccount.twitter!;
    } else if (channelName.toLowerCase() == 'whatsapp') {
      whatsapp = getSocialAccount.whatsapp!;
    }
    setState(() {});
  }

  //select the correct icon based on the channel name
  //and pass it to the [ChannelWidget]
  getChannelLength(String channelName) {
    if (channelName.toLowerCase() == 'facebook') {
      return facebook.length;
    } else if (channelName.toLowerCase() == 'instagram') {
      return instagram.length;
    } else if (channelName.toLowerCase() == 'twitter') {
      return twitter.length;
    } else if (channelName.toLowerCase() == 'whatsapp') {
      return whatsapp.length;
    }
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // monitor network fetch
    await LinkingController(context: context).getSocialMediaAccounts();
    // if failed,use refreshFailed()
    getAccountsFromStorage(widget.channelName);
    _refreshController.refreshCompleted();
  }

  // getChannel(String channelName) {
  //   if (channelName.toLowerCase() == 'facebook') {
  //     return facebook;
  //   } else if (channelName.toLowerCase() == 'instagram') {
  //     return instagram;
  //   } else if (channelName.toLowerCase() == 'twitter') {
  //     return twitter;
  //   } else if (channelName.toLowerCase() == 'whatsapp') {
  //     return whatsapp;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(
          //   height: 25,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(
                color: one71D26,
              ),
              const Text(
                'Accounts',
                style: TextStyle(
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
            height: 32,
          ),
          //if/else based on the channel name
          //use the channel name to get the [ChannelWidget]
          //and pass the channel name to the [ChannelWidget]
          //to get the correct icon

          widget.channelName.toLowerCase() == 'facebook'
              ? const ChannelWidget(
                  name: 'Facebook',
                )
              : widget.channelName.toLowerCase() == 'instagram'
                  ? const ChannelWidget(
                      name: 'Instagram',
                    )
                  : widget.channelName.toLowerCase() == 'whatsapp'
                      ? const ChannelWidget(
                          name: 'WhatsApp',
                        )
                      : widget.channelName.toLowerCase() == 'twitter'
                          ? const ChannelWidget(
                              name: 'Twitter',
                            )
                          : const SizedBox(),

          const SizedBox(
            height: 32,
          ),
          const Text(
            'Connected Accounts',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: one71D26,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          // widget.channelName.toLowerCase() == 'facebook' &&
          //         GetSocialAccounts().getSocialAccountData.facebook != null
          //     ?
          Expanded(
            child: ListView.builder(
              itemCount: getChannelLength(widget.channelName),

              // GetSocialAccounts().getSocialAccountData.facebook?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: zero066FF.withOpacity(.16)),
                      borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: SvgPicture.asset(
                          widget.channelName.toLowerCase() == 'facebook'
                              ? R.svg.asset.facebook_logo.assetName
                              : widget.channelName.toLowerCase() == 'instagram'
                                  ? R.svg.asset.instagram_logo.assetName
                                  : widget.channelName.toLowerCase() ==
                                          'whatsapp'
                                      ? R.svg.asset.whatsapp_logo.assetName
                                      : widget.channelName.toLowerCase() ==
                                              'twitter'
                                          ? R.svg.asset.twitter_logo.assetName
                                          : '',
                          package: "bodsquare_sdk",
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '${widget.channelName.toLowerCase() == 'facebook' ? facebook[index].pageName : widget.channelName.toLowerCase() == 'instagram' ? instagram[index].pageName : widget.channelName.toLowerCase() == 'whatsapp' ? whatsapp[index].phoneNumber : widget.channelName.toLowerCase() == 'twitter' ? twitter[index].uid : ''}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: one71D26,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () async {
                            bool reload = await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                shape: bottomsheetRadius,
                                builder: (context) =>
                                    DisconnectAccountsBottomsheet(
                                      channel: widget.channelName,
                                      accountId:
                                          '${widget.channelName.toLowerCase() == 'facebook' ? facebook[index].uid : widget.channelName.toLowerCase() == 'instagram' ? instagram[index].uid : widget.channelName.toLowerCase() == 'whatsapp' ? whatsapp[index].uid : widget.channelName.toLowerCase() == 'twitter' ? twitter[index].uid : ''}',
                                    ));
                            if (reload) {
                              await getAccountsFromStorage(widget.channelName);
                              setState(() {});
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: five0555C.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Icon(Icons.motion_photos_off_outlined,
                                //     color: five0555C, size: 16),
                                SvgPicture.asset(
                                  R.svg.asset.forbidden.assetName,
                                  package: "bodsquare_sdk",
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  'Disconnect',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: five0555C,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          )

          // : const SizedBox(
          //     height: 225,
          //   ),
        ],
      ),
    );
  }
}

class ChannelWidget extends StatelessWidget {
  const ChannelWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            shape: bottomsheetRadius,
            builder: (context) => LinkingConnectView(
                channel: BodsquareChannels().bodsquareChannels.firstWhere(
                    (element) =>
                        element.channelName?.toLowerCase() ==
                        name.toLowerCase())));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: zero066FF.withOpacity(.16)),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                name == 'Instagram'
                    ? R.svg.asset.instagram_logo.assetName
                    : name == 'Facebook'
                        ? R.svg.asset.facebook_logo.assetName
                        : name == 'Whatsapp'
                            ? R.svg.asset.whatsapp.assetName
                            : R.svg.asset.twitter.assetName,
                package: "bodsquare_sdk",
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: one71D26,
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: true,
                      context: context,
                      shape: bottomsheetRadius,
                      builder: (context) => LinkingConnectView(
                          channel: BodsquareChannels()
                              .bodsquareChannels
                              .firstWhere((element) =>
                                  element.channelName?.toLowerCase() ==
                                  name.toLowerCase())));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: zero066FF.withOpacity(.08),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'Add'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: zero066FF,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
