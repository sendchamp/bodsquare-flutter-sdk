// // import 'package:bodsquare/app/extensions/string_extensions.dart';

// import 'dart:developer';
// import 'dart:io';

// import 'package:any_link_preview/any_link_preview.dart';
// import 'package:bodsquare/app/extensions/date_time_extension.dart';
// import 'package:bodsquare/app/modules/contacts/models/contact_response/contact_response_data.dart';
// import 'package:bodsquare/app/modules/contacts/views/contact_info_view.dart';
// import 'package:bodsquare/app/modules/conversations/controllers/conversations_controller.dart';
// import 'package:bodsquare/app/modules/conversations/models/conversation_model/conversation_message.dart';
// import 'package:bodsquare/app/modules/conversations/models/get_all_conversations/get_all_conversations.dart';
// import 'package:bodsquare/app/modules/conversations/views/active_conversations.dart';
// import 'package:bodsquare/app/modules/conversations/views/audio_player_view.dart';
// import 'package:bodsquare/app/modules/conversations/views/audio_recorder_page.dart';
// import 'package:bodsquare/app/modules/conversations/views/file_preview_page.dart';
// import 'package:bodsquare/app/modules/conversations/views/insta_story.dart';
// import 'package:bodsquare/app/modules/conversations/views/view_attachment_page.dart';
// import 'package:bodsquare/app/modules/conversations/views/view_video_page.dart';
// import 'package:bodsquare/app/modules/conversations/widgets/attachments_bottomsheet.dart';
// import 'package:bodsquare/app/modules/conversations/widgets/report_conversation_bottomsheet.dart';
// import 'package:bodsquare/app/modules/conversations/widgets/unblock_user_bottomsheet.dart';
// import 'package:bodsquare/app/themes/themes.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:get/get.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:intl/intl.dart';
// import 'package:native_linkify/native_linkify.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:video_player/video_player.dart';

// class ActiveConversationChat extends StatefulWidget {
//   ActiveConversationChat({
//     Key? key,
//     required this.item,
//   }) : super(key: key);

//   // final ConversationData item;
//   final GetAllConversationsData item;

//   @override
//   State<ActiveConversationChat> createState() => _ActiveConversationChatState();
// }

// class _ActiveConversationChatState extends State<ActiveConversationChat> {
//   final ConversationsController _conversationsController = Get.find();

//   bool? connected; // boolean value to track connection statu

//   TextEditingController msgtext = TextEditingController();
//   // static final GlobalKey _listKey = GlobalKey();

//   @override
//   void initState() {
//     _conversationsController.getOfflineMessage(widget.item.uid ?? '');

//     _conversationsController.singleConversation.value = true;
//     _conversationsController.currentContactId.value =
//         widget.item.contactUid ?? '';
//     _conversationsController.currentConversationId.value =
//         widget.item.uid ?? '';

//     _conversationsController.currentChannel.value = widget.item.channel ?? '';
//     log(_conversationsController.singleConversation.value.toString());
//     _conversationsController.addListenerToTextMessageController();
//     _conversationsController.update();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _conversationsController.singleConversation.value = false;
//     _conversationsController.currentContactId.value = '';
//     _conversationsController.currentConversationId.value = '';
//     log(_conversationsController.singleConversation.value.toString());
//     _conversationsController.textMessageController.clear();
//     _conversationsController.removeTextMessageControllerListener();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ConversationsController>(

