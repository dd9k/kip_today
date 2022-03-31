// import 'package:checkinpromobile/src/constants/AppColors.dart';
// import 'package:checkinpromobile/src/constants/AppImage.dart';
// import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
// import 'package:checkinpromobile/src/constants/Constants.dart';
// import 'package:checkinpromobile/src/screens/MainScreen.dart';
// import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
// import 'package:checkinpromobile/src/widgetUtilities/CustomSwitch.dart';
// import 'package:flutter/material.dart';
//
// import 'ConfigNotifier.dart';
//
// class ConfigScreen extends MainScreen {
//   static const String route_name = '/configScreen';
//
//   @override
//   ConfigScreenState createState() => ConfigScreenState();
//
//   @override
//   String getNameScreen() {
//     return route_name;
//   }
// }
//
// class ConfigScreenState extends MainScreenState<ConfigNotifier> {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     var percentBox = isPortrait ? 80 : 80;
//     return Container(
//       color: AppColors.BACKGROUND_MAIN,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: CustomAppBar(
//             context: context,
//             index: -1,
//             provider: provider,
//           ),
//           body: Container(
//             color: AppColors.BACKGROUND_MAIN,
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 SizedBox(
//                   height: 35,
//                 ),
//                 buildLogo(),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Container(
//                   width: widthScreen * percentBox,
//                   alignment: Alignment.topCenter,
//                   child: FutureBuilder<List<ItemSwitch>>(
//                       future: provider.getSaveItems(context),
//                       builder: (widget, snapshot) {
//                         if (snapshot.hasData && snapshot.data != null) {
//                           return MediaQuery.removePadding(
//                             context: context,
//                             child:
//                                 item(snapshot.data, widthScreen * percentBox),
//                             removeBottom: true,
//                             removeTop: true,
//                           );
//                         }
//                         return CircularProgressIndicator();
//                       }),
//                 ),
//                 SizedBox(
//                   height: 100,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget item(List<ItemSwitch> items, double widthBox) {
//     return ListView.builder(
//       padding: EdgeInsets.all(0.0),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: items.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Column(
//           children: <Widget>[
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 ShaderMask(
//                     blendMode: BlendMode.srcIn,
//                     shaderCallback: (Rect bounds) {
//                       return AppColors.colorIcon;
//                     },
//                     child: Icon(
//                       items[index].icon,
//                     )),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                     child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Text(
//                         items[index].title ?? "",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.w600),
//                       ),
//                       SizedBox(
//                         height: 3,
//                       ),
//                       SizedBox(
//                         width: widthBox,
//                         child: Text(items[index].subtitle ?? "",
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w200,
//                                 color: Colors.grey)),
//                       )
//                     ],
//                   ),
//                 )),
//                 CustomSwitch(
//                   activeColor: Colors.blueAccent,
//                   value: items[index].isSelect,
//                   onChanged: (value) {
//                     provider.switchItem(context, mounted, value, items[index]);
//                   },
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   buildLogo() {
//     return Column(
//       children: [
//         AppImage.logoCompany,
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           "${appLocalizations.versionTitle} 1.1.0",
//           style: TextStyle(
//               fontSize: 15.0,
//               fontFamily: AppTextStyles.helveticaFont,
//               color: Colors.black,
//               decoration: TextDecoration.none),
//         ),
//       ],
//     );
//   }
// }
