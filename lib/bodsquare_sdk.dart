library bodsquare_sdk;

import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/linking/views/initial_linking_view.dart';
import 'package:flutter/material.dart';

class BodsquareSdk {
  void getChannels(
      {required BuildContext context,
      required String email,
      required String userName,
      bool useProduction = false}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: bottomsheetRadius,
        builder: (context) => InitialLinkingView(
            userName: userName, email: email, useProduction: useProduction));
  }
}