//         // init: ConversationsController(),
//         builder: (_controller) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (_controller.scrollController.hasClients) {
//           _controller.scrollController.jumpTo(
//             _controller.scrollController.position.maxScrollExtent,
//           );
//         }
//       });
//       return GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//             appBar: AppBar(
//               foregroundColor: oneA1A1A,
//               backgroundColor: Colors.white,
//               elevation: 1,
//               toolbarHeight: 76.h,
//               title: Container(
//                 width: Get.width,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () => Get.to(ContactInfoView(
//                             contactData: ContactResponseData.fromJson(
//                                 widget.item.contact!.toJson()))),
//                         child: Row(
//                           children: [
//                             ProfilePlatformIndicator(
//                               platform: widget.item.channel,
//                               profilePicture:
//                                   widget.item.contact?.profilePicture ?? '',
//                             ),
//                             SizedBox(
//                               width: 10.w,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Text(
//                                       (widget.item.contact?.firstName ?? '') +
//                                           ' ' +
//                                           (widget.item.contact?.lastName ?? '')
//                                               .capitalize
//                                               .toString(),
//                                       style: satoshiBold16.copyWith(
//                                         color: oneA1A1A,
//                                       )),
//                                   Text(
//                                     'via ${widget.item.channel?.capitalize.toString() ?? 'Unknown'}',
//                                     style: satoshiRegular12.copyWith(
//                                         color: oneA1A1A.withOpacity(.68)),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // widget.item.status?.toLowerCase() == 'blocked'
//                     _controller.isBlocked.value
//                         ? TextButton(
//                             onPressed: null,
//                             child: SvgPicture.asset(
//                                 R.svg.asset.blocked_user.assetName))
//                         : TextButton(
//                             onPressed: () {
//                               log(widget.item.uid.toString());
//                               Get.bottomSheet(
//                                   ReportConversationBottomSheet(
//                                     conversationId:
//                                         widget.item.contact!.uid.toString(),
//                                     contact: widget.item.contact!,
//                                   ),
//                                   isScrollControlled: true);
//                             },
//                             child: Icon(
//                               Icons.more_vert,
//                               color: b2B2B2,
//                             )),
//                   ],
//                 ),
//               ),
//             ),
//             body: Container(
//               padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
//               child: Column(
//                 children: [
//                   Expanded(
//                       child: GroupedListView<ConversationMessage, int?>(
//                     // key: _listKey,
//                     order: GroupedListOrder.DESC,
//                     controller: _conversationsController.scrollController,
//                     // reverse: true,
//                     // physics: NeverScrollableScrollPhysics,
//                     stickyHeaderBackgroundColor: Colors.transparent,
//                     // controller: scrollController,
//                     elements: _controller.individualConversationMessages,
//                     groupBy: (ConversationMessage _) => DateTime.now()
//                         .difference(_.createdAt?.toLocal() ?? DateTime.now())
//                         .inDays,
//                     groupComparator: (value2, value1) =>
//                         value2!.compareTo(value1!),
//                     itemComparator: (a, b) {
//                       if (a.createdAt != null && b.createdAt != null) {
//                         return a.createdAt!.compareTo(b.createdAt!);
//                       } else {
//                         return 0;
//                       }
//                     },
//                     // b.createdAt!.compareTo(a.createdAt!),
//                     // itemComparator: (element1, element2) => element2
//                     //     .createdAt!
//                     //     .toLocal()
//                     //     .compareTo(element1.createdAt!.toLocal()),
//                     floatingHeader: false,
//                     // itemPositionsListener: ,
//                     groupHeaderBuilder: (ConversationMessage _) {
//                       return Align(
//                         alignment: Alignment.topCenter,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: borderRadius12,
//                               color: e5E7EB.withOpacity(.56)),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 2.h, horizontal: 10.w),
//                           child: SizedBox(
//                             // width: 10.w,
//                             child: Text(
//                               _.createdAt!.toLocal().isToday
//                                   ? 'Today'
//                                   // DateFormat.jm().format(_.date as DateTime)
//                                   : _.createdAt!.toLocal().isYesterday
//                                       ? "Yesterday"
//                                       : DateFormat.yMd().format(
//                                           _.createdAt!.toLocal(),
//                                         ),
//                               textAlign: TextAlign.center,
//                               style: satoshiMedium14.copyWith(
//                                   color: oneA1A1A, fontSize: 12),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     indexedItemBuilder:
//                         (context, ConversationMessage chat, item) {
//                       return _ChatWidget(
//                         conversation: widget.item,
//                         chat: chat,
//                         channelName: widget.item.channel ?? '',
//                       );
//                     },
//                   )),
//                   SizedBox(
//                     height: 16.h,
//                   ),
//                   _controller.isBlocked.value
//                       ? Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: f0F2F3, borderRadius: borderRadius16),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 10.h, horizontal: 12.w),
//                                     child: Text(
//                                       'This user has been blocked by you.\n No conversation sent by you will be received.',
//                                       style: satoshiRegular12.copyWith(
//                                           color: oneA1A1A),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: oneA1A1A.withOpacity(.1),
//                                   ),
//                                   TextButton(
//                                       onPressed: () {
//                                         Get.bottomSheet(UnblockUserBottomSheet(
//                                             conversationId: widget
//                                                 .item.contact!.uid
//                                                 .toString()));
//                                       },
//                                       child: Text(
//                                         'Unblock user',
//                                         style: satoshiRegular12.copyWith(
//                                             color: oneA1A1A,
//                                             fontWeight: FontWeight.bold),
//                                       ))
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 144.h,
//                             ),
//                           ],
//                         )
//                       : _SendMessageWidget(
//                           // scrollController:
//                           //     _conversationsController.scrollController,
//                           ),
//                   SizedBox(
//                     height: 14.h,
//                   ),
//                 ],
//               ),
//             )),
//       );
//     });
//   }
// }

