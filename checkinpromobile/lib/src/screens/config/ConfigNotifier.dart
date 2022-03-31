// import 'package:checkinpromobile/src/constants/Constants.dart';
// import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
// import 'package:checkinpromobile/src/screens/recordFace/RecordFaceScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// enum SwitchType { NOTIFICATION, BIO_DETECT, FACE_DETET }
//
// class ConfigNotifier extends AppBarNotifier {
//   final LocalAuthentication _localAuthentication = LocalAuthentication();
//   bool reloadSwitch = false;
//
//   Future<bool> _isBiometricAvailable(bool mounted) async {
//     bool isAvailable = false;
//     try {
//       isAvailable = await _localAuthentication.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       print(e);
//     }
//
//     if (!mounted) return isAvailable;
//
//     isAvailable
//         ? print('Biometric is available!')
//         : print('Biometric is unavailable.');
//
//     return isAvailable;
//   }
//
//   Future<void> _getListOfBiometricTypes(bool mounted) async {
//     List<BiometricType> listOfBiometrics;
//     try {
//       listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//
//     if (!mounted) return;
//
//     print(listOfBiometrics);
//   }
//
//   Future<void> _authenticateUser(BuildContext context, bool mounted) async {
//     bool isAuthenticated = false;
//     try {
//       isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
//         localizedReason:
//             "Please authenticate to view your transaction overview",
//         useErrorDialogs: true,
//         stickyAuth: true,
//       );
//     } on PlatformException catch (e) {
//       print(e);
//     }
//
//     if (!mounted) return;
//
//     isAuthenticated
//         ? print('User is authenticated!')
//         : print('User is not authenticated.');
//
//     if (isAuthenticated) {}
//   }
//
//   Future<List<ItemSwitch>> getSaveItems(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var notification =
//         (prefs.getBool(Constants.KEY_NOTIFICATION_CONFIG) ?? true);
//     var bio = (prefs.getBool(Constants.KEY_BIO_CONFIG) ?? false);
//     List<ItemSwitch> items = <ItemSwitch>[
//       ItemSwitch(
//           title: appLocalizations.notificationsTitle,
//           subtitle: appLocalizations.notificationContentSetting,
//           icon: Icons.notifications_active,
//           isSelect: notification,
//           switchType: SwitchType.NOTIFICATION),
//       ItemSwitch(
//           title: appLocalizations.bioTitleSetting,
//           subtitle: appLocalizations.bioContentSetting,
//           icon: Icons.fingerprint_sharp,
//           isSelect: bio,
//           switchType: SwitchType.BIO_DETECT),
//       ItemSwitch(
//           title: appLocalizations.faceRecordTitleSetting,
//           subtitle: appLocalizations.faceRecordSetting,
//           isSelect: false,
//           icon: Icons.camera,
//           switchType: SwitchType.FACE_DETET)
//     ];
//     return items;
//   }
//
//   Future<void> switchItem(BuildContext context, bool mounted,
//       Function animation, ItemSwitch item) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     switch (item.switchType) {
//       case SwitchType.NOTIFICATION:
//         {
//           item.isSelect = !item.isSelect;
//           prefs.setBool(Constants.KEY_NOTIFICATION_CONFIG, item.isSelect);
//           animation();
//           break;
//         }
//       case SwitchType.BIO_DETECT:
//         {
//           if (await _isBiometricAvailable(mounted)) {
//             await _getListOfBiometricTypes(mounted);
//             await _authenticateUser(context, mounted);
//           }
//           item.isSelect = !item.isSelect;
//           prefs.setBool(Constants.KEY_BIO_CONFIG, item.isSelect);
//           animation();
//           break;
//         }
//       case SwitchType.FACE_DETET:
//         {
//           item.isSelect = !item.isSelect;
//           navigationService.pushNamed(RecordFaceScreen.route_name);
//           animation();
//           break;
//         }
//       default:
//         {}
//     }
//     reloadSwitch = !reloadSwitch;
//     notifyListeners();
//   }
//
//   @override
//   String getTitle(BuildContext context) {
//     return appLocalizations.configurationTitle;
//   }
//
//   @override
//   String getSubTitle(BuildContext context) {
//     // TODO: implement getSubTitle
//     throw UnimplementedError();
//   }
//
//   @override
//   void onClickLeft(BuildContext context) {}
//
//   @override
//   void onClickRight(BuildContext context) {}
// }
