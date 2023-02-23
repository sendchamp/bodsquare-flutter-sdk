// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:bodsquare_sdk/helpers/get_social_account_data.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:bodsquare_sdk/helpers/storage_service.dart';
import 'package:bodsquare_sdk/linking/models/add_facebook_or_instagram_request.dart';
import 'package:bodsquare_sdk/linking/models/add_twitter_channel_request.dart';
import 'package:bodsquare_sdk/linking/models/delete_social_media_response.dart';
import 'package:bodsquare_sdk/linking/models/facebook_or_instagram_data.dart';
import 'package:bodsquare_sdk/linking/models/get_facebook_response.dart';
import 'package:bodsquare_sdk/linking/models/get_instagram_response.dart';
import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:bodsquare_sdk/linking/models/get_twitter_response.dart';

import 'package:bodsquare_sdk/linking/models/login_user_request/login_user_request.dart';
import 'package:bodsquare_sdk/linking/models/page_id_response.dart';
import 'package:bodsquare_sdk/linking/models/twitter_data.dart';
import 'package:bodsquare_sdk/linking/repository/linking_repository.dart';
import 'package:bodsquare_sdk/linking/views/social_media_connect_webview_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

bool _initialURILinkHandled = false;

class LinkingController extends GetxController {
  final BuildContext context;

  LinkingController({required this.context});

  // Rx<NetworkConnectionStatus> loadingStatus = NetworkConnectionStatus.none.obs;

  final count = 0;
  final LinkingRepository _linkingRepository = LinkingRepository();
  late final LoadingService _loadingService;
  // final BodSquareAppData _bodSquareAppData = Get.put(BodSquareAppData());
  final StorageService _storageService = StorageService();
  StreamSubscription? _streamSubscription;
  String? initialLink;

  RxBool getConnectionUrlLoadingStatus = false.obs;
  RxString linkingError = ''.obs;
  RxString linkingSuccess = ''.obs;

  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  //initialize this class
  Future<void> init() async {
    _loadingService = Get.put(LoadingService(context: context));
    // getSocialMediaAccounts();
    // await initUniLinks();
  }

  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   disposeSubUniLinks();
  //   super.onClose();
  // }

  // @override
  // dispose() {
  //   disposeSubUniLinks();
  //   super.dispose();
  // }

  // late StreamSubscription<String?> _subUniLinks;

  Future<void> initUniLinks() async {
    if (!_initialURILinkHandled) {
      try {
        final String? initialLink = await getInitialLink();

        //log(initialLink.toString() + 'this is initial link');

        if (initialLink != null && initialLink.isNotEmpty) {
          _initialURILinkHandled = true;
          //log('gotten here');
          // await processLink(initialLink);
          //log("this was supposed to be the initial link: $initialLink");
          //log('initialLink: $initialLink is actually empty');
          // initialLink = null;
          // _incomingLinkHandler();
        }
        await _incomingLinkHandler();
        //log('deep link listener activated');
        _initialURILinkHandled = true;
      } on PlatformException {
        //log('failed to receive initial Url');
        // ignore: unused_catch_clause
      } on FormatException catch (e) {
        //log('failed to parse initial Url');
      }
    } else {
      //log('secondary deep link listener activated');
      _incomingLinkHandler();
    }
  }

