import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';

class SwipeToDismissBackgroundWidget extends StatelessWidget {
  const SwipeToDismissBackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: c8C7CC,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
              width: 34,
              child: Icon(
                Icons.more_horiz,
                color: ffffff,
              )),
          const SizedBox(height: 5),
          Text(
            'More ',
            style: satoshiRegular14.copyWith(fontSize: 12, color: ffffff),
          )
        ],
      ),
    );
  }
}
