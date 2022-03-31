import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/AttendanceInfoTodayResponse.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/ETOrderInfo.dart';
import 'package:checkinpromobile/src/model/EmployeeInfo.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/EventTicket.dart';
import 'package:checkinpromobile/src/model/EventTicketDetail.dart';
import 'package:checkinpromobile/src/model/ItemEventToday.dart';
import 'package:checkinpromobile/src/model/ItemInvitation.dart';
import 'package:checkinpromobile/src/model/ItemVisitor.dart';
import 'package:checkinpromobile/src/model/WorkingTimeInfo.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:convert' as convert;
import '../../AppBarNotifier.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';

class Greeting {
  String mess;
  IconData icon;
  String subMess;

  Greeting(this.mess, this.icon, this.subMess);
}

class DashBoardNotifier extends AppBarNotifier {
  RefreshController refreshController = RefreshController();
  EventTicketDetail eventDetail;
  int notiCount = 0;
  bool isLoadingExToday = true;
  bool isLoadingMyVisitor = true;
  var langSaved;
  String valueImage;
  bool isLoadingChart = false;
  AsyncMemoizer<List<EventTicket>> memCacheTicket = AsyncMemoizer();
  Map<String, Uint8List> savedImage = Map();
  EmployeeInfo employee;
  Authenticate authenAppbar;
  double eventTicketId;
  List<EventTicket> listEventTicket = List();
  List<EventTicket> listEventTicketEnd = List();
  List<ETOrderInfo> listOrderInfo = List();
  List<ETOrderInfo> listOrderInfoPaid = List();

  int totalItemVisitorLog = Constants.MAX_INT;
  int pageIndexNewInvite = 1;
  int pageIndexVisitorLog = 1;

  List<ItemEventToday> eventToday = List();
  List<ItemVisitor> listMyVisitor = List();
  List<ItemInvitation> listInvitation = List();
  List<String> listInvitationVisitorTypeName = List();
  List<AttendanceInfoToday> totalCheckinCheckout = List();
  AttendanceInfoTodayResponse data;
  double totalWorkingDay = 0;
  List<double> removeItem = [];
  bool deleteMode = false;
  bool reloadSelected = false;

  // Attendance info start
  bool isUpdateAttendance = true;
  bool isReloadAttendance = true;
  bool isReloadEvent = true;
  bool isReloadEventEnd = true;
  bool isLoadingEventDetail = false;
  String checkedInTime = '';
  String checkedOutTime = '';
  String checkedDate = '';
  bool updateTime = false;
  double totalWorkingWeek = 0;
  double totalWorkingMonth = 0;
  double totalexpected = 0;
  int totalLateDayInMonth = 0;
  int totalNotCheckoutDayInMonth = 0;
  int totalNotEnoughInMonth = 0;
  bool isLoadingWorkingTimeTotal = true;
  int localIndex;
  bool isEventTicket = true;
  Uint8List savedAvatar;
  int selectedBarIndex = 0;

  // Attendance info end
  bool isAttendanceMode = false;
  int expected = 176;
  ScrollController controller;
  AsyncMemoizer<void> memCache = AsyncMemoizer();
  AsyncMemoizer<bool> memCacheAttendance = AsyncMemoizer();
  AsyncMemoizer<int> memCacheChart = AsyncMemoizer();
  AsyncMemoizer<List<ItemEventToday>> memCacheEvent = AsyncMemoizer();
  AsyncMemoizer<Uint8List> memCacheAvatar = AsyncMemoizer();

  @override
  String getTitle(BuildContext context) {
    return "";
  }

