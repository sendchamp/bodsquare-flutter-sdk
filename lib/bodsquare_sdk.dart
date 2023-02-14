library bodsquare_sdk;

import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/linking/repository/public_key_holder.dart';
import 'package:bodsquare_sdk/linking/views/initial_linking_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A Calculator.
class BodsquareSdk {
  bool _sdkInitialized = false;
  String _publicKey = "";
  // static late PlatformInfo platformInfo;

  initialize({required String publicKey}) async {
    assert(() {
      if (publicKey.isEmpty) {
        throw Exception('publicKey cannot be null or empty');
      }
      publicKeyHolder = publicKey;
      return true;
    }());

    if (sdkInitialized) return;

    this._publicKey = publicKey;

    // Using cascade notation to build the platform specific info
    try {
      // platformInfo = await PlatformInfo.fromMethodChannel(Utils.methodChannel);
      _sdkInitialized = true;
    } on PlatformException {
      rethrow;
    }
  }

  dispose() {
    _publicKey = "";
    publicKeyHolder = null;
    _sdkInitialized = false;
  }

  bool get sdkInitialized => _sdkInitialized;

  String get publicKey {
    // Validate that the sdk has been initialized
    _validateSdkInitialized();
    return _publicKey;
  }

  _validateSdkInitialized() {
    if (!sdkInitialized) {
      throw Exception('Bodsquare SDK has not been initialized. The SDK has'
          ' to be initialized before use');
    }
  }

  void _performChecks() {
    //validate that sdk has been initialized
    _validateSdkInitialized();
    //check for null value, and length and starts with pk_
    if (_publicKey.isEmpty || _publicKey.startsWith("bodsquare_public")) {
      throw Exception(
          'Invalid public key. Please check that you have initialized the SDK with a valid public key');
    }
  }

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
