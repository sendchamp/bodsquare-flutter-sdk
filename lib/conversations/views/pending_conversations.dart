// import 'package:bodsquare/app/extensions/date_time_extension.dart';
// import 'package:bodsquare/app/modules/conversations/controllers/conversations_controller.dart';
// import 'package:bodsquare/app/modules/conversations/views/active_conversation_chat.dart';
// import 'package:bodsquare/app/modules/conversations/widgets/close_or_delete_chat_bottomsheet.dart';
// import 'package:bodsquare/app/modules/conversations/widgets/delete_conversation_warning.dart';
// import 'package:bodsquare/app/services/bodsquare_app_data.dart';
// import 'package:bodsquare/app/themes/themes.dart';
// import 'package:bodsquare/app/widgets/swipe_to_dismiss_widget.dart';
import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

class PendingConversations extends StatelessWidget {
  const PendingConversations({
    Key? key,
  }) : super(key: key);

  // ConversationsController controller = Get.find();

  // BodSquareAppData bodSquareAppData = Get.put(BodSquareAppData());

  // final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return const Text('PendingConversations');
    // return controller.pendingConversationsListLength.value == 0
    //     ?
    //     Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           SvgPicture.asset(
    //             R.svg.asset.no_message_yet.assetName,
    //             height: 96.h,
    //             width: 96.w,
    //           ),
    //           Center(
    //             child: Text(
    //               'You currently don’t have \nany messages yet',
    //               style: satoshiMedium16.copyWith(color: a2A2A2),
    //               textAlign: TextAlign.center,
    //             ),
    //           ),
    //         ],
    //       )
    //     : SmartRefresher(
    //         controller: _refreshController,
    //         onRefresh: () async {
    //           await controller.getAllConversations();
    //           _refreshController.refreshCompleted();
    //         },
    //         child: ListView.builder(
    //             itemCount: controller.pendingConversationsListLength.value,
    //             itemBuilder: (context, index) {
    //               return Column(
    //                 children: [
    //                   SizedBox(
    //                     // height: 80.h,
    //                     child: Dismissible(
    //                       background: SwipeToDismissBackgroundWidget(),
    //                       direction: DismissDirection.endToStart,
    //                       key: Key(controller.pendingConversationsList[index].id
    //                           .toString()),
    //                       confirmDismiss: (direction) async {
    //                         Get.bottomSheet(CloseOrDeleteChatBottomsheet(
    //                           uid: controller
    //                               .pendingConversationsList[index].uid,
    //                           type: ConversationType.pending,
    //                         ));

    //                         return null;
    //                       },
    //                       child: ListTile(
    //                           onTap: () {
    //                             controller.getSingleConversation(controller
    //                                 .pendingConversationsList[index].uid
    //                                 .toString());
    //                             Get.to(() => ActiveConversationChat(
    //                                   item: controller
    //                                       .pendingConversationsList[index],
    //                                 ));
    //                           },
    //                           leading: ProfilePlatformIndicator(
    //                             platform: controller
    //                                     .pendingConversationsList[index]
    //                                     .channel ??
    //                                 '',
    //                             profilePicture: controller
    //                                     .pendingConversationsList[index]
    //                                     .contact
    //                                     ?.profilePicture ??
    //                                 '',
    //                           ),
    //                           // activeConversationController:
    //                           //     activeConversationController,
    //                           // index: index),
    //                           title: Text(
    //                             (controller.pendingConversationsList[index]
    //                                         .contact?.firstName ??
    //                                     '') +
    //                                 ' ' +
    //                                 (controller.pendingConversationsList[index]
    //                                         .contact?.lastName ??
    //                                     ''),
    //                             style: satoshiBold16.copyWith(color: oneA1A1A),
    //                           ),
    //                           isThreeLine: true,
    //                           subtitle: Text(
    //                             controller.pendingConversationsList[index]
    //                                     .lastMessage ??
    //                                 '',
    //                             style: satoshiRegular12,
    //                             // maxLines: 2,
    //                             overflow: TextOverflow.ellipsis,
    //                           ),
    //                           trailing: _LastChatInfo(
    //                               activeConversationController: controller,
    //                               index: index)),
    //                     ),
    //                   ),
    //                   Divider(
    //                     color: c6C6C8,
    //                     // thickness: 0.35.h,
    //                   )
    //                 ],
    //               );
    //             }),
    //       );
  }
}

