// import 'package:bodsquare/app/extensions/string_extensions.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:any_link_preview/any_link_preview.dart';
import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_message.dart';
import 'package:bodsquare_sdk/conversations/models/get_all_conversations/get_all_conversations.dart';
import 'package:bodsquare_sdk/conversations/views/audio_player_view.dart';
import 'package:bodsquare_sdk/conversations/views/audio_recorder_page.dart';
import 'package:bodsquare_sdk/conversations/views/file_preview_page.dart';
// import 'package:bodsquare_sdk/conversations/views/insta_story.dart';
import 'package:bodsquare_sdk/conversations/views/view_attachment_page.dart';
import 'package:bodsquare_sdk/conversations/views/view_video_page.dart';
import 'package:bodsquare_sdk/conversations/widgets/attachments_bottomsheet.dart';
import 'package:bodsquare_sdk/conversations/widgets/unblock_user_bottomsheet.dart';
import 'package:bodsquare_sdk/helpers/date_time_extension.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:native_linkify/native_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class ActiveConversationChat extends StatefulWidget {
  const ActiveConversationChat({
    Key? key,
    required this.item,
  }) : super(key: key);

  // final ConversationData item;
  final GetAllConversationsData item;

  @override
  State<ActiveConversationChat> createState() => _ActiveConversationChatState();
}

class _ActiveConversationChatState extends State<ActiveConversationChat> {
  final ConversationsController _conversationsController = Get.find();

  bool? connected; // boolean value to track connection statu

  TextEditingController msgtext = TextEditingController();

  @override
  void initState() {
    _conversationsController.getOfflineMessage(widget.item.uid ?? '');
    _conversationsController.addListenerToTextMessageController();
    _conversationsController.singleConversation.value = true;
    _conversationsController.currentContactId.value =
        widget.item.contactUid ?? '';
    _conversationsController.currentConversationId.value =
        widget.item.uid ?? '';
    _conversationsController.getSingleConversation(widget.item.uid ?? '');
    _conversationsController.currentChannel.value = widget.item.channel ?? '';

    super.initState();
  }

  // void

