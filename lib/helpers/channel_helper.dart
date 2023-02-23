import 'package:bodsquare_sdk/linking/models/channels_model.dart';
import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:bodsquare_sdk/r.g.dart';

class BodsquareChannels {
  List<ChannelModel> bodsquareChannels = [
    ChannelModel(
      channelId: '01',
      channelName: 'Instagram',
      channelDescription:
          'Send and recieve all your businesses Instagram messages within your inbox.',
      channelImage: R.svg.asset.instagram.assetName,
      channelIsConnected: false,
      socialAccountData: const GetSocialAccountData(),
    ),
    ChannelModel(
      channelId: '02',
      channelName: 'Facebook',
      channelDescription:
          'Send and recieve all your businesses Facebook messages within your inbox.',
      channelImage: R.svg.asset.facebook.assetName,
      channelIsConnected: false,
      socialAccountData: const GetSocialAccountData(),
    ),
    // ChannelModel(
    //   channelId: '03',
    //   channelName: 'Twitter',
    //   channelDescription:
    //       'Send and recieve all your businesses Twitter messages within your inbox.',
    //   channelImage: R.svg.asset.twitter.assetName,
    //   channelIsConnected: false,
    //   socialAccountData: GetSocialAccountData(),
    // ),
    // ChannelModel(
    //   channelId: '04',
    //   channelName: 'Sms',
    //   channelDescription:
    //       'Send and recieve all your businesses Sms messages within your inbox.',
    //   channelImage: R.svg.asset.sms.assetName,
    //   channelIsConnected: false,
    //   socialAccountData: GetSocialAccountData(),
    // ),
    //whatsapp
    ChannelModel(
      channelId: '05',
      channelName: 'Whatsapp',
      channelDescription:
          'Sending and recieving whatsapp messages would soon be coming on Bodsquare.',
      channelImage: R.svg.asset.whatsapp.assetName,
      channelIsConnected: false,
      socialAccountData: const GetSocialAccountData(),
    ),
  ];
}