// class ProfilePlatformIndicator extends StatelessWidget {
//   ProfilePlatformIndicator({
//     Key? key,
//     this.platform,
//     this.profilePicture,
//   }) : super(key: key);

//   String? platform;
//   final String? profilePicture;
//   // final int index;
//   final BodSquareAppData bodSquareAppData = Get.put(BodSquareAppData());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.h,
//       width: 56.w,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: c4C4C4,
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             right: 0,
//             left: 0,
//             top: 0,
//             bottom: 0,
//             child: ClipRRect(
//               // borderRadius: BorderRadius.circular(50.r),
//               child: CachedNetworkImage(
//                 imageUrl: profilePicture ?? '',
//                 imageBuilder: (context, imageProvider) => Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 placeholder: (context, url) => Center(
//                   child: Icon(
//                     Icons.person_rounded,
//                     color: ffffff,
//                   ),
//                 ),
//                 errorWidget: (context, url, error) => Center(
//                   child: Icon(
//                     Icons.person_rounded,
//                     color: ffffff,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               width: 16.w,
//               height: 16.w,
//               child: platform?.toLowerCase() == 'whatsapp'
//                   ? SvgPicture.asset(R.svg.asset.whatsapp_user.assetName)
//                   : platform?.toLowerCase() == 'instagram'
//                       ? SvgPicture.asset(R.svg.asset.instagram$1.assetName)
//                       : platform?.toLowerCase() == 'twitter'
//                           ? SvgPicture.asset(R.svg.asset.twitter$1.assetName)
//                           : platform?.toLowerCase() == 'facebook'
//                               ? SvgPicture.asset(
//                                   R.svg.asset.facebook$1.assetName)
//                               : SizedBox(),

//               //  SvgPicture.asset(
//               //   (R.svg.asset.facebook$1.assetName),
//               // )
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _LastChatInfo extends StatelessWidget {
//   const _LastChatInfo({
//     Key? key,
//     required this.activeConversationController,
//     required this.index,
//   }) : super(key: key);

//   final ConversationsController activeConversationController;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         Text(
//           (activeConversationController
//                       .pendingConversationsList[index].updatedAt
//                       ?.toLocal() as DateTime)
//                   .isToday
//               ? DateFormat.jm().format(activeConversationController
//                   .pendingConversationsList[index].updatedAt
//                   ?.toLocal() as DateTime)
//               : (activeConversationController
//                           .pendingConversationsList[index].updatedAt
//                           ?.toLocal() as DateTime)
//                       .isYesterday
//                   ? "Yesterday"
//                   : DateFormat.yMd().format(activeConversationController
//                       .pendingConversationsList[index].updatedAt
//                       ?.toLocal() as DateTime),
//         ),
//         Container(
//           height: 25.h,
//           width: 25.w,
//           child: activeConversationController
//                       .pendingConversationsList[index].noOfUnseenMessages !=
//                   '0'
//               ? Container(
//                   decoration: BoxDecoration(
//                       color: zero066FF,
//                       borderRadius: BorderRadius.circular(12.r)),
//                   child: Center(
//                     child: FittedBox(
//                       fit: BoxFit.fitWidth,
//                       child: Text(
//                         activeConversationController
//                                 .pendingConversationsList[index]
//                                 .noOfUnseenMessages ??
//                             '',
//                         style: satoshiRegular12.copyWith(color: ffffff),
//                       ),
//                     ),
//                   ),
//                 )
//               : SizedBox(),
//         ),
//       ],
//     );
//   }
// }
