import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/linking/controllers/linking_controller.dart';
import 'package:bodsquare_sdk/linking/views/connected_accounts_view.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectAnotherChannelBottomsheet extends StatefulWidget {
  const SelectAnotherChannelBottomsheet({super.key});

  @override
  State<SelectAnotherChannelBottomsheet> createState() =>
      _SelectAnotherChannelBottomsheetState();
}

class _SelectAnotherChannelBottomsheetState
    extends State<SelectAnotherChannelBottomsheet> {
  @override
  void initState() {
    LinkingController(context: context).getSocialMediaAccounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: ffffff,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(
          //   height: 25,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(
                color: one71D26,
              ),
              const Text(
                'Select a channel',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: one71D26,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: one71D26,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const ChannelWidget(
            name: 'Instagram',
          ),
          const SizedBox(
            height: 12,
          ),
          const ChannelWidget(
            name: 'Facebook',
          ),
          const SizedBox(
            height: 12,
          ),
          const ChannelWidget(
            name: 'WhatsApp',
          ),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 225,
          ),
        ],
      ),
    );
  }
}

class ChannelWidget extends StatelessWidget {
  const ChannelWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            shape: bottomsheetRadius,
            builder: (context) => ConnectedAccountsBottomsheet(
                  channelName: name,
                ));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: zero066FF.withOpacity(.16)),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                name == 'Instagram'
                    ? R.svg.asset.instagram_logo.assetName
                    : name == 'Facebook'
                        ? R.svg.asset.facebook_logo.assetName
                        : name == 'Whatsapp'
                            ? R.svg.asset.whatsapp.assetName
                            : R.svg.asset.twitter.assetName,
                package: "bodsquare_sdk",
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: one71D26,
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: true,
                      context: context,
                      shape: bottomsheetRadius,
                      builder: (context) => ConnectedAccountsBottomsheet(
                            channelName: name,
                          ));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: zero066FF.withOpacity(.08),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'Add'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: zero066FF,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
