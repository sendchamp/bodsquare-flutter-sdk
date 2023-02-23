import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/views/active_conversation_chat.dart';
import 'package:bodsquare_sdk/conversations/widgets/close_or_delete_chat_bottomsheet.dart';
import 'package:bodsquare_sdk/conversations/widgets/delete_conversation_warning.dart';
import 'package:bodsquare_sdk/helpers/date_time_extension.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:bodsquare_sdk/helpers/storage_service.dart';
import 'package:bodsquare_sdk/helpers/swipe_to_dismiss_widget.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActiveConversations extends StatefulWidget {
  const ActiveConversations({
    Key? key,
  }) : super(key: key);

  @override
  State<ActiveConversations> createState() => _ActiveConversationsState();
}

class _ActiveConversationsState extends State<ActiveConversations> {
  ConversationsController controller = Get.find();

  // BodSquareAppData bodSquareAppData = Get.put(BodSquareAppData());

  // final SnackBarService _snackBarService = Get.put(SnackBarService());
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  Future<void> gotoPage() async {
    final String? payload = await StorageService().getString('payload');

    if (payload != null) {
      // Get.to(HomeView());
      // gotoRequiredScreen(payload);
      StorageService().remove('payload');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ConversationsController>(
        init: ConversationsController(
            loadingService: LoadingService(context: context)),
        builder: (_) {
          return _.activeConversationsListLength.value == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      R.svg.asset.no_message_yet.assetName,
                      height: 96,
                      width: 96,
                      package: 'bodsquare_sdk',
                    ),
                    Center(
                      child: Text(
                        'You currently don’t have \nany messages yet',
                        style: satoshiMedium16.copyWith(color: a2A2A2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : SmartRefresher(
                  controller: _refreshController,
                  onRefresh: () async {
                    await controller.getAllConversations();
                    _refreshController.refreshCompleted();
                  },
                  child: ListView.builder(
                      itemCount: controller.activeConversationsListLength.value,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              // height: 80,
                              child: Dismissible(
                                background:
                                    const SwipeToDismissBackgroundWidget(),
                                direction: DismissDirection.endToStart,
                                key: Key(controller
                                    .activeConversationsList[index].id
                                    .toString()),
                                confirmDismiss: (direction) async {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          CloseOrDeleteChatBottomsheet(
                                            uid: controller
                                                .activeConversationsList[index]
                                                .uid,
                                            type: ConversationType.open,
                                          ));
                                  // Get.bottomSheet(CloseOrDeleteChatBottomsheet(
                                  //   uid: controller
                                  //       .activeConversationsList[index].uid,
                                  //   type: ConversationType.open,
                                  // ));
                                  return null;
                                },
                                child: ListTile(
                                    onTap: () {
                                      controller.getSingleConversation(
                                          controller
                                              .activeConversationsList[index]
                                              .uid
                                              .toString());
                                      showModalBottomSheet(
                                          context: context,
                                          isDismissible: true,
                                          isScrollControlled: true,
                                          shape: bottomsheetRadius,
                                          builder: (context) =>
                                              ActiveConversationChat(
                                                item: controller
                                                        .activeConversationsList[
                                                    index],
                                              ));
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ActiveConversationChat(
                                      //               item: controller
                                      //                       .activeConversationsList[
                                      //                   index],
                                      //             )));
                                      // Get.to(() => ActiveConversationChat(
                                      //       item: controller
                                      //           .activeConversationsList[index],
                                      //     ));
                                    },
                                    leading: ProfilePlatformIndicator(
                                      platform: controller
                                              .activeConversationsList[index]
                                              .channel ??
                                          '',
                                      profilePicture: controller
                                              .activeConversationsList[index]
                                              .contact
                                              ?.profilePicture ??
                                          '',
                                    ),
                                    // activeConversationController:
                                    //     activeConversationController,
                                    // index: index),
                                    title: Text(
                                      '${controller.activeConversationsList[index].contact?.firstName ?? ''} ${controller.activeConversationsList[index].contact?.lastName ?? ''}',
                                      style: satoshiBold16.copyWith(
                                          color: oneA1A1A),
                                    ),
                                    isThreeLine: true,
                                    subtitle: controller
                                                .activeConversationsList[index]
                                                .messageType
                                                ?.toLowerCase() ==
                                            'text'
                                        ? Text(
                                            controller
                                                    .activeConversationsList[
                                                        index]
                                                    .lastMessage ??
                                                '',
                                            style: satoshiRegular12,
                                            // maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : const Text(
                                            'Attachment',
                                            style: satoshiRegular12,
                                            // maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                    trailing: _LastChatInfo(
                                        activeConversationController:
                                            controller,
                                        index: index)),
                              ),
                            ),
                            const Divider(
                              color: c6C6C8,
                              // thickness: 0.35,
                            )
                          ],
                        );
                      }),
                );
        });
  }
}

// ignore: must_be_immutable
class ProfilePlatformIndicator extends StatelessWidget {
  ProfilePlatformIndicator({
    Key? key,
    this.platform,
    this.profilePicture,
  }) : super(key: key);

  String? platform;
  final String? profilePicture;
  // final int index;
  // final BodSquareAppData bodSquareAppData = Get.put(BodSquareAppData());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: c4C4C4,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(50.r),
              child: CachedNetworkImage(
                imageUrl: profilePicture ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 16,
              height: 16,
              child: platform?.toLowerCase() == 'whatsapp'
                  ? SvgPicture.asset(
                      R.svg.asset.whatsapp_user.assetName,
                      package: 'bodsquare_sdk',
                    )
                  : platform?.toLowerCase() == 'instagram'
                      ? SvgPicture.asset(
                          R.svg.asset.instagram$1.assetName,
                          package: 'bodsquare_sdk',
                        )
                      : platform?.toLowerCase() == 'twitter'
                          ? SvgPicture.asset(
                              R.svg.asset.twitter$1.assetName,
                              package: 'bodsquare_sdk',
                            )
                          : platform?.toLowerCase() == 'facebook'
                              ? SvgPicture.asset(
                                  R.svg.asset.facebook$1.assetName,
                                  package: 'bodsquare_sdk',
                                )
                              : const SizedBox(),

              //  SvgPicture.asset(
              //   (R.svg.asset.facebook$1.assetName),
              // )
            ),
          )
        ],
      ),
    );
  }
}

class _LastChatInfo extends StatelessWidget {
  const _LastChatInfo({
    Key? key,
    required this.activeConversationController,
    required this.index,
  }) : super(key: key);

  final ConversationsController activeConversationController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          (activeConversationController.activeConversationsList[index].updatedAt
                      ?.toLocal() as DateTime)
                  .isToday
              ? DateFormat.jm().format(activeConversationController
                  .activeConversationsList[index].updatedAt
                  ?.toLocal() as DateTime)
              : (activeConversationController
                          .activeConversationsList[index].updatedAt
                          ?.toLocal() as DateTime)
                      .isYesterday
                  ? "Yesterday"
                  : DateFormat.yMd().format(activeConversationController
                      .activeConversationsList[index].updatedAt
                      ?.toLocal() as DateTime),
        ),
        SizedBox(
          height: 25,
          width: 25,
          child: activeConversationController
                      .activeConversationsList[index].noOfUnseenMessages !=
                  '0'
              ? Container(
                  decoration: BoxDecoration(
                      color: zero066FF,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        activeConversationController
                                .activeConversationsList[index]
                                .noOfUnseenMessages ??
                            '',
                        style: satoshiRegular12.copyWith(color: ffffff),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
