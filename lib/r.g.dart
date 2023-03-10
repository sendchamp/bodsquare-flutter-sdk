// IT IS GENERATED BY FLR - DO NOT MODIFY BY HAND
// YOU CAN GET MORE DETAILS ABOUT FLR FROM:
// - https://github.com/Fly-Mix/flr-cli
// - https://github.com/Fly-Mix/flr-vscode-extension
// - https://github.com/Fly-Mix/flr-as-plugin
//

// ignore: unused_import
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
// ignore: unused_import
import 'package:path/path.dart' as path;
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:r_dart_library/asset_svg.dart';

/// This `R` class is generated and contains references to static asset resources.
class R {
  /// package name: bodsquare_sdk
  static const package = "bodsquare_sdk";

  /// This `R.image` struct is generated, and contains static references to static non-svg type image asset resources.
  static const image = _R_Image();

  /// This `R.svg` struct is generated, and contains static references to static svg type image asset resources.
  static const svg = _R_Svg();

  /// This `R.text` struct is generated, and contains static references to static text asset resources.
  static const text = _R_Text();

  /// This `R.fontFamily` struct is generated, and contains static references to static font asset resources.
  static const fontFamily = _R_FontFamily();
}

/// Asset resource’s metadata class.
/// For example, here is the metadata of `packages/flutter_demo/assets/images/example.png` asset:
/// - packageName：flutter_demo
/// - assetName：assets/images/example.png
/// - fileDirname：assets/images
/// - fileBasename：example.png
/// - fileBasenameNoExtension：example
/// - fileExtname：.png
class AssetResource {
  /// Creates an object to hold the asset resource’s metadata.
  const AssetResource(this.assetName, {this.packageName});

  /// The name of the main asset from the set of asset resources to choose from.
  final String assetName;

  /// The name of the package from which the asset resource is included.
  final String? packageName;

  /// The name used to generate the key to obtain the asset resource. For local assets
  /// this is [assetName], and for assets from packages the [assetName] is
  /// prefixed 'packages/<package_name>/'.
  String get keyName =>
      packageName == null ? assetName : "packages/$packageName/$assetName";

  /// The file basename of the asset resource.
  String get fileBasename {
    final basename = path.basename(assetName);
    return basename;
  }

  /// The no extension file basename of the asset resource.
  String get fileBasenameNoExtension {
    final basenameWithoutExtension = path.basenameWithoutExtension(assetName);
    return basenameWithoutExtension;
  }

  /// The file extension name of the asset resource.
  String get fileExtname {
    final extension = path.extension(assetName);
    return extension;
  }

  /// The directory path name of the asset resource.
  String get fileDirname {
    var dirname = assetName;
    if (packageName != null) {
      final packageStr = "packages/$packageName/";
      dirname = dirname.replaceAll(packageStr, "");
    }
    final filenameStr = "$fileBasename/";
    dirname = dirname.replaceAll(filenameStr, "");
    return dirname;
  }
}

// ignore: camel_case_types
class _R_Image_AssetResource {
  const _R_Image_AssetResource();
}

// ignore: camel_case_types
class _R_Svg_AssetResource {
  const _R_Svg_AssetResource();

  /// asset: assets/images/channels/add_channel.svg
  // ignore: non_constant_identifier_names
  final add_channel = const AssetResource(
      "assets/images/channels/add_channel.svg",
      packageName: R.package);

  /// asset: assets/images/channels/add_icon_circle.svg
  // ignore: non_constant_identifier_names
  final add_icon_circle = const AssetResource(
      "assets/images/channels/add_icon_circle.svg",
      packageName: R.package);

  /// asset: assets/images/channels/facebook.svg
  // ignore: non_constant_identifier_names
  final facebook = const AssetResource("assets/images/channels/facebook.svg",
      packageName: R.package);

  /// asset: assets/images/channels/facebook_logo.svg
  // ignore: non_constant_identifier_names
  final facebook_logo = const AssetResource(
      "assets/images/channels/facebook_logo.svg",
      packageName: R.package);

  /// asset: assets/images/channels/forbidden.svg
  // ignore: non_constant_identifier_names
  final forbidden = const AssetResource("assets/images/channels/forbidden.svg",
      packageName: R.package);

  /// asset: assets/images/channels/instagram.svg
  // ignore: non_constant_identifier_names
  final instagram = const AssetResource("assets/images/channels/instagram.svg",
      packageName: R.package);

  /// asset: assets/images/channels/instagram_logo.svg
  // ignore: non_constant_identifier_names
  final instagram_logo = const AssetResource(
      "assets/images/channels/instagram_logo.svg",
      packageName: R.package);

  /// asset: assets/images/channels/sms.svg
  // ignore: non_constant_identifier_names
  final sms = const AssetResource("assets/images/channels/sms.svg",
      packageName: R.package);

