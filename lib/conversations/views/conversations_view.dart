import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/conversations/views/active_conversations.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/helpers/loading_service.dart';
import 'package:bodsquare_sdk/helpers/websocket_service.dart';
import 'package:bodsquare_sdk/linking/views/select_another_channel_bottomsheet.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConversationsView extends StatefulWidget {
  const ConversationsView({Key? key}) : super(key: key);

  @override
  State<ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends State<ConversationsView>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<ConversationsView> {
  int tabIndex = 0;

  late TabController _tabController;
  WebSocketService webSocketService = Get.put(WebSocketService());

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    webSocketService.channelconnect();
    Future.delayed(Duration.zero, () {
      ConversationsController controller = Get.put(ConversationsController(
          loadingService: LoadingService(context: context)));
    });

    _tabController.addListener(() {
      tabIndex = _tabController.index;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    webSocketService.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationsController>(
      init: ConversationsController(
          loadingService: Get.put(LoadingService(context: context)))
        ..getAllConversations()
        ..update(),
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * .90,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            shape: bottomsheetRadius,
                            builder: (context) =>
                                const SelectAnotherChannelBottomsheet());
                      },
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: one71D26,
                      )),
                  const Text(
                    'Conversations',
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
                height: 8,
              ),
              Divider(
                color: zero066FF.withOpacity(.16),
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: e5E7EB,
              //     borderRadius: borderRadius8,
              //   ),
              //   margin: const EdgeInsets.only(bottom: 10),
              //   padding: const EdgeInsets.all(4),
              //   child: TabBar(
              //     controller: _tabController,
              //     onTap: (index) {
              //       _tabController.animateTo(index);
              //     },
              //     labelStyle: satoshiMedium14.copyWith(color: oneA1A1A),
              //     indicatorSize: TabBarIndicatorSize.tab,
              //     indicator:
              //         BoxDecoration(borderRadius: borderRadius8, color: ffffff),
              //     labelPadding: const EdgeInsets.all(4),
              //     unselectedLabelColor: e5E7EB,
              //     labelColor: e5E7EB,
              //     tabs: [
              //       Center(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'Open',
              //               style: satoshiRegular12.copyWith(
              //                   color: oneA1A1A,
              //                   fontWeight: tabIndex == 0
              //                       ? FontWeight.w500
              //                       : FontWeight.w400),
              //             ),
              //             const SizedBox(width: 8),
              //             Container(
              //               decoration: BoxDecoration(
              //                 // shape: BoxShape.circle,
              //                 color: zero066FF,
              //                 borderRadius: borderRadius8,
              //               ),
              //               // padding: const EdgeInsets.all(6),
              //               padding: const EdgeInsets.only(
              //                 left: 4,
              //                 top: 2,
              //                 right: 4,
              //                 bottom: 2,
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   '${_.activeConversationsListLength}',
              //                   style: satoshiMedium14.copyWith(
              //                       fontSize: 10, color: ffffff),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //         decoration: tabIndex == 0
              //             ? const BoxDecoration(
              //                 // borderRadius: borderRadius8,
              //                 border: Border(
              //                   right: BorderSide(color: d2D2D4),
              //                   // left: BorderSide(color: d2D2D4),
              //                 ),
              //               )
              //             : tabIndex == 2
              //                 ? const BoxDecoration(
              //                     // borderRadius: borderRadius8,
              //                     border: Border(
              //                       // right: BorderSide(color: d2D2D4),
              //                       left: BorderSide(color: d2D2D4),
              //                     ),
              //                   )
              //                 : null,
              //         child: Center(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 'Pending',
              //                 style: satoshiRegular12.copyWith(
              //                     color: oneA1A1A,
              //                     fontWeight: tabIndex == 1
              //                         ? FontWeight.w500
              //                         : FontWeight.w400),
              //               ),
              //               const SizedBox(width: 8),
              //               Container(
              //                 decoration: BoxDecoration(
              //                   // shape: BoxShape.circle,
              //                   color: zero066FF,
              //                   borderRadius: borderRadius8,
              //                 ),
              //                 // padding: const EdgeInsets.all(6),
              //                 padding: const EdgeInsets.only(
              //                   left: 4,
              //                   top: 2,
              //                   right: 4,
              //                   bottom: 2,
              //                 ),
              //                 child: Center(
              //                   child: Text(
              //                     '${_.pendingConversationsListLength}',
              //                     style: satoshiMedium14.copyWith(
              //                         fontSize: 10, color: ffffff),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Center(
              //         child: Text(
              //           'Closed',
              //           style: satoshiRegular12.copyWith(
              //               color: oneA1A1A,
              //               fontWeight: tabIndex == 2
              //                   ? FontWeight.w500
              //                   : FontWeight.w400),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Expanded(
                // child: TabBarView(
                //   controller: _tabController,
                //   children: [
                child: ActiveConversations(),
                //     PendingConversations(),
                //     ClosedConversations(),
                //   ],
                // ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
