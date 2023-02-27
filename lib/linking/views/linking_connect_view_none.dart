import 'package:bodsquare_sdk/linking/models/channels_model.dart';
import 'package:flutter/material.dart';

class LinkingConnectViewG extends StatelessWidget {
  const LinkingConnectViewG({super.key, required this.channel});
  final ChannelModel channel;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No platform selected'),
    );
  }
}