  /// asset: assets/images/channels/tick_circle.svg
  // ignore: non_constant_identifier_names
  final tick_circle = const AssetResource(
      "assets/images/channels/tick_circle.svg",
      packageName: R.package);

  /// asset: assets/images/channels/twitter.svg
  // ignore: non_constant_identifier_names
  final twitter = const AssetResource("assets/images/channels/twitter.svg",
      packageName: R.package);

  /// asset: assets/images/channels/twitter_logo.svg
  // ignore: non_constant_identifier_names
  final twitter_logo = const AssetResource(
      "assets/images/channels/twitter_logo.svg",
      packageName: R.package);

  /// asset: assets/images/channels/whatsapp.svg
  // ignore: non_constant_identifier_names
  final whatsapp = const AssetResource("assets/images/channels/whatsapp.svg",
      packageName: R.package);

  /// asset: assets/images/channels/whatsapp_logo.svg
  // ignore: non_constant_identifier_names
  final whatsapp_logo = const AssetResource(
      "assets/images/channels/whatsapp_logo.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/Facebook.svg
  // ignore: non_constant_identifier_names
  final facebook$1 = const AssetResource(
      "assets/images/conversations/Facebook.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/Instagram.svg
  // ignore: non_constant_identifier_names
  final instagram$1 = const AssetResource(
      "assets/images/conversations/Instagram.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/Twitter.svg
  // ignore: non_constant_identifier_names
  final twitter$1 = const AssetResource(
      "assets/images/conversations/Twitter.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/attachment.svg
  // ignore: non_constant_identifier_names
  final attachment = const AssetResource(
      "assets/images/conversations/attachment.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/blocked_user.svg
  // ignore: non_constant_identifier_names
  final blocked_user = const AssetResource(
      "assets/images/conversations/blocked_user.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/bodsquare.svg
  // ignore: non_constant_identifier_names
  final bodsquare = const AssetResource(
      "assets/images/conversations/bodsquare.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/chat_details_eclipse.svg
  // ignore: non_constant_identifier_names
  final chat_details_eclipse = const AssetResource(
      "assets/images/conversations/chat_details_eclipse.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/chat_timer_icon.svg
  // ignore: non_constant_identifier_names
  final chat_timer_icon = const AssetResource(
      "assets/images/conversations/chat_timer_icon.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/double_ticker.svg
  // ignore: non_constant_identifier_names
  final double_ticker = const AssetResource(
      "assets/images/conversations/double_ticker.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/downloaded.svg
  // ignore: non_constant_identifier_names
  final downloaded = const AssetResource(
      "assets/images/conversations/downloaded.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/facebook_user.svg
  // ignore: non_constant_identifier_names
  final facebook_user = const AssetResource(
      "assets/images/conversations/facebook_user.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/file_preview_cancel.svg
  // ignore: non_constant_identifier_names
  final file_preview_cancel = const AssetResource(
      "assets/images/conversations/file_preview_cancel.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/instagram_user.svg
  // ignore: non_constant_identifier_names
  final instagram_user = const AssetResource(
      "assets/images/conversations/instagram_user.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/microphone.svg
  // ignore: non_constant_identifier_names
  final microphone = const AssetResource(
      "assets/images/conversations/microphone.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/no_message_yet.svg
  // ignore: non_constant_identifier_names
  final no_message_yet = const AssetResource(
      "assets/images/conversations/no_message_yet.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/report_flag.svg
  // ignore: non_constant_identifier_names
  final report_flag = const AssetResource(
      "assets/images/conversations/report_flag.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/send_message_icon.svg
  // ignore: non_constant_identifier_names
  final send_message_icon = const AssetResource(
      "assets/images/conversations/send_message_icon.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/single_ticker.svg
  // ignore: non_constant_identifier_names
  final single_ticker = const AssetResource(
      "assets/images/conversations/single_ticker.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/twitter_user.svg
  // ignore: non_constant_identifier_names
  final twitter_user = const AssetResource(
      "assets/images/conversations/twitter_user.svg",
      packageName: R.package);

  /// asset: assets/images/conversations/whatsapp_user.svg
  // ignore: non_constant_identifier_names
  final whatsapp_user = const AssetResource(
      "assets/images/conversations/whatsapp_user.svg",
      packageName: R.package);
}

// ignore: camel_case_types
class _R_Text_AssetResource {
  const _R_Text_AssetResource();
}

/// This `_R_Image` class is generated and contains references to static non-svg type image asset resources.
// ignore: camel_case_types
class _R_Image {
  const _R_Image();

  final asset = const _R_Image_AssetResource();
}

/// This `_R_Svg` class is generated and contains references to static svg type image asset resources.
// ignore: camel_case_types
class _R_Svg {
  const _R_Svg();

  final asset = const _R_Svg_AssetResource();

  /// asset: assets/images/channels/add_channel.svg
  // ignore: non_constant_identifier_names
  AssetSvg add_channel({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.add_channel.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/add_icon_circle.svg
  // ignore: non_constant_identifier_names
  AssetSvg add_icon_circle({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.add_icon_circle.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/facebook.svg
  // ignore: non_constant_identifier_names
  AssetSvg facebook({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.facebook.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/facebook_logo.svg
  // ignore: non_constant_identifier_names
  AssetSvg facebook_logo({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.facebook_logo.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/forbidden.svg
  // ignore: non_constant_identifier_names
  AssetSvg forbidden({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.forbidden.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/instagram.svg
  // ignore: non_constant_identifier_names
  AssetSvg instagram({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.instagram.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/instagram_logo.svg
  // ignore: non_constant_identifier_names
  AssetSvg instagram_logo({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.instagram_logo.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/sms.svg
  // ignore: non_constant_identifier_names
  AssetSvg sms({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.sms.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/tick_circle.svg
  // ignore: non_constant_identifier_names
  AssetSvg tick_circle({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.tick_circle.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/twitter.svg
  // ignore: non_constant_identifier_names
  AssetSvg twitter({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.twitter.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/twitter_logo.svg
  // ignore: non_constant_identifier_names
  AssetSvg twitter_logo({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.twitter_logo.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/whatsapp.svg
  // ignore: non_constant_identifier_names
  AssetSvg whatsapp({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.whatsapp.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/channels/whatsapp_logo.svg
  // ignore: non_constant_identifier_names
  AssetSvg whatsapp_logo({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.whatsapp_logo.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/Facebook.svg
  // ignore: non_constant_identifier_names
  AssetSvg facebook$1({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.facebook$1.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/Instagram.svg
  // ignore: non_constant_identifier_names
  AssetSvg instagram$1({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.instagram$1.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/Twitter.svg
  // ignore: non_constant_identifier_names
  AssetSvg twitter$1({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.twitter$1.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/attachment.svg
  // ignore: non_constant_identifier_names
  AssetSvg attachment({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.attachment.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/blocked_user.svg
  // ignore: non_constant_identifier_names
  AssetSvg blocked_user({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.blocked_user.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/bodsquare.svg
  // ignore: non_constant_identifier_names
  AssetSvg bodsquare({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.bodsquare.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/chat_details_eclipse.svg
  // ignore: non_constant_identifier_names
  AssetSvg chat_details_eclipse(
      {required double width, required double height}) {
    final imageProvider = AssetSvg(asset.chat_details_eclipse.keyName,
        width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/chat_timer_icon.svg
  // ignore: non_constant_identifier_names
  AssetSvg chat_timer_icon({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.chat_timer_icon.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/double_ticker.svg
  // ignore: non_constant_identifier_names
  AssetSvg double_ticker({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.double_ticker.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/downloaded.svg
  // ignore: non_constant_identifier_names
  AssetSvg downloaded({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.downloaded.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/facebook_user.svg
  // ignore: non_constant_identifier_names
  AssetSvg facebook_user({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.facebook_user.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/file_preview_cancel.svg
  // ignore: non_constant_identifier_names
  AssetSvg file_preview_cancel(
      {required double width, required double height}) {
    final imageProvider = AssetSvg(asset.file_preview_cancel.keyName,
        width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/instagram_user.svg
  // ignore: non_constant_identifier_names
  AssetSvg instagram_user({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.instagram_user.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/microphone.svg
  // ignore: non_constant_identifier_names
  AssetSvg microphone({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.microphone.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/no_message_yet.svg
  // ignore: non_constant_identifier_names
  AssetSvg no_message_yet({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.no_message_yet.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/report_flag.svg
  // ignore: non_constant_identifier_names
  AssetSvg report_flag({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.report_flag.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/send_message_icon.svg
  // ignore: non_constant_identifier_names
  AssetSvg send_message_icon({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.send_message_icon.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/single_ticker.svg
  // ignore: non_constant_identifier_names
  AssetSvg single_ticker({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.single_ticker.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/twitter_user.svg
  // ignore: non_constant_identifier_names
  AssetSvg twitter_user({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.twitter_user.keyName, width: width, height: height);
    return imageProvider;
  }

  /// asset: assets/images/conversations/whatsapp_user.svg
  // ignore: non_constant_identifier_names
  AssetSvg whatsapp_user({required double width, required double height}) {
    final imageProvider =
        AssetSvg(asset.whatsapp_user.keyName, width: width, height: height);
    return imageProvider;
  }
}

/// This `_R_Text` class is generated and contains references to static text asset resources.
// ignore: camel_case_types
class _R_Text {
  const _R_Text();

  final asset = const _R_Text_AssetResource();
}

/// This `_R_FontFamily` class is generated and contains references to static font asset resources.
// ignore: camel_case_types
class _R_FontFamily {
  const _R_FontFamily();
}