  @override
  String getSubTitle(BuildContext context) {
    return '';
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {}

  String convertStringToTime(String date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    DateTime dateTimeIn = DateTime.parse(date);
    String timeInHour = DateFormat('HH:mm').format(dateTimeIn);
    return timeInHour;
  }

  void updateTabBar(int index) {
    selectedBarIndex = index;
    notifyListeners();
  }

  void selectedDeleteEnd(EventTicket item) {
    item.isSelect = !item.isSelect;
    if (item.isSelect) {
      removeItem.add(item.id);
    } else {
      removeItem.remove(item.id);
    }
  }

  void selectedAllDelete(bool isSelect) {
    for (int index = 0; index < listEventTicketEnd.length; index++) {
      if (listEventTicketEnd[index].isSelect != isSelect) {
        selectedDeleteEnd(listEventTicketEnd[index]);
      }
    }
    reloadUISelected();
  }

  void reloadUISelected() {
    reloadSelected = !reloadSelected;
    notifyListeners();
  }

  void updateMode() {
    if (listEventTicketEnd?.isNotEmpty == true) {
      deleteMode = !deleteMode;
      if (!deleteMode) {
        removeItem.clear();
        selectedAllDelete(false);
      } else {
        notifyListeners();
      }
    }
  }

  void getAttendanceModeInPreference(BuildContext context) {
    isAttendanceMode = parent.preferences.getBool(Constants.KEY_IS_ATTENDANCE_MODE) ?? false;
    expected = utilities.getAuthorization(parent.preferences).employeeInfo.expected;
    isEventTicket = utilities.getAuthorization(parent.preferences).isEventTicket;
    String value = parent.preferences.getString(Constants.KEY_CHANGE_UI) ?? "0";
    localIndex = int.parse(value);
    loadData(context);
  }

  void reloadChart() {
    isLoadingChart = !isLoadingChart;
    memCacheChart = AsyncMemoizer();
    notifyListeners();
  }

  Future<bool> getTodayAttendanceInfo(BuildContext context) async {
    return memCacheAttendance.runOnce(() async {
      ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
        data = AttendanceInfoTodayResponse.fromJson(baseResponse.data);
        parent.preferences.setString(Constants.KEY_ATTENDANCE_TODAY, JsonEncoder().convert(baseResponse.data));
        totalCheckinCheckout = data.today;
        totalWorkingDay = data.totalWorkingTime;
        if (data.latestCheckin == null) {
          checkedInTime = '';
          checkedOutTime = '';
          checkedDate = '';
          // Insert to local DB
          db.checkInTimeTodayDAO.deleteAlls().then((_) {
            db.checkInTimeTodayDAO.insert(null, null, null);
          });
          isUpdateAttendance = !isUpdateAttendance;
          isReloadAttendance = false;
          notifyListeners();
          return;
        }
        checkedInTime = convertStringToTime(data.latestCheckin.timeIn);
        checkedOutTime = convertStringToTime(data.latestCheckin.timeOut);
        checkedDate = (data.latestCheckin.date == null || data.latestCheckin.date.isEmpty)
            ? ''
            : await utilities.convertDateToStringLongDate(data.latestCheckin.date, context, isWithoutTime: true);
        isUpdateAttendance = !isUpdateAttendance;
        isReloadAttendance = false;
        notifyListeners();
        // Insert to local DB
        db.checkInTimeTodayDAO.deleteAlls().then((_) {
          db.checkInTimeTodayDAO.insert(data.latestCheckin.timeIn, data.latestCheckin.timeOut, data.latestCheckin.date);
        });
      }, (Errors message) async {
        checkedInTime = '';
        checkedOutTime = '';
        checkedDate = '';
        // No internet
        if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
          try {
            data = AttendanceInfoTodayResponse.fromJson(
                JsonDecoder().convert(parent.preferences.getString(Constants.KEY_ATTENDANCE_TODAY)));
            totalCheckinCheckout = data.today;
            totalWorkingDay = data.totalWorkingTime;
            if (data.latestCheckin == null) {
              checkedInTime = '';
              checkedOutTime = '';
              checkedDate = '';
              // Insert to local DB
              db.checkInTimeTodayDAO.deleteAlls().then((_) {
                db.checkInTimeTodayDAO.insert(null, null, null);
              });
              isUpdateAttendance = !isUpdateAttendance;
              isReloadAttendance = false;
              notifyListeners();
              return;
            }
            checkedInTime = convertStringToTime(data.latestCheckin.timeIn);
            checkedOutTime = convertStringToTime(data.latestCheckin.timeOut);
            checkedDate = (data.latestCheckin.date == null || data.latestCheckin.date.isEmpty)
                ? ''
                : await utilities.convertDateToStringLongDate(data.latestCheckin.date, context, isWithoutTime: true);
          } catch (e) {}
        }
        isUpdateAttendance = !isUpdateAttendance;
        isReloadAttendance = false;
        notifyListeners();
        //handler show error
      });
      await ApiRequest().requestGetToDayAttendanceInfo(context, callBack);
      return isReloadAttendance;
    });
  }

  Future<Uint8List> getSavedNetworkImage(String link, String fileName) async {
    if (savedImage.containsKey(fileName)) {
      return savedImage[fileName];
    }
    savedImage[fileName] = await utilities.getSavedNetworkImage(link, fileName, db);
    return savedImage[fileName];
  }

  void getEmployeeInfo(BuildContext context) {
    final data = parent.preferences.getString(Constants.KEY_AUTHENTICATE) ?? "";
    authenAppbar = Authenticate.fromJson(JsonDecoder().convert(data));
    getImageLink(authenAppbar.employeeInfo.personalInfo.mobileAvatar);
  }

  void getImageLink(String imageLink) {
    memCacheAvatar = AsyncMemoizer();
    valueImage = imageLink;
    notifyListeners();
  }

  Future<Uint8List> getAvatar() {
    return memCacheAvatar.runOnce(() async {
      savedAvatar = await Utilities().getSavedNetworkImage(valueImage, Constants.FOLDER_FACE_OFFLINE, db);
      return savedAvatar;
    });
  }

  Future<List<ItemEventToday>> getDataEventTodayInDbLocal() async {
    return memCacheEvent.runOnce(() async {
      return _getEventToday();
    });
  }

  Future<List<ItemEventToday>> _getEventToday() async {
    var completer = new Completer<List<ItemEventToday>>();
    ApiCallBack callBack = ApiCallBack((BaseListResponse baseListResponse) async {
      if (baseListResponse.data != null) {
        final lst = baseListResponse.data.map((Map model) => ItemEventToday.fromJson(model)).toList();
        eventToday.clear();
        eventToday = locator<Utilities>().combineTwoList(eventToday, lst);
      }
      // Save data to db local
      await db.eventTodayDAO.deleteAlls().then((_) {
        _saveEventTodayToDBLocal(eventToday);
      });
      completer.complete(eventToday);
    }, (Errors message) async {
      if (message.code != -2) {}
      // No internet
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Load data from DB local
        List<ItemEventToday> lstItemEventToday = await db.eventTodayDAO.getAlls();
        eventToday = lstItemEventToday;
        completer.complete(eventToday);
      }
    });
    await ApiRequest().requestGetEventToday(context, callBack);
    return completer.future;
  }

  /// AUTHOR: HAO-LQ 20210401
  ///
  /// TODO: Save list event expected today to DB local
  Future<void> _saveEventTodayToDBLocal(List<ItemEventToday> lstItem) async {
    lstItem.forEach((item) {
      locator<Utilities>().downloadFileImageByUrl(item.coverPathFile).then((bytes) {
        // Save file image cover to local storge
        item.nameImgLocal = bytes == null ? '' : 'cover_${item.id.toInt().toString()}.png';
        if (bytes != null) {
          locator<Utilities>().saveLocalFile(Constants.FOLDER_TEMP_EVENT, item.nameImgLocal, null, bytes);
        }
        // Insert to db
        db.eventTodayDAO.insertAlls([item]);
      });
    });
  }

  void updateTotalCountNotification(BuildContext context) {
    locator<Utilities>().getTotalUnreadNotification(context, (int value) {
      notiCount = value;
      notifyListeners();
    });
  }

  Future getDataMyVisitorLogInDbLocal(BuildContext context) async {
    if (listMyVisitor.length > 0) {
      return;
    }
    isLoadingMyVisitor = true;
    notifyListeners();
    _getMyVisitorLog(context);
  }

  Future _getMyVisitorLog(BuildContext context) async {
    ApiCallBack callBack = ApiCallBack((BaseListResponse baseListResponse) async {
      if (baseListResponse.data != null) {
        final lst = baseListResponse.data.map((Map model) => ItemVisitor.fromJson(model)).toList();
        final dateNow = DateTime.now();
        listMyVisitor = lst.where((model) {
          final signIn = model.signIn == null || model.signIn.isEmpty ? null : DateTime.tryParse(model.signIn);
          if (signIn != null) {
            return signIn.day == dateNow.day && signIn.month == dateNow.month && signIn.year == dateNow.year;
          }
          return false;
        }).toList();
      }
      isLoadingMyVisitor = false;
      notifyListeners();
      // Save my visitor log to local DB
      db.myVisitorLogTodayDAO.deleteAlls().then((_) {
        _saveMyVisitorLogToDBLocal(listMyVisitor);
      });
    }, (Errors message) async {
      // No internet
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Load data from DB local
        List<ItemVisitor> lstItemVisitor = await db.myVisitorLogTodayDAO.getAllsForFours();
        listMyVisitor = lstItemVisitor;
      }
      isLoadingMyVisitor = false;
      notifyListeners();
    });
    // Request API
    await ApiRequest().requestMyVisitor(context, pageIndexNewInvite, 4, callBack);
  }

  Future<void> _saveMyVisitorLogToDBLocal(List<ItemVisitor> lstItem) async {
    lstItem.forEach((item) {
      locator<Utilities>().downloadFileImageByUrl(item.faceCaptureFile).then((bytes) {
        // Save file image cover to local storge
        item.nameImgLocal = bytes == null ? '' : 'face_${item.id.toInt().toString()}.png';
        if (bytes != null) {
          locator<Utilities>().saveLocalFile(Constants.FOLDER_TEMP_VISITOR_LOG, item.nameImgLocal, null, bytes);
        }
        // Insert to db
        db.myVisitorLogTodayDAO.insertAlls([item]);
      });
    });
  }

  Future getDataInvitationExpectedTodayInDbLocal(BuildContext context) async {
    if (listInvitation.length > 0) {
      return;
    }
    final exceedingSeconds = Constants.EXCEEDING_SECONDS_SEARCH_INVITATION;
    isLoadingExToday = true;
    notifyListeners();
    _getInvitationToday(context, exceedingSeconds);
  }

  Future _getInvitationToday(BuildContext context, int exceedingSeconds) async {
    final clientDate = DateFormat(Constants.DATE_FORMAT_TO_SQL).format(DateTime.now());
    ApiCallBack callBack = ApiCallBack((BaseListResponse baseListResponse) async {
      if (baseListResponse.data != null) {
        final lst = baseListResponse.data.map((Map model) => ItemInvitation.FromJson(model)).toList();
        listInvitation.clear();
        listInvitation = locator<Utilities>().combineTwoList(listInvitation, lst);
        // Get visitor type by lang
        try {
          List<Map<String, dynamic>> listVisitorTypeValueMap = listInvitation.map<Map<String, dynamic>>((item) {
            return convert.json.decode(item.visitorTypeValue);
          }).toList();
          var langSaved = parent.preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
          if (langSaved == Constants.EN_CODE) {
            listInvitationVisitorTypeName = listVisitorTypeValueMap.map<String>((item) => item["en"]).toList();
          } else if (langSaved == Constants.VN_CODE) {
            listInvitationVisitorTypeName = listVisitorTypeValueMap.map<String>((item) => item["vi"]).toList();
          }
        } catch (e) {
          utilities.printLog(e.toString());
        }
      }
      isLoadingExToday = false;
      notifyListeners();
      // Save invitation expected to local DB
      db.invitationExpectedDAO.deleteAlls().then((_) {
        _saveInvitationExpectedTodayToDBLocal(listInvitation);
      });
    }, (Errors message) async {
      if (message.code != -2) {}
      // No internet
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Load data from DB local
        List<ItemInvitation> lstInvitationExpected = await db.invitationExpectedDAO.getAlls(exceedingSeconds);
        listInvitation = lstInvitationExpected;
        try {
          List<Map<String, dynamic>> listVisitorTypeValueMap = listInvitation.map<Map<String, dynamic>>((item) {
            return convert.json.decode(item.visitorTypeValue);
          }).toList();
          var langSaved = parent.preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
          if (langSaved == Constants.EN_CODE) {
            listInvitationVisitorTypeName = listVisitorTypeValueMap.map<String>((item) => item["en"]).toList();
          } else if (langSaved == Constants.VN_CODE) {
            listInvitationVisitorTypeName = listVisitorTypeValueMap.map<String>((item) => item["vi"]).toList();
          }
        } catch (e) {
          utilities.printLog(e.toString());
        }
      }
      isLoadingExToday = false;
      notifyListeners();
    });
    await ApiRequest().requestGetInvitationToday(context, callBack, clientDate, exceedingSeconds);
  }

  Future<void> _saveInvitationExpectedTodayToDBLocal(List<ItemInvitation> lstItem) async {
    lstItem.forEach((item) {
      locator<Utilities>().downloadFileImageByUrl(item.coverPathFile).then((bytes) {
        // Save file image cover to local storge
        item.nameImgLocal = bytes == null ? '' : 'cover_${item.inviteCode.toLowerCase()}.png';
        if (bytes != null) {
          locator<Utilities>().saveLocalFile(Constants.FOLDER_TEMP_INVITE, item.nameImgLocal, null, bytes);
        }
        // Insert to db
        db.invitationExpectedDAO.insertAlls([item]);
      });
    });
  }

  Future getWorkingTimeInfo(BuildContext context) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      if (baseResponse.data == null) {
        // isLoading = false;
        isLoadingWorkingTimeTotal = false;
        notifyListeners();
        return;
      }
      final dataInfo = WorkingTimeInfo.fromJson(baseResponse.data);
      if (dataInfo.totalInWeek != null) {
        this.totalWorkingWeek = dataInfo.totalInWeek;
      } else {
        this.totalWorkingWeek = 0;
      }
      if (dataInfo.totalInMonth != null) {
        this.totalWorkingMonth = dataInfo.totalInMonth;
      } else {
        this.totalWorkingMonth = 0;
      }

      totalLateDayInMonth = dataInfo?.totalLateDayInMonth ?? 0;
      totalNotCheckoutDayInMonth = dataInfo?.totalNotCheckoutDayInMonth ?? 0;
      totalNotEnoughInMonth = dataInfo?.totalNotEnoughInMonth ?? 0;
      // isLoading = false;
      isLoadingWorkingTimeTotal = false;
      updateTime = !updateTime;
      notifyListeners();
      // Insert into to local DB
      db.workingTimeDAO.deleteAlls().then((_) {
        db.workingTimeDAO.insert(dataInfo.totalInWeek, dataInfo.totalInMonth, dataInfo.totalLateDayInMonth,
            dataInfo.totalNotCheckoutDayInMonth, dataInfo.totalNotEnoughInMonth);
      });
    }, (Errors message) async {
      if (message.code != -2) {}
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        final dataInfo = await db.workingTimeDAO.getWorkingTimeInfo();
        if (dataInfo.totalInWeek != null) {
          this.totalWorkingWeek = dataInfo.totalInWeek;
        } else {
          this.totalWorkingWeek = 0;
        }
        if (dataInfo.totalInMonth != null) {
          this.totalWorkingMonth = dataInfo.totalInMonth;
        } else {
          this.totalWorkingMonth = 0;
        }
      }
      isLoadingWorkingTimeTotal = false;
      updateTime = !updateTime;
      notifyListeners();
    });
    await ApiRequest().requestGetWorkingTimeInfo(context, callBack, DateTime.now());
  }

  void reLoadData(BuildContext context) {
    memCache = AsyncMemoizer();
    memCacheAttendance = AsyncMemoizer();
    memCacheEvent = AsyncMemoizer();
    memCacheTicket = AsyncMemoizer();
    isReloadAttendance = true;
    isLoadingWorkingTimeTotal = true;
    if (!isEventTicket) {
      getTodayAttendanceInfo(this.context);
      notifyListeners();
    }
    loadData(context);
  }

  void loadData(BuildContext context) {
    memCache.runOnce(() {
      updateTotalCountNotification(context);
      if (!isEventTicket) {
        if (isAttendanceMode) {
//        getTodayAttendanceInfo(context);
          getWorkingTimeInfo(context);
        }
        if (localIndex == 1 || !isAttendanceMode) {
          eventToday.clear();
          listInvitation.clear();
          listMyVisitor.clear();
          getDataInvitationExpectedTodayInDbLocal(context);
          getDataMyVisitorLogInDbLocal(context);
        }
      }
      getEmployeeInfo(context);
    });
  }

  Future onRefreshEventTicket() async {
    reLoadData(context);
    await getEventTicket(true);
    refreshController.refreshCompleted();
  }

  Future<List<EventTicket>> getEventTicket(bool isReload) async {
    return memCacheTicket.runOnce(() async {
      var listSaved = await db.eventTicketDAO.getAllEventTicket(parent.isConnection, false);
      if (listSaved.isEmpty || isReload) {
        try {
          var completer = new Completer<List<EventTicket>>();
          ApiCallBack callBack = ApiCallBack((BaseListResponse baseListResponse) async {
            listEventTicket.clear();
            if (baseListResponse.data != null) {
              listEventTicket = baseListResponse.data.map((Map model) => EventTicket.fromJson(model)).toList();
              await db.eventTicketDAO.insertAll(listEventTicket);
            } else {}
            listEventTicketEnd = await db.eventTicketDAO.getAllEventTicket(parent.isConnection, true);
            completer.complete(listEventTicket);
            if (isReload) {
              isReloadEvent = !isReloadEvent;
              notifyListeners();
            }
          }, (Errors message) async {
            completer.complete(listEventTicket);
          });
          await ApiRequest().requestGetAllEventTicket(context, callBack);
          return completer.future;
        } catch (e) {}
        return null;
      } else {
        listEventTicketEnd = await db.eventTicketDAO.getAllEventTicket(parent.isConnection, true);
        listEventTicket = listSaved;
        return listEventTicket;
      }
    });
  }

  Future<void> deleteEvent() async {
    if (removeItem.isNotEmpty) {
      Utilities().showTwoButtonDialog(
        context,
        DialogType.QUESTION,
        null,
        appLocalizations.saveThemeContent,
        "Bạn có chắc muốn xóa ${removeItem.length} sự kiện?",
        appLocalizations.noTitle,
        appLocalizations.yesTitle,
        () {},
        () async {
          isLoadingEventDetail = true;
          notifyListeners();
          for (int index = 0; index < removeItem.length; index++) {
            await db.eTOrderInfoDAO.deleteByEventId(removeItem[index]);
            await db.eventTicketDAO.deleteByEventId(removeItem[index]);
          }
          listEventTicketEnd = await db.eventTicketDAO.getAllEventTicket(parent.isConnection, true);
          removeItem.clear();
          isReloadEventEnd = !isReloadEventEnd;
          deleteMode = !deleteMode;
          isLoadingEventDetail = false;
          notifyListeners();
        },
      );
    }
  }

  Future getEventTicketOrder(double eventId, Function onDone) async {
    isLoadingEventDetail = true;
    notifyListeners();
    if ((await db.eTTicketInfoDAO.getByEventId(eventId)) == null) {
      ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
        eventDetail = EventTicketDetail.fromJson(baseResponse.data);
        listOrderInfo = eventDetail.orderInfo;
        listOrderInfo?.sort((a, b) => a.guestName.compareTo(b.guestName));
        await db.eTOrderInfoDAO.insertAll(eventDetail.orderInfo);
        db.eTBookingConfigInforDAO.insertOne(eventDetail.settingInfo);
        await db.eTBookingDiscountInfoDAO.insertAll(eventDetail.ticketInfo.bookingDiscountInfo);
        await db.eTTicketInfoDAO.insertOne(eventDetail.ticketInfo);
        await db.eTPayMentInfoDAO.insertOne(eventDetail.paymentInfo);
        await db.eTPaymentTypeDAO.insertAll(eventDetail.paymentTypes, eventDetail.eventInfo.id);
        isLoadingEventDetail = false;
        notifyListeners();
        onDone();
      }, (Errors message) async {
        isLoadingEventDetail = false;
        notifyListeners();
      });
      await ApiRequest().requestEventTicketDetails(context, eventId, callBack);
    } else {
      listOrderInfo = await db.eTOrderInfoDAO.getOrdersByEventId(eventId);
      listOrderInfoPaid = await db.eTOrderInfoDAO.getOrdersPaidByEventId(eventId);
      eventDetail = EventTicketDetail.init();
      eventDetail.orderInfo = listOrderInfo;
      eventDetail.eventInfo = await db.eventTicketDAO.getEventTicketById(eventId);
      eventDetail.ticketInfo = await db.eTTicketInfoDAO.getByEventId(eventId);
      eventDetail.ticketInfo.bookingDiscountInfo =
          await db.eTBookingDiscountInfoDAO.getByTicketId(eventDetail.ticketInfo.idTicketInfo);
      eventDetail.paymentInfo = await db.eTPayMentInfoDAO.getByEventId(eventId);
      eventDetail.settingInfo = await db.eTBookingConfigInforDAO.getByEventId(eventId);
      eventDetail.paymentTypes = await db.eTPaymentTypeDAO.getByEventId(eventId);
      isLoadingEventDetail = false;
      notifyListeners();
      onDone();
    }
  }
}
