import 'dart:io';

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstaStoryWebView extends StatefulWidget {
  final String url;

  const InstaStoryWebView({Key? key, required this.url}) : super(key: key);
  @override
  State<InstaStoryWebView> createState() => _InstaStoryWebViewState();
}

class _InstaStoryWebViewState extends State<InstaStoryWebView> {
  // final WebViewController _webViewController = WebViewPlatformController()

  var loadingPercentage = 0;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationsController>(
      init: ConversationsController(
          loadingService: LoadingService(context: context)),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Instagram Story'),
            backgroundColor: zero066FF,
            centerTitle: true,
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: widget.url,
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

                    // if (url.contains('&oauth_verifier=')) {
                    //   var uri = Uri.parse(url);
                    //   final TwitterData twitterData = TwitterData(
                    //     oAuthVerifier: uri.queryParameters['oauth_verifier'],
                    //     oAuthToken: uri.queryParameters['oauth_token'],
                    //   );

                    //   log(twitterData.toString());
                    //   Get.back(result: twitterData);
                    // }
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
                  color: zero066FF,
                ),
            ],
          ),
        );
      },
    );
  }
}
