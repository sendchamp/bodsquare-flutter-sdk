// import 'dart:developer';

// import 'package:bodsquare/app/modules/linking/controllers/linking_controller.dart';
// import 'package:bodsquare/app/modules/linking/models/add_social_media_response.dart';
// import 'package:bodsquare/app/modules/linking/models/channels_model.dart';
// import 'package:bodsquare/app/modules/linking/views/linking_connect_view.dart';
// import 'package:bodsquare/app/modules/manage_integrations/controllers/manage_integrations_controller.dart';
// import 'package:bodsquare/app/modules/manage_integrations/views/manage_integration_detail.dart';
// import 'package:bodsquare/app/services/bodsquare_app_data.dart';
// import 'package:bodsquare/app/services/loading_service.dart';
// import 'package:bodsquare/app/themes/themes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';

// class LinkingDisconnectInstaOrFbPageView extends StatefulWidget {
//   LinkingDisconnectInstaOrFbPageView({Key? key, required this.channel})
//       : super(key: key);

//   final ChannelModel channel;

//   @override
//   State<LinkingDisconnectInstaOrFbPageView> createState() =>
//       _LinkingDisconnectInstaOrFbPageViewState();
// }

// class _LinkingDisconnectInstaOrFbPageViewState
//     extends State<LinkingDisconnectInstaOrFbPageView> {
//   final BodSquareAppData bodSquareAppData = Get.put(BodSquareAppData());
//   // final ManageIntegrationsController _manageIntegrationsController = Get.find();
//   // final LinkingController _linkingController = Get.put(LinkingController());

//   final LoadingService _loadingService = Get.find();
//   late var platform;

//   @override
//   void initState() {
//     // if (widget.channel.channelName?.toLowerCase() == 'instagram') {
//     //   platform = bodSquareAppData.getSocialAccountData.value.instagram!;
//     // } else {
//     //   platform = bodSquareAppData.getSocialAccountData.value.facebook!;
//     // }

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     log(bodSquareAppData.getSocialAccountData.value.facebook!.length
//         .toString());
//     return GetBuilder<LinkingController>(
//       init: LinkingController(),
//       builder: (_) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             foregroundColor: zero60606,
//           ),
//           body: Container(
//             height: Get.height,
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Accounts',
//                       style: satoshiBold24.copyWith(color: oneA1A1A),
//                       textAlign: TextAlign.left,
//                     ),
//                     TextButton(
//                       onPressed: () async {
//                         await Get.to<dynamic>(
//                           () => LinkingConnectView(
//                             channel: widget.channel,
//                           ),
//                         );
//                         _.update();
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: zero066FF,
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 8.w, vertical: 4.h),
//                         child: Row(
//                           children: [
//                             SvgPicture.asset(
//                                 R.svg.asset.add_icon_circle.assetName),
//                             SizedBox(
//                               width: 8.w,
//                             ),
//                             Text(
//                               'Add account',
//                               style: satoshiRegular12.copyWith(
//                                   color: zero066FF,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 12.h,
//                 ),
//                 Text(
//                   'A list of your linked ${widget.channel.channelName?.toLowerCase()} acounts.',
//                   style: satoshiRegular14.copyWith(color: oneA1A1A),
//                   textAlign: TextAlign.left,
//                 ),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount:
//                         widget.channel.channelName?.toLowerCase() == 'facebook'
//                             ? bodSquareAppData
//                                 .getSocialAccountData.value.facebook!.length
//                             : widget.channel.channelName?.toLowerCase() ==
//                                     'instagram'
//                                 ? bodSquareAppData.getSocialAccountData.value
//                                     .instagram!.length
//                                 : widget.channel.channelName?.toLowerCase() ==
//                                         'twitter'
//                                     ? bodSquareAppData.getSocialAccountData
//                                         .value.twitter!.length
//                                     : 0,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: zero066FF.withOpacity(0.24),
//                             width: 1.w,
//                           ),
//                           borderRadius: BorderRadius.circular(8.sp),
//                         ),
//                         margin: EdgeInsets.only(bottom: 12.h),
//                         padding: EdgeInsets.all(20.w),
//                         child: Row(
//                           children: [
//                             Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Account name ${index + 1}',
//                                   style: satoshiMedium16.copyWith(
//                                     color: oneA1A1A,
//                                   ),
//                                 ),
//                                 Text(
//                                   widget.channel.channelName?.toLowerCase() ==
//                                           'facebook'
//                                       ? bodSquareAppData
//                                               .getSocialAccountData
//                                               .value
//                                               .facebook![index]
//                                               .pageName ??
//                                           ''
//                                       : widget.channel.channelName
//                                                   ?.toLowerCase() ==
//                                               'instagram'
//                                           ? bodSquareAppData
//                                                   .getSocialAccountData
//                                                   .value
//                                                   .instagram![index]
//                                                   .pageName ??
//                                               ''
//                                           : widget.channel.channelName
//                                                       ?.toLowerCase() ==
//                                                   'twitter'
//                                               ? 'Twitter page ${bodSquareAppData.getSocialAccountData.value.twitter![index].id.toString()}'
//                                               : 'Unknown',
//                                   style: satoshiRegular12.copyWith(
//                                       fontWeight: FontWeight.w500,
//                                       color: oneA1A1A),
//                                 ),
//                               ],
//                             ),
//                             Spacer(),
//                             TextButton(
//                               style: TextButton.styleFrom(
//                                 padding: EdgeInsets.zero,
//                                 minimumSize: Size.zero,
//                               ),
//                               onPressed: () {
//                                 Get.bottomSheet(_DisconnectChannelBottomSheet(
//                                     channel: widget.channel,
//                                     uId: widget.channel.channelName
//                                                 ?.toLowerCase() ==
//                                             'facebook'
//                                         ? bodSquareAppData.getSocialAccountData
//                                                 .value.facebook![index].uid ??
//                                             ''
//                                         : widget.channel.channelName
//                                                     ?.toLowerCase() ==
//                                                 'instagram'
//                                             ? bodSquareAppData
//                                                     .getSocialAccountData
//                                                     .value
//                                                     .instagram![index]
//                                                     .uid ??
//                                                 ''
//                                             : widget.channel.channelName
//                                                         ?.toLowerCase() ==
//                                                     'twitter'
//                                                 ? bodSquareAppData
//                                                         .getSocialAccountData
//                                                         .value
//                                                         .twitter![index]
//                                                         .uid ??
//                                                     ''
//                                                 : ''));
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: nine79797.withOpacity(0.29),
//                                     borderRadius: BorderRadius.circular(10.r)),
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 4, horizontal: 8.w),
//                                 child: Row(
//                                   children: [
//                                     SvgPicture.asset(
//                                       R.svg.asset.forbidden.assetName,
//                                     ),
//                                     SizedBox(
//                                       width: 8.w,
//                                     ),
//                                     Text(
//                                       'Disconnect',
//                                       style: satoshiRegular12.copyWith(
//                                           color: eight98A8D),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _DisconnectChannelBottomSheet extends StatelessWidget {
//   _DisconnectChannelBottomSheet({
//     Key? key,
//     required this.channel,
//     required this.uId,
//   }) : super(key: key);

