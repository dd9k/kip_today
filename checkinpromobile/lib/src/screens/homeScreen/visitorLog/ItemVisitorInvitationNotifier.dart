import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/model/NewVisitor.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class ItemVisitorInvitationNotifier extends AppBarNotifier {
  InviteNewVisitor invitation;
  List<NewVisitor> lstVisitorInvite = List();
  AsyncMemoizer memCacheVisitorInvite = AsyncMemoizer();
  bool isLoading = true;

  String siteName = '';
  String visitorTypeName = '';

  Future getVisitorInvite(BuildContext context, String timezone, int pageIndex,
      int pageSize, InviteNewVisitor inviteNewVisitor) async {
    return memCacheVisitorInvite.runOnce(() async {
      if (inviteNewVisitor != null) {
        if (inviteNewVisitor.guests != null) {
          lstVisitorInvite = inviteNewVisitor.guests;
          siteName = inviteNewVisitor.branchName;
          // Get visitor type by lang
          Map<String, dynamic> visitorTypeValueToJson =
              convert.json.decode(inviteNewVisitor.visitorTypeValue);
          var preferences = await SharedPreferences.getInstance();
          var langSaved = preferences.getString(Constants.KEY_LANGUAGE) ??
              Constants.LANG_DEFAULT;
          if (langSaved == Constants.EN_CODE) {
            visitorTypeName = visitorTypeValueToJson["en"];
          } else if (langSaved == Constants.VN_CODE) {
            visitorTypeName = visitorTypeValueToJson["vi"];
          }
        }
        isLoading = false;
        notifyListeners();
      }
    });
  }

  @override
  String getTitle(BuildContext context) {
    return invitation.invitationName;
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {}
}
