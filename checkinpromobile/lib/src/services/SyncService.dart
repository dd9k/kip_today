import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SyncService {
  Future<void> syncEventCheckedGuest(BuildContext context) async {
    var db = Provider.of<Database>(context, listen: false);
    var lstEventSync = await db.eventGuestDAO.getGuestCheckedNotSync();
    if (lstEventSync == null || lstEventSync.length <= 0) {
      return;
    }
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      Utilities().printLog(
          'Class SyncService === Function syncEventCheckedGuest === Sync successfully',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
      db.eventGuestDAO.updateStatusSyncForEventCheckInSync(lstEventSync);
    }, (Errors message) async {
      Utilities().printLog(
          'Class SyncService === Function syncEventCheckedGuest === Sync failed === ${message.code} - ${message.description}',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
    });
    ApiRequest().requestSyncEventGuest(context, lstEventSync, callBack);
  }

  Future<void> syncInvitationCheckedVisitor(BuildContext context) async {
    var db = Provider.of<Database>(context, listen: false);
    var lstItems =
        await db.visitorInviteCheckinSyncDAO.getVisitorInviteNotYetSync();
    if (lstItems == null || lstItems.length <= 0) {
      return;
    }
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      Utilities().printLog(
          'Class SyncService === Function syncInvitationCheckedVisitor === Sync successfully',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
      db.visitorInviteCheckinSyncDAO
          .updateStatusSyncForInvitationCheckInOutSync(lstItems);
    }, (Errors message) async {
      Utilities().printLog(
          'Class SyncService === Function syncInvitationCheckedVisitor === Sync failed === ${message.code} - ${message.description}',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
    });
    ApiRequest().requestSyncInvitationVisitor(context, lstItems, callBack);
  }
}