  @override
  void dispose() {
    _conversationsController.singleConversation.value = false;
    _conversationsController.currentContactId.value = '';
    _conversationsController.currentConversationId.value = '';
    _conversationsController.textMessageController.clear();
    _conversationsController.removeTextMessageControllerListener();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationsController>(builder: (_controller) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_conversationsController.scrollController.hasClients) {
          _conversationsController.scrollController.jumpTo(
              _conversationsController
                  .scrollController.position.maxScrollExtent);
        }
      });
      return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: Get.height * .90,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          // onTap: () => Get.to(ContactInfoView(
                          //     contactData: ContactResponseData.fromJson(
                          //         widget.item.contact!.toJson()))),
                          child: Row(
                            children: [
                              const BackButton(
                                color: oneA1A1A,
                              ),
                              Container(
                                  height: 24,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: c4C4C4,
                                  ),
                                  child: Container(
                                    child: widget.item.channel?.toLowerCase() ==
                                            'whatsapp'
                                        ? SvgPicture.asset(
                                            R.svg.asset.whatsapp_user.assetName,
                                            package: 'bodsquare_sdk',
                                          )
                                        : widget.item.channel?.toLowerCase() ==
                                                'instagram'
                                            ? SvgPicture.asset(
                                                R.svg.asset.instagram$1
                                                    .assetName,
                                                package: 'bodsquare_sdk',
                                              )
                                            : widget.item.channel
                                                        ?.toLowerCase() ==
                                                    'twitter'
                                                ? SvgPicture.asset(
                                                    R.svg.asset.twitter$1
                                                        .assetName,
                                                    package: 'bodsquare_sdk',
                                                  )
                                                : widget.item.channel
                                                            ?.toLowerCase() ==
                                                        'facebook'
                                                    ? SvgPicture.asset(
                                                        R.svg.asset.facebook$1
                                                            .assetName,
                                                        package:
                                                            'bodsquare_sdk',
                                                      )
                                                    : const SizedBox(),

                                    //  SvgPicture.asset(
                                    //   (R.svg.asset.facebook$1.assetName),
                                    // )
                                  )),
                              // ProfilePlatformIndicator(
                              //   platform: widget.item.channel,
                              //   profilePicture:
                              //       widget.item.contact?.profilePicture ?? '',
                              // ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                        '${widget.item.contact?.firstName ?? ''} ${(widget.item.contact?.lastName ?? '').capitalize}',
                                        style: satoshiBold16.copyWith(
                                          color: oneA1A1A,
                                        )),
                                    Text(
                                      'via ${widget.item.channel?.capitalize.toString() ?? 'Unknown'}',
                                      style: satoshiRegular12.copyWith(
                                          color: oneA1A1A.withOpacity(.68)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // _controller.isBlocked.value
                      //     ? TextButton(
                      //         onPressed: null,
                      //         child: SvgPicture.asset(
                      //           R.svg.asset.blocked_user.assetName,
                      //           package: 'bodsquare_sdk',
                      //         ))
                      //     : TextButton(
                      //         onPressed: () {
                      //           log(widget.item.uid.toString());
                      //           showModalBottomSheet(
                      //             context: context,
                      //             builder: (context) =>
                      //                 ReportConversationBottomSheet(
                      //               conversationId: widget.item.uid.toString(),
                      //               contact: widget.item.contact!,
                      //             ),
                      //             isDismissible: true,
                      //             backgroundColor: Colors.transparent,
                      //             isScrollControlled: true,
                      //           );
                      //           // Get.bottomSheet(
                      //           //     ReportConversationBottomSheet(
                      //           //       conversationId:
                      //           //           widget.item.contact!.uid.toString(),
                      //           //       contact: widget.item.contact!,
                      //           //     ),
                      //           //     isScrollControlled: true);
                      //         },
                      //         child: const Icon(
                      //           Icons.more_vert,
                      //           color: b2B2B2,
                      //         )),

                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GroupedListView<ConversationMessage, int?>(
                  order: GroupedListOrder.DESC,
                  controller: _conversationsController.scrollController,
                  // reverse: true,
                  // physics: NeverScrollableScrollPhysics,
                  stickyHeaderBackgroundColor: Colors.transparent,
                  // controller: scrollController,
                  elements: _controller.individualConversationMessages,
                  groupBy: (ConversationMessage _) {
                    if (_.createdAt != null) {
                      final now = DateTime.now();
                      final hello = _.createdAt!
                          .toLocal()
                          .difference(
                              DateTime(now.year, now.month, now.day).toLocal())
                          .inDays;
                      return hello;
                      // _.createdAt!
                      //     .toLocal()
                      //     .difference(DateTime.now().toLocal())
                      //     .inHours;
                    } else {
                      return null;
                    }

                    // return DateTime.now()
                    //   .difference(_.createdAt!.toLocal())
                    //   .inDays;
                  },
                  groupComparator: (value2, value1) {
                    if (value1 != null && value2 != null) {
                      return value1.compareTo(value2);
                    } else {
                      return 0;
                    }
                  },
                  itemComparator: (a, b) {
                    if (a.createdAt != null && b.createdAt != null) {
                      return b.createdAt!.compareTo(a.createdAt!);
                    } else {
                      return 0;
                    }
                  },
                  // itemComparator: (element1, element2) => element2
                  //     .createdAt!
                  //     .toLocal()
                  //     .compareTo(element1.createdAt!.toLocal()),
                  floatingHeader: false,
                  // itemPositionsListener: ,
                  groupHeaderBuilder: (ConversationMessage _) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: borderRadius12,
                            color: e5E7EB.withOpacity(.56)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        child: SizedBox(
                          // width: 10,
                          child: _.createdAt != null
                              ? Text(
                                  _.createdAt!.toLocal().isToday
                                      ? 'Today'
                                      // DateFormat.jm().format(_.date as DateTime)
                                      : _.createdAt!.toLocal().isYesterday
                                          ? 'Yesterday'
                                          : DateFormat.yMd().format(
                                              _.createdAt!.toLocal(),
                                            ),
                                  textAlign: TextAlign.center,
                                  style: satoshiMedium14.copyWith(
                                      color: oneA1A1A, fontSize: 12),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    );
                  },
                  indexedItemBuilder:
                      (context, ConversationMessage chat, item) {
                    return _ChatWidget(
                      conversation: widget.item,
                      chat: chat,
                      channelName: widget.item.channel ?? '',
                    );
                  },
                )),
                const SizedBox(
                  height: 16,
                ),
                _controller.isBlocked.value
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: f0F2F3, borderRadius: borderRadius16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                                  child: Text(
                                    'This user has been blocked by you.\n No conversation sent by you will be received.',
                                    style: satoshiRegular12.copyWith(
                                        color: oneA1A1A),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Divider(
                                  color: oneA1A1A.withOpacity(.1),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.bottomSheet(UnblockUserBottomSheet(
                                          conversationId: widget
                                              .item.contact!.uid
                                              .toString()));
                                    },
                                    child: Text(
                                      'Unblock user',
                                      style: satoshiRegular12.copyWith(
                                          color: oneA1A1A,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 144,
                          ),
                        ],
                      )
                    : _SendMessageWidget(
                        scrollController:
                            _conversationsController.scrollController,
                      ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ));
    });
  }
}

