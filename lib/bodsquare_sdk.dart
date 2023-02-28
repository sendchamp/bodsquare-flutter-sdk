library bodsquare_sdk;

import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/linking/views/initial_linking_view.dart';
import 'package:flutter/material.dart';

class BodsquareSdk {
  /// initializes and get the bodsquare channels.
  /// If no channel is available or account is available
  /// it creates a new account and gives the opportunity of
  /// adding new social accounts.
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