// class _DeleteConversation extends StatelessWidget {
//   _DeleteConversation(
//       {Key? key,
//       required this.conversationId,
//       required this.messageId,
//       required this.channelName})
//       : super(key: key);

//   final ConversationsController activeConversationController = Get.find();
//   final String conversationId;
//   final String messageId;
//   final String channelName;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12.r))),
//       alignment: Alignment.center,
//       content: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Deleting this message will only delete a copy of the message on the Bodsquare app',
//               style: satoshiMedium14.copyWith(color: oneA1A1A, height: 1.5.h),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 40),
//             Divider(
//               color: f8F8F8,
//             ),
//             IntrinsicHeight(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       child: Text(
//                         'Cancel',
//                         style: satoshiMedium14.copyWith(color: oneA1A1A),
//                       ),
//                       onPressed: () {
//                                                 Navigator.pop(context);

//                         activeConversationController.update();
//                       },
//                     ),
//                   ),
//                   VerticalDivider(
//                     color: f8F8F8,
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       child: Text('Delete',
//                           style: satoshiMedium14.copyWith(color: f63115)),
//                       onPressed: () {
//                         activeConversationController.deleteMessage(
//                           conversationId: conversationId,
//                           messageId: messageId,
//                           channelName: channelName,
//                         );
//                         //
//                         activeConversationController.update();
//                                                 Navigator.pop(context);

//                       },
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ConfirmCopyOrDeleteConversation extends StatelessWidget {
//   _ConfirmCopyOrDeleteConversation(
//       {Key? key,
//       required this.conversationId,
//       required this.chat,
//       required this.channelName})
//       : super(key: key);

//   final ConversationsController activeConversationController = Get.find();
//   final String conversationId;
//   final ConversationMessage chat;
//   final String channelName;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12.r))),
//       alignment: Alignment.center,
//       child: Builder(builder: (context) {
//         return IntrinsicWidth(
//           child: Container(
//             child: Row(
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                                               Navigator.pop(context);

//                       log('copy pressed');
//                       activeConversationController.clipboardService
//                           .copy(chat.message ?? '');
//                     },
//                     icon: Icon(Icons.copy)),
//                 IconButton(
//                     onPressed: () {
//                       log('delete PRessed');
//                                               Navigator.pop(context);

//                       Get.bottomSheet(_DeleteConversation(
//                           conversationId: conversationId,
//                           messageId: chat.uid ?? '',
//                           channelName: channelName));
//                     },
//                     icon: Icon(Icons.delete, color: f63115)),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

// class _ChatWidget extends StatelessWidget {
//   _ChatWidget(
//       {Key? key,
//       required this.conversation,
//       required this.chat,
//       required this.channelName})
//       : super(key: key);

//   final GetAllConversationsData conversation;
//   // final ConversationsController controller;
//   final ConversationMessage chat;
//   final String channelName;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//           top: 12.h,
//           left: chat.messageFrom?.toLowerCase() == 'company' ? 65.w : 0,
//           right: chat.messageFrom?.toLowerCase() == 'company' ? 0 : 65.w),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           chat.messageFrom?.toLowerCase() != 'company'
//               ? Container(
//                   margin: EdgeInsets.only(right: 8.w),
//                   height: 28.w,
//                   width: 28.w,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: zero066FF.withOpacity(.1),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(50.w),
//                     child: CachedNetworkImage(
//                       height: 150.h,
//                       width: 150.w,
//                       imageUrl: conversation.contact?.profilePicture ?? '',
//                       placeholder: (context, url) => Center(
//                         child: Icon(
//                           Icons.person_rounded,
//                           color: ffffff,
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Center(
//                         child: Icon(
//                           Icons.person_rounded,
//                           color: ffffff,
//                         ),
//                       ),
//                     ),
//                   ))
//               : SizedBox(),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onLongPress: () {
//                     Get.dialog(_ConfirmCopyOrDeleteConversation(
//                       conversationId: conversation.uid.toString(),
//                       chat: chat,
//                       channelName: channelName,
//                     )
//                         // _DeleteConversation(
//                         //   conversationId: conversation.uid.toString(),
//                         //   messageId: chat.uid.toString())
//                         );
//                   },
//                   child: Container(
//                     // height: 300.h,

//                     decoration: BoxDecoration(
//                       color: chat.messageType?.toLowerCase() == 'image'
//                           ? Colors.transparent
//                           : chat.messageFrom?.toLowerCase() == 'company'
//                               ? f6F6F8
//                               : zero066FF.withOpacity(.08),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(8.r),
//                         topRight: Radius.circular(8.r),
//                         bottomLeft: chat.messageFrom?.toLowerCase() == 'company'
//                             ? Radius.circular(8.r)
//                             : Radius.circular(0.r),
//                         bottomRight:
//                             chat.messageFrom?.toLowerCase() != 'company'
//                                 ? Radius.circular(8.r)
//                                 : Radius.circular(0.r),
//                       ),
//                     ),
//                     child: _MessageType(
//                       chat: chat,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 4.h,
//                 ),
//                 Container(
//                   child: chat.messageFrom?.toLowerCase() != 'company'
//                       ? Container(
//                           width: Get.width,
//                           child: Wrap(
//                               crossAxisAlignment: WrapCrossAlignment.center,

//                               // mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   DateFormat.jm().format(
//                                       chat.createdAt?.toLocal() ??
//                                           DateTime(2022)),
//                                   style: satoshiRegular12.copyWith(
//                                       color: oneA1A1A.withOpacity(.68),
//                                       fontSize: 10.sp),
//                                   textAlign: chat.messageFrom?.toLowerCase() ==
//                                           'company'
//                                       ? TextAlign.end
//                                       : TextAlign.start,
//                                 ),
//                                 SizedBox(
//                                   width: 4.w,
//                                 ),
//                                 SvgPicture.asset(
//                                     R.svg.asset.chat_details_eclipse.assetName),
//                                 SizedBox(
//                                   width: 4.w,
//                                 ),
//                                 Text(
//                                   chat.platform.toString(),
//                                   style: satoshiRegular12.copyWith(
//                                       color: oneA1A1A.withOpacity(.68),
//                                       fontSize: 10.sp),
//                                   textAlign: TextAlign.end,
//                                 ),
//                                 SizedBox(
//                                   width: 4.w,
//                                 ),
//                                 SvgPicture.asset(
//                                     R.svg.asset.chat_details_eclipse.assetName),
//                                 SizedBox(
//                                   width: 4.w,
//                                 ),
//                                 Container(
//                                   child: Text(
//                                     conversation.channel?.toLowerCase() ==
//                                             'facebook'
//                                         ? conversation
//                                                 .facebookConnection?.pageName ??
//                                             ''
//                                         : conversation.channel?.toLowerCase() ==
//                                                 'instagram'
//                                             ? conversation.instagramConnection
//                                                     ?.pageName ??
//                                                 ''
//                                             : conversation.channel
//                                                         ?.toLowerCase() ==
//                                                     'twitter'
//                                                 ? 'Twitter Id : ${conversation.twitterConnection?.id.toString() ?? ''}'
//                                                 : '${conversation.contact?.firstName?.capitalize.toString() ?? ''} ${conversation.contact?.lastName?.capitalize.toString() ?? ''}',
//                                     style: satoshiRegular12.copyWith(
//                                         color: oneA1A1A.withOpacity(.68),
//                                         fontSize: 10.sp),
//                                     textAlign: TextAlign.end,
//                                   ),
//                                 ),
//                               ]),
//                         )
//                       : Container(
//                           width: Get.width,
//                           child: Wrap(
//                             runAlignment: WrapAlignment.end,
//                             alignment: WrapAlignment.end,
//                             // mainAxisAlignment: MainAxisAlignment.end,
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             crossAxisAlignment: WrapCrossAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 DateFormat.jm()
//                                     .format(chat.createdAt!.toLocal()),
//                                 style: satoshiRegular12.copyWith(
//                                     color: oneA1A1A.withOpacity(.68),
//                                     fontSize: 10.sp),
//                                 textAlign:
//                                     chat.messageFrom?.toLowerCase() == 'company'
//                                         ? TextAlign.end
//                                         : TextAlign.start,
//                               ),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               SvgPicture.asset(
//                                   R.svg.asset.chat_details_eclipse.assetName),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               Text(
//                                 chat.platform.toString(),
//                                 style: satoshiRegular12.copyWith(
//                                     color: oneA1A1A.withOpacity(.68),
//                                     fontSize: 10.sp),
//                                 textAlign: TextAlign.end,
//                               ),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               SvgPicture.asset(
//                                   R.svg.asset.chat_details_eclipse.assetName),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               chat.status == 'offline'
//                                   ? SvgPicture.asset(
//                                       R.svg.asset.chat_timer_icon.assetName)
//                                   : chat.status!
//                                           .toLowerCase()
//                                           .contains('queued')
//                                       ? SvgPicture.asset(
//                                           R.svg.asset.single_ticker.assetName,
//                                           color: Colors.grey,
//                                         )
//                                       : chat.status?.toLowerCase() ==
//                                               'delivered'
//                                           ? SvgPicture.asset(
//                                               R.svg.asset.double_ticker
//                                                   .assetName,
//                                               color: Colors.grey,
//                                             )
//                                           : chat.status?.toLowerCase() ==
//                                                   'received'
//                                               ? SvgPicture.asset(
//                                                   R.svg.asset.double_ticker
//                                                       .assetName,
//                                                   color: Colors.grey,
//                                                 )
//                                               : chat.status?.toLowerCase() ==
//                                                       'failed'
//                                                   ? Text(
//                                                       'Failed',
//                                                       style: satoshiRegular12
//                                                           .copyWith(
//                                                               color: f63115
//                                                                   .withOpacity(
//                                                                       .8),
//                                                               fontSize: 10.sp),
//                                                       textAlign: TextAlign.end,
//                                                     )
//                                                   : SvgPicture.asset(
//                                                       R.svg.asset.single_ticker
//                                                           .assetName,
//                                                       color: Colors.grey,
//                                                     ),
//                             ],
//                           ),
//                         ),
//                 )
//               ],
//             ),
//           ),
//           chat.messageFrom?.toLowerCase() == 'company'
//               ? Container(
//                   margin: EdgeInsets.only(left: 8.w),
//                   height: 28.w,
//                   width: 28.w,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: zero066FF.withOpacity(.1),
//                   ),
//                   child: Center(
//                       child: SvgPicture.asset(R.svg.asset.bodsquare.assetName)))
//               : SizedBox(),
//         ],
//       ),
//     );
//   }
// }

// class _SendMessageWidget extends StatelessWidget {
//   _SendMessageWidget({
//     Key? key,
//     // required this.scrollController,
//   }) : super(key: key);

//   // final ScrollController scrollController;
//   // final ConversationsController _controller;

//   sendTextMessage(ConversationsController controller) async {
//     await controller.sendMessage(
//       id: controller.individualConversation.value.data?.conversation?.uid
//               .toString() ??
//           '',
//       message: controller.textMessageController.text,
//       messageType: 'text',
//       channelName: controller
//               .individualConversation.value.data?.conversation?.channel
//               ?.toLowerCase() ??
//           '',
//     );

//     // if (scrollController.hasClients) {
//     //   scrollController.animateTo(
//     //     scrollController.position.maxScrollExtent,
//     //     duration: const Duration(milliseconds: 300),
//     //     curve: Curves.easeOut,
//     //   );
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ConversationsController>(
//         // init: ConversationsController(),
//         builder: (_) {
//       return Container(
//         padding: EdgeInsets.symmetric(vertical: 8.h),
//         decoration: BoxDecoration(
//             // color: f6F6F8,
//             // borderRadius: borderRadius22,
//             border: Border(
//           top: BorderSide(color: eFF2F7, width: 2),
//         )),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Get.bottomSheet(AttachmentsBottomSheet(
//                         conversationId: _.individualConversation.value.data
//                                 ?.conversation?.uid
//                                 .toString() ??
//                             '',
//                         channelName: _.individualConversation.value.data
//                                 ?.conversation?.channel
//                                 ?.toLowerCase() ??
//                             ''));
//                   },
//                   style: TextButton.styleFrom(
//                     minimumSize: Size.zero,
//                     padding: EdgeInsets.zero,
//                   ),
//                   child: SvgPicture.asset(R.svg.asset.attachment.assetName),
//                 ),
//                 Expanded(
//                   child: Container(
//                     constraints: BoxConstraints(
//                       minHeight: 40.h,
//                     ),
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
//                     decoration: BoxDecoration(
//                       color: f6F6F8,
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     child: Center(
//                       child: TextField(
//                         controller: _.textMessageController,
//                         minLines: 1,
//                         maxLines: 4,
//                         onChanged: (_d) {
//                           log(_d);
//                           log(_.textMessageControllerHasText.toString());
//                           log(_.textMessageController.text.toString());
//                         },
//                         decoration: InputDecoration.collapsed(
//                             hintText: 'Send a message'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // _controller.isLoading.value
//                 //     ? SizedBox(
//                 //         width: 20.w,
//                 //         height: 20.h,
//                 //         child: CircularProgressIndicator(
//                 //           valueColor: AlwaysStoppedAnimation<Color>(oneA1A1A),
//                 //         ),
//                 //       )
//                 // :

//                 TextButton(
//                     onPressed: () {
//                       _.textMessageControllerHasText
//                           ? sendTextMessage(_)
//                           : Get.bottomSheet(AudioRecorder(
//                               onStop: (_) => log('audio stopped'),
//                               conversationId: _.individualConversation.value
//                                       .data?.conversation?.uid ??
//                                   '',
//                               channelName: _.individualConversation.value.data
//                                       ?.conversation?.channel
//                                       ?.toLowerCase() ??
//                                   ''));
//                     },
//                     style: TextButton.styleFrom(
//                       minimumSize: Size.zero,
//                       padding: EdgeInsets.all(8),
//                       // tapTargetSize: MaterialTapTargetSize.shrinkWrap
//                     ),
//                     child: _.textMessageControllerHasText
//                         ? SvgPicture.asset(
//                             R.svg.asset.send_message_icon.assetName)
//                         : SvgPicture.asset(R.svg.asset.microphone.assetName)),

//                 // : TextButton(
//                 //     onPressed: () async {
//                 //       await _controller.sendMessage(
//                 //         id: _controller.individualConversation.value.data?.id
//                 //                 .toString() ??
//                 //             '',
//                 //         message: _controller.textMessageController.text,
//                 //         messageType: 'text',
//                 //       );
//                 //       scrollController.animateTo(
//                 //           scrollController.position.maxScrollExtent,
//                 //           duration: Duration(milliseconds: 300),
//                 //           curve: Curves.easeOut);
//                 //     },
//                 //     child: Text('Send'),
//                 //   )
//               ],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

// class _MessageType extends StatefulWidget {
//   _MessageType({Key? key, required this.chat}) : super(key: key);

//   final ConversationMessage chat;

//   @override
//   State<_MessageType> createState() => _MessageTypeState();
// }

// class _MessageTypeState extends State<_MessageType> {
//   late VideoPlayerController _controller;
//   final ConversationsController _conversationsController =
//       Get.find<ConversationsController>();
//   List<LinkifyEntry>? entries = [];

//   @override
//   void initState() {
//     super.initState();
//     if (widget.chat.messageType?.toLowerCase() == 'video') {
//       _controller = VideoPlayerController.network(widget.chat.message ?? '')
//         ..initialize().then((value) {
//           setState(() {});
//         });
//     } else {
//       // _controller = VideoPlayerController.network(widget.chat.message ?? '');
//     }
//     linkifyText();
//   }

//   // @override
//   // void didChangeDependencies() async {
//   //   // _controller.initialize();
//   //   await linkifyText();
//   //   super.didChangeDependencies();
//   // }

//   @override
//   void dispose() {
//     super.dispose();
//     // _controller.removeListener(() {});
//     if (widget.chat.messageType?.toLowerCase() == 'video') {
//       _controller.dispose();
//     }
//   }

//   Future<void> linkifyText() async {
//     if (widget.chat.messageType == "text") {
//       entries = await NativeLinkify.linkify(widget.chat.message.toString());
//       if (mounted) {
//         setState(() {});
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.chat.messageType?.toLowerCase() == 'text') {
//       return Container(
//         padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             for (final k in entries!)
//               if (k is LinkifyUrl)
//                 AnyLinkPreview(
//                   link: k.url,
//                   displayDirection: UIDirection.uiDirectionHorizontal,
//                   showMultimedia: true,
//                   bodyMaxLines: 4,
//                   bodyTextOverflow: TextOverflow.ellipsis,
//                   titleStyle: satoshiRegular14.copyWith(
//                       color: oneA1A1A, fontWeight: FontWeight.bold),
//                   bodyStyle: satoshiRegular12.copyWith(
//                       color: oneA1A1A, fontSize: 12.sp),

//                   errorWidget: SizedBox(),

//                   cache: Duration(days: 7),
//                   // backgroundColor: Colors.grey[300],
//                   borderRadius: 8,
//                   removeElevation: true,
//                   // boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
//                   onTap: () {
//                     launchUrl(Uri.parse(k.url));
//                   },
//                 )
//               else
//                 Container(),
//             Text.rich(
//               TextSpan(
//                 children: [
//                   for (final l in entries!)
//                     if (l is LinkifyText)
//                       // Regular text, text without links
//                       TextSpan(
//                           text: l.text,
//                           style: satoshiRegular14.copyWith(color: oneA1A1A))
//                     else if (l is LinkifyUrl)
//                       // Link
//                       TextSpan(
//                           text: l.text,
//                           style: satoshiRegular14.copyWith(
//                               color: zero066FF,
//                               decoration: TextDecoration.underline),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () async {
//                               if (await canLaunchUrl(Uri.parse(l.url))) {
//                                 await launchUrl(Uri.parse(l.url),
//                                     mode: LaunchMode.externalApplication);
//                               } else {
//                                 throw 'Could not launch ${l.url}';
//                               }
//                             }
//                           // => launchUrl(Uri.parse(l.url)),
//                           )
//                 ],
//               ),
//             ),
//           ],
//         ),
//         //  Linkify(
//         //   onOpen: (link) async {
//         //     if (await canLaunchUrl(Uri.parse(link.url))) {
//         //       await launchUrl(Uri.parse(link.url));
//         //     } else {
//         //       throw 'Could not launch $link';
//         //     }
//         //   },
//         //   text: widget.chat.message.toString(),
//         //   style: satoshiRegular14.copyWith(color: oneA1A1A),
//         // )
//       );
//     }

//     if (widget.chat.isStory == true) {
//       return Container(
//           padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Replied to your story:',
//                   style: satoshiRegular14.copyWith(
//                     color: oneA1A1A.withOpacity(.8),
//                   )),
//               Linkify(
//                 onOpen: (link) async {
//                   if (await canLaunchUrl(Uri.parse(link.url))) {
//                     await launchUrl(Uri.parse(link.url));
//                   } else {
//                     throw 'Could not launch $link';
//                   }
//                 },
//                 text: widget.chat.message.toString(),
//                 style: satoshiRegular14.copyWith(color: oneA1A1A),
//               ),
//               SizedBox(height: 8.h),
//               Divider(),
//               TextButton(
//                   style: TextButton.styleFrom(
//                       minimumSize: Size.zero,
//                       // padding: EdgeInsets.zero,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap),
//                   onPressed: () {
//                     Get.to(() =>
//                         InstaStoryWebView(url: widget.chat.storyUrl ?? ''));
//                     log(widget.chat.storyUrl ?? '');
//                   },
//                   child: Text('View Story',
//                       style: satoshiRegular14.copyWith(color: zero066FF))),
//             ],
//           ));
//     } else {
//       return widget.chat.messageType?.toLowerCase() == 'audio'
//           ? FittedBox(
//               fit: BoxFit.fitWidth,
//               child: AudioPlayer(source: widget.chat.message ?? ''))
//           // Container(
//           //     child: TextButton(
//           //       onPressed: () => Get.to(
//           //           () => AudioPlayer(source: widget.chat.message ?? '')),
//           //       child: Row(
//           //         children: [
//           //           Text(
//           //             'Audio',
//           //             style: satoshiRegular14.copyWith(color: oneA1A1A),
//           //           ),
//           //           SizedBox(width: 8.w),
//           //           Icon(
//           //             Icons.play_circle_outline,
//           //             color: oneA1A1A,
//           //             size: 20.w,
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //   )

//           : widget.chat.messageType?.toLowerCase() == 'video' &&
//                   widget.chat.status == 'offline'
//               ? GestureDetector(
//                   onTap: () => Get.to(() => ViewVideoPagePage(
//                         videoUrl: widget.chat.message ?? '',
//                         source: widget.chat.message ?? '',
//                       )),
//                   child: _controller.value.isInitialized
//                       ? Stack(
//                           // key: UniqueKey(),
//                           children: [
//                             Container(
//                               width: Get.width,
//                               height: 150.h,
//                               child: VideoPlayer(_controller),
//                             ),
//                             Positioned(
//                               top: 0,
//                               right: 0,
//                               bottom: 0,
//                               left: 0,
//                               child: Container(
//                                 width: 40.w,
//                                 height: 40.h,
//                                 child: Icon(
//                                   Icons.play_circle_outline,
//                                   color: zero066FF,
//                                   size: 40.w,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       : Container(
//                           width: 100.w,
//                           height: 100.h,
//                           child: Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         ),
//                 )
//               : widget.chat.messageType?.toLowerCase() == 'video'
//                   ? GestureDetector(
//                       onTap: () => Get.to(() => ViewVideoPagePage(
//                             videoUrl: widget.chat.message ?? '',
//                           )),
//                       child: _controller.value.isInitialized
//                           ? Stack(
//                               children: [
//                                 Container(
//                                   width: Get.width,
//                                   height: 150.h,
//                                   child: VideoPlayer(_controller),
//                                 ),
//                                 Positioned(
//                                   top: 0,
//                                   right: 0,
//                                   bottom: 0,
//                                   left: 0,
//                                   child: Container(
//                                     width: 40.w,
//                                     height: 40.h,
//                                     child: Icon(
//                                       Icons.play_circle_outline,
//                                       color: zero066FF,
//                                       size: 40.w,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           : Container(
//                               width: 100.w,
//                               height: 100.h,
//                               child: Center(
//                                 child: CircularProgressIndicator(),
//                               ),
//                             ),
//                     )
//                   : widget.chat.messageType?.toLowerCase() == 'document' &&
//                           widget.chat.status == 'offline'
//                       ? Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 8.h, horizontal: 16.w),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Document:',
//                                   style: satoshiRegular14.copyWith(
//                                     color: oneA1A1A.withOpacity(.8),
//                                   )),
//                               Icon(
//                                 Icons.file_present_outlined,
//                                 color: zero066FF,
//                               ),
//                             ],
//                           ))
//                       : widget.chat.messageType?.toLowerCase() == 'document'
//                           ? Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 8.h, horizontal: 16.w),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Document:',
//                                       style: satoshiRegular14.copyWith(
//                                         color: oneA1A1A.withOpacity(.8),
//                                       )),
//                                   Icon(
//                                     Icons.file_present_outlined,
//                                     color: zero066FF,
//                                   ),
//                                   Divider(),
//                                   TextButton(
//                                       style: TextButton.styleFrom(
//                                           minimumSize: Size.zero,
//                                           // padding: EdgeInsets.zero,
//                                           tapTargetSize:
//                                               MaterialTapTargetSize.shrinkWrap),
//                                       onPressed: () {
//                                         log('documents');
//                                       },
//                                       child: Text('Download Document',
//                                           style: satoshiRegular14.copyWith(
//                                               color: zero066FF))),
//                                 ],
//                               ))
//                           : widget.chat.messageType?.toLowerCase() == 'image' &&
//                                   widget.chat.status == 'offline'
//                               ? Container(
//                                   height: 150.h,
//                                   width: 150.w,
//                                   child: Stack(
//                                     children: [
//                                       Image.file(
//                                         File(widget.chat.message ?? ''),
//                                       ),
//                                       _conversationsController.isLoading.value
//                                           ? Positioned(
//                                               top: 0,
//                                               right: 0,
//                                               bottom: 0,
//                                               left: 0,
//                                               child: Center(
//                                                 child:
//                                                     CircularProgressIndicator(
//                                                   valueColor:
//                                                       AlwaysStoppedAnimation<
//                                                           Color>(six66666),
//                                                   color:
//                                                       six66666.withOpacity(.5),
//                                                 ),
//                                               ),
//                                             )
//                                           : SizedBox()
//                                     ],
//                                   ),
//                                 )
//                               : GestureDetector(
//                                   onTap: () => Get.to(() => ViewAttachmentPage(
//                                       message: widget.chat,
//                                       messageType: MessageType.image,
//                                       conversationId:
//                                           widget.chat.id.toString())),
//                                   child: CachedNetworkImage(
//                                     height: 150.h,
//                                     width: 150.w,
//                                     imageUrl: widget.chat.message ?? '',
//                                     placeholder: (context, url) => Center(
//                                       child: Icon(
//                                         Icons.image,
//                                         color: ffffff,
//                                       ),
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         Center(
//                                       child: Icon(
//                                         Icons.broken_image_rounded,
//                                         color: ffffff,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//     }
//   }
// }