  Future<void> _incomingLinkHandler() async {
    // 1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) async {
        // 3
        if (uri != null) {
          // 4
          await processLink(uri.toString());
          disposeSubUniLinks();
          uri = null;
          //log('link received');
        }
      }, onError: (err) {
        // 5
        //log('error: $err');
        //log('failed to receive initial Url');
      }, onDone: () {
        //
        _streamSubscription?.cancel();
      });
    } else {
      // add listener for web
      // Stream.periodic(Duration(seconds: 1)).listen((event) {
      // if (js.context['location']['href'] != null) {
      // //log('web detected');
      // //log('listener added');
      // var uri = Uri.tryParse(js.context['location']['href']);
      // if (uri != null) {
      //   //log('uri: $uri');
      // }
      // }
      // String uri = window.location.href;
      // //log('web detected::::::::::; $uri');
      // });
    }
  }

  List<PageIdResponse> _pageIdResponse = [];
  String? previousPageName;

  Future<void> processLink(String? link) async {
    _pageIdResponse.clear();

    // parse link and decide what to do:
    if (link != null && link.isNotEmpty) {
      final parsedUri = Uri.parse(link);
      final fdf = Uri.decodeFull(link);
      //log('returned Uri params: $fdf');
      final splittedString = fdf.split('=');

      if (splittedString.isNotEmpty) {
        _pageIdResponse = List<PageIdResponse>.from(
            jsonDecode(splittedString[2].replaceAll('&platform', ''))
                .map((x) => PageIdResponse.fromJson(x)));
      }
      //log('pageIdResponse length: ${_pageIdResponse.length}');
      if (_pageIdResponse.isNotEmpty) {
        for (int i = 0; i < _pageIdResponse.length; i++) {
          if (_pageIdResponse[i].name == previousPageName) {
            //log('duplicate page name');
            continue;
          } else {
            //log(_pageIdResponse[i].toString());
            final FaceBookOrInstagramData facebookOrInstagramData =
                FaceBookOrInstagramData(
                    page_id: _pageIdResponse[i].id,
                    access_token: parsedUri.queryParameters['access_token'],
                    page_name: _pageIdResponse[i].name,
                    platform: parsedUri.queryParameters['platform']);

            //log('facebookOrInstagramData: $facebookOrInstagramData');

            final AddFacebookOrInstagramRequest addFaceBookOrInstagramRequest =
                AddFacebookOrInstagramRequest(
                    pageName: facebookOrInstagramData.page_name ?? '',
                    pageId: facebookOrInstagramData.page_id ?? '',
                    accessToken: facebookOrInstagramData.access_token ?? '');

            facebookOrInstagramData.platform?.toLowerCase() == 'facebook'
                ? await addFacebookAccount(addFaceBookOrInstagramRequest,
                    isLast: _pageIdResponse.last == _pageIdResponse[i])
                : facebookOrInstagramData.platform?.toLowerCase() == 'instagram'
                    ? await addInstagramAccount(addFaceBookOrInstagramRequest,
                        isLast: _pageIdResponse.last == _pageIdResponse[i])
                    : _loadingService.showError('unknown platform');
            previousPageName = _pageIdResponse[i].name;
          }
        }
        disposeSubUniLinks();
      } else {
        _loadingService.showError(
            'No page selected - Select at least one page to continue');
        _pageIdResponse.clear();
      }
      disposeSubUniLinks();
      _pageIdResponse.clear();
    } else {
      disposeSubUniLinks();
      _pageIdResponse.clear();
    }
    disposeSubUniLinks();
  }

  disposeSubUniLinks() async {
    initialLink = null;

    previousPageName = null;

    await _streamSubscription?.cancel();
    // _pageIdResponse.clear();
    //log('$_streamSubscription disposed');
    // _subUniLinks.cancel();
    // //log('$_subUniLinks disposed');
  }

  /// Disconnect Social Media account

  Future<void> deleteTwitter(String twitterUid) async {
    final DeleteSocialMediaResponse response;
    try {
      _loadingService.show(status: 'Processing');
      response = await _linkingRepository.deleteTwitterConnection(twitterUid);
      if (response.status == 'success') {
        await getSocialMediaAccounts();
        _loadingService
            .showSuccess(response.message ?? 'Twitter account Removed');
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError("Error: Unable to remove Twitter account");
      } else {
        _loadingService.showError("Error: Unable to remove Twitter account");
      }
    }
  }

  Future<void> deleteWhatsapp(String whatsappUid) async {
    final DeleteSocialMediaResponse response;
    try {
      getConnectionUrlLoadingStatus.value = true;
      response = await _linkingRepository.deleteWhatsappConnection(whatsappUid);
      if (response.status == 'success') {
        await getSocialMediaAccounts();
        getConnectionUrlLoadingStatus.value = false;
        linkingSuccess.value = response.message ?? 'Whatsapp account Removed';
        // _loadingService
        //     .showSuccess(response.message ?? 'Whatsapp account Removed');
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = "Error: Unable to remove Whatsapp account";
        // _loadingService.showError("Error: Unable to remove Whatsapp account");
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = "Error: Unable to remove Whatsapp account";
        // _loadingService.showError("Error: Unable to remove Whatsapp account");
      }
    }
  }

  Future<void> deleteFacebook(String facebookUid) async {
    final DeleteSocialMediaResponse response;
    try {
      getConnectionUrlLoadingStatus.value = true;
      // _loadingService.show(status: 'Processing');
      // loadingStatus.value = NetworkConnectionStatus.loading;
      //log('facebookUid: $facebookUid ${getConnectionUrlLoadingStatus.value}');
      response = await _linkingRepository.deleteFacebookConnection(facebookUid);
      if (response.status == 'success') {
        await getSocialMediaAccounts();
        // loadingStatus.value = NetworkConnectionStatus.success;
        getConnectionUrlLoadingStatus.value = false;
        linkingSuccess.value = response.message ?? 'Facebook account Removed';
        update();

        // _loadingService
        //     .showSuccess(response.message ?? 'Facebook account Removed');
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = 'Error: Unable to remove Facebook account';
        // loadingStatus.value = NetworkConnectionStatus.error;
        // _loadingService.showError('Error: Unable to remove Facebook account');
      } else {
        getConnectionUrlLoadingStatus.value = false;
        // loadingStatus.value = NetworkConnectionStatus.error;
        // _loadingService.showError("Error: Unable to remove Facebook account");
        linkingError.value = "Error: Unable to remove Facebook account";
      }
    }
  }

  Future<void> deleteInstagram(String instagramUid) async {
    final DeleteSocialMediaResponse response;
    try {
      getConnectionUrlLoadingStatus.value = true;
      // _loadingService.show(status: 'Processing');

      response =
          await _linkingRepository.deleteInstagramConnection(instagramUid);
      if (response.status == 'success') {
        await getSocialMediaAccounts();
        getConnectionUrlLoadingStatus.value = false;
        linkingSuccess.value = response.message ?? 'Instagram account Removed';
        // _loadingService
        //     .showSuccess(response.message ?? 'Instagram account Removed');
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = 'Error: Unable to remove Instagram account';
        // _loadingService.showError('Error: Unable to remove Instagram account');
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = "Error: Unable to remove Instagram account";
        // _loadingService.showError("Error: Unable to remove Instagram account");
      }
    }
  }

  Future<void> getTwitterConnectionUrl() async {
    _incomingLinkHandler();
    try {
      _loadingService.show(status: 'Processing...');
      final response = await _linkingRepository.getTwitterConnectionUrl();
      if (response.status == 'success') {
        _loadingService.dismiss();
        //log(response.data.toString());

        final TwitterData? twitterData = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SocialMediaConnectWebviewView(),
                settings: RouteSettings(arguments: response.data)));
        if (twitterData != null) {
          //log('twitter data: ${twitterData.toString()}');

          final AddTwitterChannelRequest addTwitterChannelRequest =
              AddTwitterChannelRequest(
                  authToken: twitterData.oAuthToken ?? '',
                  authVerifier: twitterData.oAuthVerifier ?? '');

          addTwitterAccount(addTwitterChannelRequest);
        }
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError(
            e.response?.data['message'] ?? 'Error connecting account');
      } else {
        _loadingService.showError('Error connecting account');
      }

      _loadingService.dismiss();
    }
  }

  Future<void> getFacebookConnectionUrl() async {
    // _incomingLinkHandler();
    getConnectionUrlLoadingStatus.value = true;
    try {
      // _loadingService.show(status: 'Processing...');
      final response = await _linkingRepository.getFacebookConnectionUrl();
      if (response.status == 'success') {
        // _loadingService.dismiss();
        getConnectionUrlLoadingStatus.value = false;
        //log(response.data.toString());

        initUniLinks();

        await _loadFromUrl(response.data ?? '');
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value =
            e.response?.data['message'] ?? 'Error connecting account';
        // _loadingService.showError(
        //     e.response?.data['message'] ?? 'Error connecting account');
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = 'Error connecting account';
        // _loadingService.showError('Error connecting account');
      }
      getConnectionUrlLoadingStatus.value = false;

      // _loadingService.dismiss();

    }
  }

  Future<void> getInstagramConnectionUrl() async {
    try {
      getConnectionUrlLoadingStatus.value = true;
      // _loadingService.show(status: 'Processing...');
      final response = await _linkingRepository.getInstagramConnectionUrl();
      if (response.status == 'success') {
        // _loadingService.dismiss();
        getConnectionUrlLoadingStatus.value = false;
        //log(response.data.toString());

        initUniLinks();

        await _loadFromUrl(response.data ?? '');
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value =
            e.response?.data['message'] ?? 'Error connecting account';
        // _loadingService.showError(
        //     e.response?.data['message'] ?? 'Error connecting account');
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = 'Error connecting account';
        // _loadingService.showError('Error connecting account');
      }
      getConnectionUrlLoadingStatus.value = false;
      // _loadingService.dismiss();
    }
  }

  RxString whatsappLink = ''.obs;
  Future<String> getWhatsappConnectionUrl() async {
    // final String businessUid = await _storageService.getString('companyUid');
    final String businessToken = await _storageService.getString('token');
    final bool env = await _storageService.getBool('env');

    try {
      getConnectionUrlLoadingStatus.value = true;

      final phones = countryCodeController.text +
          phoneNumberController.text.replaceAll('-', '');
      final phone = phones.replaceAll('+', '');

      // _loadingService.show(status: 'Processing...');
      // GetWhatsappConnectionRequest request = GetWhatsappConnectionRequest(
      //   phoneNumber: phone,
      // );
      // //log(request.toString());
      // final response = await _linkingRepository.getWhatsappConnectionUrl(
      //   request,
      // );
      // if (response.status == 'success') {
      //   // _loadingService.dismiss();
      whatsappLink.value = kReleaseMode || env
          ? 'https://dash.bodsquare.com/whatsapp?phone_number=$phone&token=$businessToken'
          : 'https://develop--bod-dashboard.netlify.app/whatsapp?phone_number=$phone&token=$businessToken';
      update();

      getConnectionUrlLoadingStatus.value = false;
      // }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value =
            e.response?.data['message'] ?? 'Error connecting account';
        // _loadingService.showError(
        //     e.response?.data['message'] ?? 'Error connecting account');

      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = 'Error connecting account';

        // _loadingService.showError('Error connecting account');
      }

      getConnectionUrlLoadingStatus.value = false;

      // _loadingService.dismiss();
    }
    return whatsappLink.value;
  }

  Future<void> completeWhatsappConnection() async {
    try {
      final phone = countryCodeController.text +
          phoneNumberController.text.replaceAll('-', '');
      getConnectionUrlLoadingStatus.value = true;
      // _loadingService.show(status: 'Processing...');
      final response =
          await _linkingRepository.completeWhatsappConnection(phone);
      if (response.status == 'success') {
        // _loadingService.dismiss();
        getConnectionUrlLoadingStatus.value = false;
        //log(response.message.toString());
        linkingSuccess.value = response.message ?? '';

        getSocialMediaAccounts();

        phoneNumberController.clear();
        countryCodeController.clear();
        update();

        // initUniLinks();

        // await _loadFromUrl(response.data ?? '');
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value =
            e.response?.data['message'] ?? 'Error connecting account';
        // _loadingService.showError(
        //     e.response?.data['message'] ?? 'Error connecting account');
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = 'Error connecting account';
        // _loadingService.showError('Error connecting account');
      }
      getConnectionUrlLoadingStatus.value = false;
      // _loadingService.dismiss();
    }
  }

  Future<void> _loadFromUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  ///  add twitter account after connecting with twitter API
  void addTwitterAccount(AddTwitterChannelRequest request) async {
    GetTwitterResponse response;
    try {
      //log('twitter final request: ${request.toString()}');
      _loadingService.show(status: 'Processing');
      response = await _linkingRepository.addTwitterConnection(request);
      if (response.status == 'success') {
        //log(response.toString());

        await getSocialMediaAccounts();

        _loadingService.dismiss();

        _loadingService.dismiss();
      } else {
        _loadingService.showError(response.message.toString());
      }
    } catch (e) {
      if (e is DioError) {
        _loadingService.showError(e.response?.data['message']);
      } else {
        _loadingService.showError(e.toString());
      }
    }
  }

  /// add facebook or instagram account after connecting with facebook or instagram API
  ///

  Future<void> addFacebookAccount(AddFacebookOrInstagramRequest request,
      {bool isLast = false}) async {
    try {
      //log('final request: ${request.toString()}');
      getConnectionUrlLoadingStatus.value = true;
      // _loadingService.show(status: 'Processing');
      GetFacebookResponse response =
          await _linkingRepository.addFacebookConnection(request);
      if (response.status == 'success') {
        //log(response.toString());

        await getSocialMediaAccounts();

        if (isLast) {
          getConnectionUrlLoadingStatus.value = false;
          linkingSuccess.value = 'Account added successfully';
          // _loadingService.dismiss();

          // _loadingService.dismiss();
        }
        // _loadingService.dismiss();

        getConnectionUrlLoadingStatus.value = false;
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = response.message.toString();
        // _loadingService.showError(response.message.toString());

        disposeSubUniLinks();
      }
    } catch (e) {
      getConnectionUrlLoadingStatus.value = false;
      if (e is DioError) {
        linkingError.value = e.response?.data['message'] ?? '';
        // _loadingService.showError(e.response?.data['message']);
      } else {
        linkingError.value = e.toString();
        // _loadingService.showError(e.toString());
      }
    }
  }

  Future<void> addInstagramAccount(AddFacebookOrInstagramRequest request,
      {bool isLast = false}) async {
    try {
      //log('final request: ${request.toString()}');
      // _loadingService.show(status: 'Processing');
      getConnectionUrlLoadingStatus.value = true;
      GetInstagramResponse response =
          await _linkingRepository.addInstagramConnection(request);
      if (response.status == 'success') {
        //log(response.toString());

        await getSocialMediaAccounts();

        if (isLast) {
          getConnectionUrlLoadingStatus.value = false;
          linkingSuccess.value = 'Account added successfully';

          // _loadingService.dismiss();

          // _loadingService.dismiss();
        }
        // _loadingService.dismiss();
        getConnectionUrlLoadingStatus.value = false;
      } else {
        getConnectionUrlLoadingStatus.value = false;
        // _loadingService.showError(response.message.toString());

        disposeSubUniLinks();
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = e.response?.data['message'] ?? '';
        // _loadingService.showError(e.response?.data['message']);
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = e.toString();
        // _loadingService.showError(e.toString());
      }

      disposeSubUniLinks();
    }
  }

  Future<void> loginUser(
      {required String username, required String email}) async {
    try {
      var response = await _linkingRepository.loginUser(LoginUserRequest(
        companyName: username,
        email: email,
      ));
      if (response.status == 'success') {
        await _storageService.setString('token', response.data?.apiKey ?? '');
        await _storageService.setString(
            'companyUid', response.data?.companyUid ?? '');
        // ignore: unused_local_variable
        final token = await _storageService.getString('token');

        //log('token: $token');
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = response.message.toString();
        debugPrint(response.message);
      }
    } catch (e) {
      if (e is DioError) {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = e.response?.data['message'] ?? '';
      } else {
        getConnectionUrlLoadingStatus.value = false;
        linkingError.value = e.toString();
      }
    }
  }

  /// get Social media accounts
  Future<void> getSocialMediaAccounts() async {
    try {
      var facebookResponse = await _linkingRepository.getFacebookAccounts();
      var instagramResponse = await _linkingRepository.getInstagramAccounts();
      var twitterResponse = await _linkingRepository.getTwitterAccounts();
      var whatsappResponse = await _linkingRepository.getWhatsappAccounts();

      GetSocialAccountData acc = GetSocialAccountData(
          facebook: facebookResponse.data,
          instagram: instagramResponse.data,
          twitter: twitterResponse.data,
          whatsapp: whatsappResponse.data);

      GetSocialAccounts().getSocialAccountData.copyWith(
          facebook: facebookResponse.data,
          instagram: instagramResponse.data,
          twitter: twitterResponse.data,
          whatsapp: whatsappResponse.data);

      //log('API CALL : : : : : :${acc.toString()}');

      //log('API CALL : : : : : :${GetSocialAccounts().getSocialAccountData.toString()}');

      await _storageService.setString(
          'socialAccounts', jsonEncode(acc.toJson()));

      // _bodSquareAppData.getSocialAccountData.value = acc;

      // log(_bodSquareAppData.getSocialAccountData.value.toString());
    } catch (e) {
      //log(e.toString());
    }
  }
  //

}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