class _DeleteConversation extends StatelessWidget {
  _DeleteConversation(
      {Key? key,
      required this.conversationId,
      required this.messageId,
      required this.channelName})
      : super(key: key);

  final ConversationsController activeConversationController = Get.find();
  final String conversationId;
  final String messageId;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      alignment: Alignment.center,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Deleting this message will only delete a copy of the message on the Bodsquare app',
            style: satoshiMedium14.copyWith(color: oneA1A1A, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const Divider(
            color: f8F8F8,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text(
                      'Cancel',
                      style: satoshiMedium14.copyWith(color: oneA1A1A),
                    ),
                    onPressed: () {
                      Navigator.pop(context);

                      // Navigator.pop(context);
                      activeConversationController.update();
                    },
                  ),
                ),
                const VerticalDivider(
                  color: f8F8F8,
                ),
                Expanded(
                  child: TextButton(
                    child: Text('Delete',
                        style: satoshiMedium14.copyWith(color: f63115)),
                    onPressed: () {
                      activeConversationController.deleteMessage(
                        conversationId: conversationId,
                        messageId: messageId,
                        channelName: channelName,
                      );
                      //
                      activeConversationController.update();
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ConfirmCopyOrDeleteConversation extends StatelessWidget {
  _ConfirmCopyOrDeleteConversation(
      {Key? key,
      required this.conversationId,
      required this.chat,
      required this.channelName})
      : super(key: key);

  final ConversationsController activeConversationController = Get.find();
  final String conversationId;
  final ConversationMessage chat;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      alignment: Alignment.center,
      child: Builder(builder: (context) {
        return IntrinsicWidth(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () async {
                    Navigator.pop(context);

                    //log('copy pressed');
                    await activeConversationController.clipboardService
                        .copy(chat.message ?? '')
                        .then(
                      (value) {
                        //log('copied');
                        BuildContext? dialogContext;
                        showDialog(
                            context: context,
                            builder: (context) {
                              dialogContext = context;
                              return const AlertDialog(
                                content: Text('Copied'),
                              );
                            });
                        Future.delayed(const Duration(seconds: 1), () {
                          //log('dialog is current ${ModalRoute.of(dialogContext!)?.isCurrent}');
                          Navigator.pop(dialogContext!);
                        });
                      },
                    );
                  },
                  icon: const Icon(Icons.copy)),
              IconButton(
                  onPressed: () {
                    //log('delete PRessed');
                    Navigator.pop(context);

                    showDialog(
                      context: context,
                      builder: (context) => _DeleteConversation(
                        conversationId: conversationId,
                        messageId: chat.uid ?? '',
                        channelName: channelName,
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete, color: f63115)),
            ],
          ),
        );
      }),
    );
  }
}

class _ChatWidget extends StatelessWidget {
  const _ChatWidget(
      {Key? key,
      required this.conversation,
      required this.chat,
      required this.channelName})
      : super(key: key);

