library bodsquare_sdk;

import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/linking/repository/public_key_holder.dart';
import 'package:bodsquare_sdk/linking/views/initial_linking_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A Calculator.
class BodsquareSdk {
  void getChannels(
      {required BuildContext context,
      required String email,
      required String userName}) {
    // _performChecks();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: bottomsheetRadius,
        builder: (context) =>
            InitialLinkingView(userName: userName, email: email));
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => LinkingView()),
    // );
  }
}
