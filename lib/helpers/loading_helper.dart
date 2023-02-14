import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingHelper extends StatelessWidget {
  const LoadingHelper({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitFadingCircle(color: zero066FF.withOpacity(.5)),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: satoshiMedium14.copyWith(
              color: zero066FF,
            ),
          ),
        ],
      ),
    );
  }
}
