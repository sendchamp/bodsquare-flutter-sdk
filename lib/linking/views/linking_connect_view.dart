import 'package:bodsquare_sdk/linking/models/channels_model.dart';
import 'package:flutter/material.dart';
import 'linking_connect_view_none.dart'
    if (dart.library.html) 'linking_connect_view_web.dart'
    if (dart.library.io) 'linking_connect_view_mobile.dart';

class LinkingConnectView extends StatelessWidget {
  const LinkingConnectView({super.key, required this.channel});
  final ChannelModel channel;

  @override
  Widget build(BuildContext context) {
    return LinkingConnectViewG(
      channel: channel,
    );
  }
}