//   LinkingController controller = Get.find();
//   final ChannelModel channel;
//   final String? uId;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:
//           BoxDecoration(color: ffffff, borderRadius: borderRadiusTopLR32),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 12.h,
//           ),
//           Container(
//             width: 32.w,
//             height: 4.h,
//             decoration:
//                 BoxDecoration(color: d8D8D8, borderRadius: borderRadius3),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Text(
//             'Disconnect Channel',
//             style: satoshiBold24.copyWith(color: oneA1A1A),
//           ),
//           SizedBox(
//             height: 8.h,
//           ),
//           Text(
//             'Are you sure you want to\ndisconnect this channel?',
//             style: satoshiRegular14.copyWith(color: nine99999),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(
//             height: 32.h,
//           ),
//           Divider(
//             color: f8F8F8,
//             thickness: 2,
//           ),
//           // SizedBox(
//           //   height: 16.h,
//           // ),
//           TextButton(
//               onPressed: () async {
//                 // channel.channelIsConnected = !channel.channelIsConnected!;
//                 controller.deleteSocialAccount(channel, uId ?? '');
//                 // await controller.removeFbOrInstaSocialMedia(
//                 //     id: uId ?? '', channel: channel);

//                 controller.update();

//                 Navigator.pop(context);
//                 log('Disconnected');
//               },
//               child: Text(
//                 'Disconnect',
//                 style: satoshiBold24.copyWith(color: fFF1C36),
//               )),
//           SizedBox(
//             height: 16.h,
//           ),
//           Divider(
//             color: f8F8F8,
//             thickness: 2,
//           ),
//           SizedBox(
//             height: 16.h,
//           ),
//           TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 'Cancel',
//                 style: satoshiBold24.copyWith(color: nine99999),
//               )),
//           SizedBox(
//             height: 50.h,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:bodsquare_sdk/linking/models/channels_model.dart';
import 'package:flutter/material.dart';

class LinkingDisconnectInstaOrFbPageView extends StatelessWidget {
  const LinkingDisconnectInstaOrFbPageView({super.key, required this.channel});

  final ChannelModel channel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Linking Connect View : ${channel.channelName}'),
    ));
  }
}
