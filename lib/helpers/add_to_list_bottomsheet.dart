// import 'dart:developer';

// import 'package:bodsquare/app/extensions/color_extension.dart';
// import 'package:bodsquare/app/modules/contacts/models/contact_response/contact_response_data.dart';
// import 'package:bodsquare/app/modules/manage_lists/controllers/manage_lists_controller.dart';

// import 'package:bodsquare/app/services/bodsquare_app_data.dart';
// import 'package:bodsquare/app/services/loading_service.dart';
// import 'package:bodsquare/app/themes/themes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddToListBottomsheet extends StatefulWidget {
//   AddToListBottomsheet({
//     Key? key,
//     required this.item,
//   }) : super(key: key);

//   final ContactResponseData item;

//   @override
//   State<AddToListBottomsheet> createState() => _AddToListBottomsheetState();
// }

// class _AddToListBottomsheetState extends State<AddToListBottomsheet> {
//   final ManageListsController controller = Get.put(ManageListsController());

//   final LoadingService _loadingService = Get.find();

//   final BodSquareAppData _bodSquareAppData = Get.find();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.selectedListContacts.clear();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     log(widget.item.toJson().toString());
//     log(_bodSquareAppData.allAvailableLists.length.toString());

//     return GetBuilder<ManageListsController>(builder: (_) {
//       return Container(
//         padding: paddingH20,
//         height: Get.height * .80,
//         decoration: BoxDecoration(
//             color: ffffff,
//             borderRadius: borderRadiusTopLR24.copyWith(
//                 topLeft: Radius.circular(16), topRight: Radius.circular(16))),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(
//               height: 20.h,
//             ),
//             Center(
//               child: Text(
//                 'Lists',
//                 style: satoshiBold16.copyWith(color: oneA1A1A),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Divider(
//               color: c6C6C8,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _bodSquareAppData.allAvailableLists.length,
//                 itemBuilder: ((context, index) {
//                   log(_bodSquareAppData.allAvailableLists.length.toString());
//                   return InkWell(
//                     onTap: () {
//                       if (_.selectedListContacts.contains(
//                           _bodSquareAppData.allAvailableLists[index].uid)) {
//                         _.selectedListContacts.remove(
//                             _bodSquareAppData.allAvailableLists[index].uid);
//                       } else {
//                         _.selectedListContacts.add(_bodSquareAppData
//                             .allAvailableLists[index].uid
//                             .toString());
//                       }
//                       _.update();
//                     },
//                     child: Container(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 height: 24.h,
//                                 width: 24.h,
//                                 decoration: BoxDecoration(
//                                   color: _bodSquareAppData
//                                       .allAvailableLists[index].color
//                                       .toString()
//                                       .toColor(),
//                                   borderRadius: BorderRadius.circular(50.r),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 8.w,
//                               ),
//                               Text(
//                                   '${_bodSquareAppData.allAvailableLists[index].name?.toUpperCase()}',
//                                   style: satoshiMedium16.copyWith(
//                                     color: oneA1A1A,
//                                   )),
//                               Spacer(),
//                               Theme(
//                                 data: Theme.of(context).copyWith(
//                                   unselectedWidgetColor:
//                                       zero066FF.withOpacity(.24),
//                                 ),
//                                 child: Checkbox(
//                                     activeColor: zero066FF,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(50.r)),
//                                     value: _.selectedListContacts.contains(
//                                         _bodSquareAppData
//                                             .allAvailableLists[index].uid),
//                                     onChanged: (value) {
//                                       if (value == true) {
//                                         _.selectedListContacts.add(
//                                             _bodSquareAppData
//                                                 .allAvailableLists[index].uid
//                                                 .toString());
//                                       } else {
//                                         _.selectedListContacts.remove(
//                                             _bodSquareAppData
//                                                 .allAvailableLists[index].uid);
//                                       }
//                                       _.update();
//                                     }),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 12.h,
//                           ),
//                           Divider(
//                             color: f8F8F8,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             SizedBox(
//               height: 16.h,
//             ),
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Close',
//                   style: satoshiMedium14.copyWith(color: oneA1A1A),
//                 )),
//             SizedBox(
//               height: 20.h,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   _.mapContactToList(widget.item);
//                 },
//                 style: primaryButtonStyle,
//                 child: Text('Done')),
//             SizedBox(
//               height: 34.h,
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
