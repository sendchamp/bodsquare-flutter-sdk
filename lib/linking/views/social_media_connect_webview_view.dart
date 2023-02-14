import 'dart:developer';
import 'dart:io';

import 'package:bodsquare_sdk/linking/models/twitter_data.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class SocialMediaConnectWebviewView extends StatefulWidget {
  @override
  State<SocialMediaConnectWebviewView> createState() =>
      _SocialMediaConnectWebviewViewState();
}

class _SocialMediaConnectWebviewViewState
    extends State<SocialMediaConnectWebviewView> {
  // final WebViewController _webViewController = WebViewPlatformController()

  var loadingPercentage = 0;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String _initialUrl =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Connect with Twitter'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: _initialUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
                // log('message: current url: $url');

                if (url.contains('&oauth_verifier=')) {
                  var uri = Uri.parse(url);
                  final TwitterData twitterData = TwitterData(
                    oAuthVerifier: uri.queryParameters['oauth_verifier'],
                    oAuthToken: uri.queryParameters['oauth_token'],
                  );

                  // log(twitterData.toString());
                  Navigator.pop(context, twitterData);
                  // Get.back(result: twitterData);
                }
              });
            },
            onWebResourceError: (error) {
              // log(error.description);
              // log(error.errorType.toString());
            },
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
              color: Colors.deepOrange,
            ),
        ],
      ),
    );
  }
}
