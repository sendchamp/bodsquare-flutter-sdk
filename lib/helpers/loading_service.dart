import 'dart:developer';

import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/snackbar_service.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingService {
  final BuildContext? context;

  LoadingService({required this.context});

  void dismiss() {
    // Navigator.of(context).pop();
    // check if there's an overlay
    if (context != null) {
      BuildContext context = this.context!;
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
      // log('dismissed');
    } else {
      return;
    }
  }

  // _isThereCurrentDialogShowing(BuildContext context) =>
  //     ModalRoute.of(context)?.isCurrent != true;

  Future<void> navigateToPage(BuildContext context, Widget page) async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void show({String? status}) {
    // write a simple loader that uses a context in flutter
    showDialog(
        context: context!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SpinKitFadingCircle(
            color: ffffff,
          );
          // const SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   status ?? 'loading...',
          //   style: const TextStyle(color: Colors.black, fontSize: 16),
          // ),
          // ],

          // );
        });
  }

  // void dismissLoader() {
  //   //dismiss the first dialog
  //   Navigator.of(context!).pop();
  // }

  // void showSuccess(String description) {
  //   ElegantNotification.success(description: Text(description)).show(context!);
  // }

  void showSuccess(String description) async {
    Get.defaultDialog(
        title: description,
        titlePadding: const EdgeInsets.symmetric(vertical: 14),
        content: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 40,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        radius: 4);
    await Future.delayed(Duration(milliseconds: 1600));
    hideLoading();
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  //show error
  void showError(String description) {
    if (description.contains("DioErrorType.other")) {
      final statusz = humanReadableErrors(description);
      ElegantNotification.error(description: Text(statusz)).show(context!);
    } else {
      ElegantNotification.error(description: Text(description)).show(context!);
    }
  }

  // show info
  void showInfo(String description) {
    ElegantNotification.info(description: Text(description)).show(context!);
  }
// }
  // void init() {
  //   EasyLoading.instance
  //     ..displayDuration = const Duration(milliseconds: 2000)
  //     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  //     ..loadingStyle = EasyLoadingStyle.dark
  //     ..indicatorSize = 45.0
  //     ..radius = 10.0
  //     ..progressColor = const Color(0xff0066FF)
  //     ..backgroundColor = const Color(0xffffffff)
  //     ..indicatorColor = const Color(0xff0066FF)
  //     ..textColor = const Color(0xff1A1A1A)
  //     ..maskColor = const Color(0xff1A1A1A).withOpacity(.5)
  //     ..userInteractions = true
  //     ..dismissOnTap = false;
  // }

  // Future<void> showToast(String status,
  //     {EasyLoadingToastPosition? toastPosition}) async {
  //   await EasyLoading.showToast(status,
  //       toastPosition: toastPosition ?? EasyLoadingToastPosition.bottom);
  // }

  // void show({String? status}) {
  //   EasyLoading.show(status: status);
  // }

  // void showSuccess(String status) async {
  //   dismiss();
  //   Future.delayed(Duration.zero, () {
  //     Snack(context!).show(
  //         content: status,
  //         snackType: SnackType.success,
  //         behavior: SnackBarBehavior.floating);
  //   });

  // EasyLoading.showSuccess(status);

  // getSnackBar(status);
  // }

  // void showInfo(String status) async {
  //   dismiss();
  //   Future.delayed(Duration.zero, () {
  //     Snack(context!).show(
  //         content: status,
  //         snackType: SnackType.info,
  //         behavior: SnackBarBehavior.floating);
  //   });

  // EasyLoading.showSuccess(status);

  // getSnackBar(status);
  // }

  // void showProgress(double progress, {String? status}) {
  //   EasyLoading.showProgress(progress, status: status);
  // }

  // void showError(String status) {
  // dismiss();

  // // if (status.contains("DioErrorType.other")) {
  // if (status.contains("DioErrorType.other")) {
  //   final statusz = humanReadableErrors(status);
  //   Future.delayed(Duration.zero, () {
  //     Snack(context!).show(
  //         content: statusz,
  //         snackType: SnackType.error,
  //         behavior: SnackBarBehavior.floating);
  //   });
  // } else {
  //   Future.delayed(Duration.zero, () {
  //     Snack(context!).show(
  //         content: status,
  //         snackType: SnackType.error,
  //         behavior: SnackBarBehavior.floating);
  //   });
  // }
  // Future.delayed(Duration.zero, () {
  //   Snack.show(
  //       content: status,
  //       snackType: SnackType.error,
  //       behavior: SnackBarBehavior.floating);
  // });
  // EasyLoading.showError(status);
  // }

  // void dismiss() {
  //   EasyLoading.dismiss();
  // }
}

// write a function that returns human readable errors

String humanReadableErrors(String error) {
  final statusz = error.split("Source stack").first;
  return statusz.contains("SocketException")
      ? "Error: No network connection"
      : statusz;
}

enum NetworkConnectionStatus { success, error, info, loading, none }