  final GetAllConversationsData conversation;
  // final ConversationsController controller;
  final ConversationMessage chat;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 12,
          left: chat.messageFrom?.toLowerCase() == 'company' ? 65 : 0,
          right: chat.messageFrom?.toLowerCase() == 'company' ? 0 : 65),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chat.messageFrom?.toLowerCase() != 'company'
              ? Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: zero066FF.withOpacity(.1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      height: 150,
                      width: 150,
                      imageUrl: conversation.contact?.profilePicture ?? '',
                      placeholder: (context, url) => const Center(
                        child: Icon(
                          Icons.person_rounded,
                          color: ffffff,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.person_rounded,
                          color: ffffff,
                        ),
                      ),
                    ),
                  ))
              : const SizedBox(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => _ConfirmCopyOrDeleteConversation(
                        conversationId: conversation.uid.toString(),
                        chat: chat,
                        channelName: channelName,
                      ),

                      // _DeleteConversation(
                      //   conversationId: conversation.uid.toString(),
                      //   messageId: chat.uid.toString())
                    );
                  },
                  child: Container(
                    // height: 300,

                    decoration: BoxDecoration(
                      color: chat.messageType?.toLowerCase() == 'image'
                          ? Colors.transparent
                          : chat.messageFrom?.toLowerCase() == 'company'
                              ? f6F6F8
                              : zero066FF.withOpacity(.08),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(8),
                        topRight: const Radius.circular(8),
                        bottomLeft: chat.messageFrom?.toLowerCase() == 'company'
                            ? const Radius.circular(8)
                            : const Radius.circular(0),
                        bottomRight:
                            chat.messageFrom?.toLowerCase() != 'company'
                                ? const Radius.circular(8)
                                : const Radius.circular(0),
                      ),
                    ),
                    child: _MessageType(
                      chat: chat,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  child: chat.messageFrom?.toLowerCase() != 'company'
                      ? SizedBox(
                          width: Get.width,
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,

                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  chat.createdAt != null
                                      ? DateFormat.jm()
                                          .format(chat.createdAt!.toLocal())
                                      : '',
                                  style: satoshiRegular12.copyWith(
                                      color: oneA1A1A.withOpacity(.68),
                                      fontSize: 10),
                                  textAlign: chat.messageFrom?.toLowerCase() ==
                                          'company'
                                      ? TextAlign.end
                                      : TextAlign.start,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset(
                                  R.svg.asset.chat_details_eclipse.assetName,
                                  package: 'bodsquare_sdk',
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  chat.platform.toString(),
                                  style: satoshiRegular12.copyWith(
                                      color: oneA1A1A.withOpacity(.68),
                                      fontSize: 10),
                                  textAlign: TextAlign.end,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset(
                                  R.svg.asset.chat_details_eclipse.assetName,
                                  package: 'bodsquare_sdk',
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  conversation.channel?.toLowerCase() ==
                                          'facebook'
                                      ? conversation
                                              .facebookConnection?.pageName ??
                                          ''
                                      : conversation.channel?.toLowerCase() ==
                                              'instagram'
                                          ? conversation.instagramConnection
                                                  ?.pageName ??
                                              ''
                                          : conversation.channel
                                                      ?.toLowerCase() ==
                                                  'twitter'
                                              ? 'Twitter Id : ${conversation.twitterConnection?.id.toString() ?? ''}'
                                              : '${conversation.contact?.firstName?.capitalize.toString() ?? ''} ${conversation.contact?.lastName?.capitalize.toString() ?? ''}',
                                  style: satoshiRegular12.copyWith(
                                      color: oneA1A1A.withOpacity(.68),
                                      fontSize: 10),
                                  textAlign: TextAlign.end,
                                ),
                              ]),
                        )
                      : SizedBox(
                          width: Get.width,
                          child: Wrap(
                            runAlignment: WrapAlignment.end,
                            alignment: WrapAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat.jm()
                                    .format(chat.createdAt!.toLocal()),
                                style: satoshiRegular12.copyWith(
                                    color: oneA1A1A.withOpacity(.68),
                                    fontSize: 10),
                                textAlign:
                                    chat.messageFrom?.toLowerCase() == 'company'
                                        ? TextAlign.end
                                        : TextAlign.start,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(
                                R.svg.asset.chat_details_eclipse.assetName,
                                package: 'bodsquare_sdk',
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                chat.platform.toString(),
                                style: satoshiRegular12.copyWith(
                                    color: oneA1A1A.withOpacity(.68),
                                    fontSize: 10),
                                textAlign: TextAlign.end,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(
                                R.svg.asset.chat_details_eclipse.assetName,
                                package: 'bodsquare_sdk',
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              chat.status == 'offline'
                                  ? SvgPicture.asset(
                                      R.svg.asset.chat_timer_icon.assetName,
                                      package: 'bodsquare_sdk',
                                    )
                                  : chat.status!
                                          .toLowerCase()
                                          .contains('queued')
                                      ? SvgPicture.asset(
                                          R.svg.asset.single_ticker.assetName,
                                          package: 'bodsquare_sdk',
                                          color: Colors.grey,
                                        )
                                      : chat.status?.toLowerCase() ==
                                              'delivered'
                                          ? SvgPicture.asset(
                                              R.svg.asset.double_ticker
                                                  .assetName,
                                              color: Colors.grey,
                                              package: 'bodsquare_sdk',
                                            )
                                          : chat.status?.toLowerCase() ==
                                                  'received'
                                              ? SvgPicture.asset(
                                                  R.svg.asset.double_ticker
                                                      .assetName,
                                                  color: Colors.grey,
                                                  package: 'bodsquare_sdk',
                                                )
                                              : chat.status?.toLowerCase() ==
                                                      'failed'
                                                  ? Text(
                                                      'Failed',
                                                      style: satoshiRegular12
                                                          .copyWith(
                                                              color: f63115
                                                                  .withOpacity(
                                                                      .8),
                                                              fontSize: 10),
                                                      textAlign: TextAlign.end,
                                                    )
                                                  : SvgPicture.asset(
                                                      R.svg.asset.single_ticker
                                                          .assetName,
                                                      color: Colors.grey,
                                                      package: 'bodsquare_sdk',
                                                    ),
                            ],
                          ),
                        ),
                )
              ],
            ),
          ),
          chat.messageFrom?.toLowerCase() == 'company'
              ? Container(
                  margin: const EdgeInsets.only(left: 8),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: zero066FF.withOpacity(.1),
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    R.svg.asset.bodsquare.assetName,
                    package: 'bodsquare_sdk',
                  )))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _SendMessageWidget extends StatelessWidget {
  const _SendMessageWidget({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;
  // final ConversationsController _controller;

  sendTextMessage(ConversationsController controller) async {
    await controller.sendMessage(
      id: controller.individualConversation.value.data?.conversation?.uid
              .toString() ??
          '',
      message: controller.textMessageController.text,
      messageType: 'text',
      channelName: controller
              .individualConversation.value.data?.conversation?.channel
              ?.toLowerCase() ??
          '',
    );

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationsController>(
        init: ConversationsController(
            loadingService: LoadingService(context: context)),
        builder: (_) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
                // color: f6F6F8,
                // borderRadius: borderRadius22,
                border: Border(
              top: BorderSide(color: eFF2F7, width: 2),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isDismissible: true,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => AttachmentsBottomSheet(
                                conversationId: _.individualConversation.value
                                        .data?.conversation?.uid
                                        .toString() ??
                                    '',
                                channelName: _.individualConversation.value.data
                                        ?.conversation?.channel
                                        ?.toLowerCase() ??
                                    ''));
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      child: SvgPicture.asset(
                        R.svg.asset.attachment.assetName,
                        package: 'bodsquare_sdk',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 40,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: f6F6F8,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _.textMessageController,
                            minLines: 1,
                            maxLines: 4,
                            onChanged: (_d) {
                              //log(_d);
                              //log(_.textMessageControllerHasText.toString());
                              //log(_.textMessageController.text.toString());
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Send a message'),
                          ),
                        ),
                      ),
                    ),
                    // _controller.isLoading.value
                    //     ? SizedBox(
                    //         width: 20,
                    //         height: 20,
                    //         child: CircularProgressIndicator(
                    //           valueColor: AlwaysStoppedAnimation<Color>(oneA1A1A),
                    //         ),
                    //       )
                    // :

                    TextButton(
                        onPressed: () {
                          _.textMessageControllerHasText
                              ? sendTextMessage(_)
                              :
                              // change [Get.bottomSheet] to [showModalBottomsheet] to navigate to audio recorder page
                              // Get.bottomSheet(AudioRecorder(
                              //     onStop: (_) => log('audio stopped'),
                              //     conversationId: _.individualConversation.value
                              //             .data?.conversation?.uid ??
                              //         '',
                              //     channelName: _.individualConversation.value
                              //             .data?.conversation?.channel
                              //             ?.toLowerCase() ??
                              //         ''));
                              showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  shape: bottomsheetRadius,
                                  builder: (context) => AudioRecorder(
                                      onStop: (_) =>
                                          debugPrint('audio stopped'),
                                      conversationId: _.individualConversation
                                              .value.data?.conversation?.uid ??
                                          '',
                                      channelName: _.individualConversation
                                              .value.data?.conversation?.channel
                                              ?.toLowerCase() ??
                                          ''),
                                );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(8),
                          // tapTargetSize: MaterialTapTargetSize.shrinkWrap
                        ),
                        child: _.textMessageControllerHasText
                            ? SvgPicture.asset(
                                R.svg.asset.send_message_icon.assetName,
                                package: 'bodsquare_sdk',
                              )
                            : SvgPicture.asset(
                                R.svg.asset.microphone.assetName,
                                package: 'bodsquare_sdk',
                              )),

                    // : TextButton(
                    //     onPressed: () async {
                    //       await _controller.sendMessage(
                    //         id: _controller.individualConversation.value.data?.id
                    //                 .toString() ??
                    //             '',
                    //         message: _controller.textMessageController.text,
                    //         messageType: 'text',
                    //       );
                    //       scrollController.animateTo(
                    //           scrollController.position.maxScrollExtent,
                    //           duration: Duration(milliseconds: 300),
                    //           curve: Curves.easeOut);
                    //     },
                    //     child: Text('Send'),
                    //   )
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class _MessageType extends StatefulWidget {
  const _MessageType({Key? key, required this.chat}) : super(key: key);

  final ConversationMessage chat;

  @override
  State<_MessageType> createState() => _MessageTypeState();
}

class _MessageTypeState extends State<_MessageType> {
  late VideoPlayerController _controller;
  final ConversationsController _conversationsController =
      Get.find<ConversationsController>();
  List<LinkifyEntry>? entries = [];

  @override
  void initState() {
    super.initState();
    if (widget.chat.messageType == 'video') {
      _controller = VideoPlayerController.network(widget.chat.message ?? '')
        ..initialize().then((value) {
          setState(() {});
        });
    } else {
      _controller = VideoPlayerController.network(widget.chat.message ?? '');
    }
    linkifyText();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> linkifyText() async {
    if (widget.chat.messageType == "text" && !kIsWeb) {
      entries = await NativeLinkify.linkify(widget.chat.message.toString());
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.chat.messageType?.toLowerCase() == 'text' && !kIsWeb) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final k in entries!)
              if (k is LinkifyUrl)
                AnyLinkPreview(
                  link: k.url,
                  displayDirection: UIDirection.uiDirectionHorizontal,
                  showMultimedia: true,
                  bodyMaxLines: 4,
                  bodyTextOverflow: TextOverflow.ellipsis,
                  titleStyle: satoshiRegular14.copyWith(
                      color: oneA1A1A, fontWeight: FontWeight.bold),
                  bodyStyle:
                      satoshiRegular12.copyWith(color: oneA1A1A, fontSize: 12),

                  errorWidget: const SizedBox(),

                  cache: const Duration(days: 7),
                  // backgroundColor: Colors.grey[300],
                  borderRadius: 8,
                  removeElevation: true,
                  // boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
                  onTap: () {
                    launchUrl(Uri.parse(k.url));
                  },
                )
              else
                Container(),
            Text.rich(
              TextSpan(
                children: [
                  for (final l in entries!)
                    if (l is LinkifyText)
                      // Regular text, text without links
                      TextSpan(
                          text: l.text,
                          style: satoshiRegular14.copyWith(color: oneA1A1A))
                    else if (l is LinkifyUrl)
                      // Link
                      TextSpan(
                          text: l.text,
                          style: satoshiRegular14.copyWith(
                              color: zero066FF,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (await canLaunchUrl(Uri.parse(l.url))) {
                                await launchUrl(Uri.parse(l.url),
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw 'Could not launch ${l.url}';
                              }
                            }
                          // => launchUrl(Uri.parse(l.url)),
                          )
                ],
              ),
            ),
          ],
        ),
        //  Linkify(
        //   onOpen: (link) async {
        //     if (await canLaunchUrl(Uri.parse(link.url))) {
        //       await launchUrl(Uri.parse(link.url));
        //     } else {
        //       throw 'Could not launch $link';
        //     }
        //   },
        //   text: widget.chat.message.toString(),
        //   style: satoshiRegular14.copyWith(color: oneA1A1A),
        // )
      );
    }
    if (widget.chat.messageType?.toLowerCase() == 'text' && kIsWeb) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          widget.chat.message.toString(),
          style: satoshiRegular14.copyWith(color: oneA1A1A),
        ),
      );
    }

    if (widget.chat.isStory == true) {
      return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Replied to your story:',
                  style: satoshiRegular14.copyWith(
                    color: oneA1A1A.withOpacity(.8),
                  )),
              Linkify(
                onOpen: (link) async {
                  if (await canLaunchUrl(Uri.parse(link.url))) {
                    await launchUrl(Uri.parse(link.url));
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: widget.chat.message.toString(),
                style: satoshiRegular14.copyWith(color: oneA1A1A),
              ),
              const SizedBox(height: 8),
              const Divider(),
              TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      // padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {
                    // Get.to(() =>
                    //     InstaStoryWebView(url: widget.chat.storyUrl ?? ''));
                    // kIsWeb
                    // ?
                    /// this will launch the instastory in the browser.
                    launchUrl(Uri.parse(widget.chat.storyUrl ?? ''));

                    ///this was removed as a result of the removal of webview_flutter package.
                    // : Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => InstaStoryWebView(
                    //             url: widget.chat.storyUrl ?? '')));
                  },
                  child: Text('View Story',
                      style: satoshiRegular14.copyWith(color: zero066FF))),
            ],
          ));
    } else {
      return widget.chat.messageType?.toLowerCase() == 'audio'
          ? FittedBox(
              fit: BoxFit.fitWidth,
              child: AudioPlayer(source: widget.chat.message ?? ''))
          : widget.chat.messageType?.toLowerCase() == 'video' &&
                  widget.chat.status == 'offline'
              ? GestureDetector(
                  // onTap: () => Get.to(() => ViewVideoPagePage(
                  //       videoUrl: widget.chat.message ?? '',
                  //       source: widget.chat.message ?? '',
                  //     )),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewVideoPagePage(
                                videoUrl: widget.chat.message ?? '',
                                source: widget.chat.message ?? '',
                              ))),
                  child: _controller.value.isInitialized
                      ? Stack(
                          children: [
                            SizedBox(
                              width: Get.width,
                              height: 150,
                              child: VideoPlayer(_controller),
                            ),
                            const Positioned(
                              top: 0,
                              right: 0,
                              bottom: 0,
                              left: 0,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.play_circle_outline,
                                  color: zero066FF,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                )
              : widget.chat.messageType?.toLowerCase() == 'video'
                  ? GestureDetector(
                      // onTap: () => Get.to(() => ViewVideoPagePage(
                      //       videoUrl: widget.chat.message ?? '',
                      //     )),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewVideoPagePage(
                                    videoUrl: widget.chat.message ?? '',
                                  ))),
                      child: _controller.value.isInitialized
                          ? Stack(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  height: 150,
                                  child: VideoPlayer(_controller),
                                ),
                                const Positioned(
                                  top: 0,
                                  right: 0,
                                  bottom: 0,
                                  left: 0,
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.play_circle_outline,
                                      color: zero066FF,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                    )
                  : widget.chat.messageType?.toLowerCase() == 'document' &&
                          widget.chat.status == 'offline'
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Document:',
                                  style: satoshiRegular14.copyWith(
                                    color: oneA1A1A.withOpacity(.8),
                                  )),
                              const Icon(
                                Icons.file_present_outlined,
                                color: zero066FF,
                              ),
                            ],
                          ))
                      : widget.chat.messageType?.toLowerCase() == 'document'
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Document:',
                                      style: satoshiRegular14.copyWith(
                                        color: oneA1A1A.withOpacity(.8),
                                      )),
                                  const Icon(
                                    Icons.file_present_outlined,
                                    color: zero066FF,
                                  ),
                                  const Divider(),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          // padding: EdgeInsets.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      onPressed: () {
                                        // log('documents');
                                      },
                                      child: Text('Download Document',
                                          style: satoshiRegular14.copyWith(
                                              color: zero066FF))),
                                ],
                              ))
                          : widget.chat.messageType?.toLowerCase() == 'image' &&
                                  widget.chat.status == 'offline' &&
                                  !kIsWeb
                              ? SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Stack(
                                    children: [
                                      Image.file(
                                        File(widget.chat.message ?? ''),
                                      ),
                                      _conversationsController.isLoading.value
                                          ? Positioned(
                                              top: 0,
                                              right: 0,
                                              bottom: 0,
                                              left: 0,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      const AlwaysStoppedAnimation<
                                                          Color>(six66666),
                                                  color:
                                                      six66666.withOpacity(.5),
                                                ),
                                              ),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                )
                              : widget.chat.messageType?.toLowerCase() ==
                                          'image' &&
                                      widget.chat.status == 'offline' &&
                                      kIsWeb
                                  ? SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            File(widget.chat.message ?? '')
                                                .path,
                                          ),
                                          _conversationsController
                                                  .isLoading.value
                                              ? Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  left: 0,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          const AlwaysStoppedAnimation<
                                                              Color>(six66666),
                                                      color: six66666
                                                          .withOpacity(.5),
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    )
                                  : GestureDetector(
                                      // onTap: () => Get.to(() => ViewAttachmentPage(
                                      //     message: widget.chat,
                                      //     messageType: MessageType.image,
                                      //     conversationId:
                                      //         widget.chat.id.toString())),
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewAttachmentPage(
                                                    message: widget.chat,
                                                    messageType:
                                                        MessageType.image,
                                                    conversationId: widget
                                                        .chat.id
                                                        .toString(),
                                                  ))),
                                      child: CachedNetworkImage(
                                        height: 150,
                                        width: 150,
                                        imageUrl: widget.chat.message ?? '',
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: Icon(
                                            Icons.image,
                                            color: ffffff,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Center(
                                          child: Icon(
                                            Icons.broken_image_rounded,
                                            color: ffffff,
                                          ),
                                        ),
                                      ),
                                    );
    }
  }
}
