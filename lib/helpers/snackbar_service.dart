// ignore_for_file: unused_element

import 'package:another_flushbar/flushbar.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SnackBarService {
  final BuildContext context;
  // final satoshiRegular14 = const TextStyle(
  //   height: 1.35,
  //   fontSize: 14,
  //   fontWeight: FontWeight.w400,
  // );

  final downloadingSnackBar = SnackBar(
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        // SvgPicture.asset(
        //   R.svg.asset.download_icon.assetName,
        //   height: 24.h,
        //   width: 24.w,
        // ),
        Icon(
          Icons.download,
          size: 24,
        ),
        Text('Downloading',
            style: TextStyle(
              height: 1.35,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
      ],
    ),
    duration: const Duration(days: 1),
    action: SnackBarAction(
      label: '✕',
      textColor: zero066FF,
      onPressed: () {},
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: zero066FF, width: 0.5),
      borderRadius: BorderRadius.circular(4),
    ),
    backgroundColor: f5f9ff,
  );

  final downloadedSnackBar = SnackBar(
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SvgPicture.asset(
        //   R.svg.asset.downloaded.assetName,
        //   height: 24.h,
        //   width: 24.w,
        // ),
        const Icon(
          Icons.download_done,
          size: 24,
        ),
        Text(
          'Downloaded',
          style: satoshiRegular14.copyWith(color: fourDAF3F),
          // style: satoshiRegular14.copyWith(color: fourDAF3F),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: '✕',
      textColor: fourDAF3F,
      onPressed: () {},
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: fourDAF3F, width: 0.5),
      borderRadius: BorderRadius.circular(4),
    ),
    backgroundColor: f1F9F0,
  );

  SnackBarService(this.context);
}

const kPadding = 8.0; // up to you

class Snack {
  final BuildContext context;
  Snack(this.context);

  /// show the snack bar
  /// [content] is responsible for the text of the snack bar
  show({
    required String content,
    SnackType snackType = SnackType.info,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) async {
    await Flushbar(
      message: content,
      icon: _getSnackbarIcon(snackType),
      borderColor: _getSnackbarColor(snackType),
      borderRadius: BorderRadius.circular(4.0),
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      flushbarPosition: FlushbarPosition.TOP,
      messageColor: _getSnackbarColor(snackType),
      backgroundColor: _getSnackbarBgColor(snackType),

      // leftBarIndicatorColor: Colors.blue[300],
      mainButton: TextButton(
        onPressed: () {
          Navigator.pop(context);
          // if (Get.isSnackbarOpen) {
          //   Get.closeCurrentSnackbar();
          // }
        },
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          '✕',
          style: satoshiMedium16.copyWith(color: _getSnackbarColor(snackType)),
        ),
      ),
    ).show(context);
  }

  static Color _getSnackbarColor(SnackType type) {
    if (type == SnackType.error) return d52108;
    if (type == SnackType.warning) return five0555C;
    if (type == SnackType.info) return zero066FF;
    if (type == SnackType.success) return fourDAF3F;
    return Colors.white;
  }

  static Color _getSnackbarBgColor(SnackType type) {
    if (type == SnackType.error) return fDF6F5;
    if (type == SnackType.warning) return f8F8F8;
    if (type == SnackType.info) return f5f9ff;
    if (type == SnackType.success) return f8FCF7;
    return Colors.white;
  }

  static Widget _getSnackbarIcon(SnackType type) {
    if (type == SnackType.error) {
      return const Icon(Icons.error_outline, color: d52108);
      // SvgPicture.asset(R.svg.asset.danger_icon.assetName);
    }
    if (type == SnackType.warning) {
      return Icon(Icons.warning_amber_rounded, color: Colors.amber[300]);
      // SvgPicture.asset(R.svg.asset.info_circle_icon.assetName);
    }
    if (type == SnackType.info) {
      return const Icon(Icons.info_outline, color: zero066FF);
      // SvgPicture.asset(R.svg.asset.info_circle_icon.assetName);
    }
    if (type == SnackType.success) {
      return SvgPicture.asset(
        R.svg.asset.tick_circle.assetName,
        package: "bodsquare_sdk",
      );
    }
    return Container();
  }

  static Color _getSnackbarTextColor(SnackType type) {
    if (type == SnackType.error || type == SnackType.info) return Colors.white;

    return const Color(0xff1C1C1C);
  }
}

enum SnackType { info, warning, error, success }
