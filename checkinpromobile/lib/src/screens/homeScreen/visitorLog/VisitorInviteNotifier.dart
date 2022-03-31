import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/model/InvitationGroup.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../AppBarNotifier.dart';

class VisitorInviteNotifier extends AppBarNotifier {
  static const String CHECK_IN_STATUS = "CheckedIn";
  static const String CHECK_OUT_STATUS = "CheckedOut";
  int selectedBarIndex = 0;
  bool isCalendar = false;
  bool isLoadingCalendar = true;
  CalendarView calendarView = CalendarView.month;

  List<InviteNewVisitor> listVisitorInvitation = List();
  bool updateScheduler = false;
//  List<InviteNewVisitor> listCalendar = List();
  List<InvitationGroup> listInvitationGroup = List();
  RoundedLoadingButtonController btnTryAgainController =
      new RoundedLoadingButtonController();

  int totalItemNewInvite = Constants.MAX_INT;
  int totalItemVisitorLog = Constants.MAX_INT;
  int pageIndexNewInvite = 1;
  int pageIndexVisitorLog = 1;
  var langSaved;
  bool isLoading = true;
  bool isGettingData = false;
  bool isFirstGetData = true;
  List<int> monthLoaded = List();
  Map<int, List<InviteNewVisitor>> mapCalendarLoaded = Map();
  int currentMonthSelected = DateTime.now().month;
  RefreshController refreshController = RefreshController();
  InvitationDataSource invitationDataSource = InvitationDataSource.init();

  void updateTabBar(int index) {
    selectedBarIndex = index;
    notifyListeners();
  }

  void updateCalendarView(CalendarView newValue) {
    calendarView = newValue;
    notifyListeners();
  }

  bool isSelected(int index) => selectedBarIndex == index;

  void resetInviteData() {
    totalItemNewInvite = Constants.MAX_INT;
    pageIndexNewInvite = 1;
    listInvitationGroup.clear();
    listVisitorInvitation.clear();
    monthLoaded.remove(currentMonthSelected);
    isFirstGetData = true;
  }

  void doTryAgain() {
    resetInviteData();
    getAPIVisitorInvitation(context, callbackFn: () {
      // btnTryAgainController.stop();
    });
    getCalendarVisitorInvitation(currentMonthSelected);
  }

  String getNameFromCalendarView(CalendarView view) {
    switch (view) {
      case CalendarView.month:
        {
          return appLocalizations.monthView;
        }
      case CalendarView.week:
        {
          return appLocalizations.weekView;
        }
      case CalendarView.day:
        {
          return appLocalizations.dayView;
        }
      default:
        return appLocalizations.monthView;
    }
  }

  void changeLayout() {
    isCalendar = !isCalendar;
    notifyListeners();
  }

  Future getAPIVisitorInvitation(BuildContext context,
      {Function callbackFn}) async {
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      totalItemNewInvite = baseListResponse.totalCount; // Get total
      final lst = (baseListResponse.data ?? [])
          .map((Map model) => InviteNewVisitor.fromJson(model))
          .toList();
      if (isFirstGetData) {
        isFirstGetData = false;
      }
      if (lst.length > 0) {
        pageIndexNewInvite = pageIndexNewInvite + 1;
        // Insert data to local DB
        db.myInvitationDAO.insertAlls(lst);
      }
      var listTemp = await locator<Utilities>().createGroupInviteWithInvite(
          this.context, langSaved, listInvitationGroup, lst);
      listInvitationGroup = listTemp;
      // Combine two list
      listVisitorInvitation =
          locator<Utilities>().combineTwoList(listVisitorInvitation, lst);
      isLoading = false;
      isGettingData = false;
      notifyListeners();
      // Callback
      if (callbackFn != null) {
        callbackFn();
      }
    }, (Errors message) async {
      // No internet connection
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Get data in local DB
        final lstMyInvitation =
            await db.myInvitationDAO.getAlls(pageIndexNewInvite - 1);
        totalItemNewInvite = await db.myInvitationDAO.getCounts();
        final lst = lstMyInvitation ?? [];
        if (lst.length > 0) {
          pageIndexNewInvite = pageIndexNewInvite + 1;
        }
        var listTemp = await locator<Utilities>().createGroupInviteWithInvite(
            context, langSaved, listInvitationGroup, lst);
        listInvitationGroup = listTemp;
        // Combine two list
        listVisitorInvitation =
            locator<Utilities>().combineTwoList(listVisitorInvitation, lst);
        isLoading = false;
        isGettingData = false;
        notifyListeners();
        // Callback
        if (callbackFn != null) {
          callbackFn();
        }
      } else {
        isLoading = false;
        isGettingData = false;
        notifyListeners();
      }
    });
    // Request API
    await ApiRequest().requestSearchInviteVisitor(
        context, pageIndexNewInvite, Constants.PAGE_MAX_SIZE, callBack);
  }

  Future getCalendarVisitorInvitation(int month) async {
    currentMonthSelected = month;
    if (!monthLoaded.contains(month)) {
      monthLoaded.add(month);
      isLoadingCalendar = true;
      notifyListeners();
      ApiCallBack callBack = ApiCallBack((BaseListResponse baseListResponse) async {
        var newList = (baseListResponse.data ?? []).map((Map model) => InviteNewVisitor.fromJson(model)).toList();
        isLoadingCalendar = false;
        if (mapCalendarLoaded.containsKey(month)) {
          var oldList = mapCalendarLoaded[month];
          for (var element in oldList) {
            if (!newList.contains(element)) {
              invitationDataSource.source.removeWhere((source) => source == element);
            }
          }
          for (var element in newList) {
            if (!oldList.contains(element)) {
              element.valueReminder = (await db.reminderInvitationDAO.getById(element.id))?.reminderValue;
              invitationDataSource.source.add(element);
            }
          }
          mapCalendarLoaded[month].clear();
          mapCalendarLoaded[month].addAll(invitationDataSource.source);
          invitationDataSource.notifyListeners(CalendarDataSourceAction.reset, invitationDataSource.source);
          refreshController.refreshCompleted();
        } else {
          mapCalendarLoaded[month] = newList;
          invitationDataSource.source.addAll(newList);
          invitationDataSource.notifyListeners(CalendarDataSourceAction.add, newList);
        }
        db.myInvitationDAO.insertAlls(newList);
        notifyListeners();
      }, (Errors message) async {
        // No internet connection
        if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
          var newList = await db.myInvitationDAO.getByMonth(month);
          isLoadingCalendar = false;
          if (mapCalendarLoaded.containsKey(month)) {
            var oldList = mapCalendarLoaded[month];
            for (var element in oldList) {
              if (!newList.contains(element)) {
                invitationDataSource.source.removeWhere((source) => source == element);
              }
            }
            for (var element in newList) {
              if (!oldList.contains(element)) {
                element.valueReminder = (await db.reminderInvitationDAO.getById(element.id))?.reminderValue;
                invitationDataSource.source.add(element);
              }
            }
            mapCalendarLoaded[month].clear();
            mapCalendarLoaded[month].addAll(invitationDataSource.source);
            invitationDataSource.notifyListeners(CalendarDataSourceAction.reset, invitationDataSource.source);
            refreshController.refreshCompleted();
          } else {
            mapCalendarLoaded[month] = newList;
            invitationDataSource.source.addAll(newList);
            invitationDataSource.notifyListeners(CalendarDataSourceAction.add, newList);
          }
          db.myInvitationDAO.insertAlls(newList);
          notifyListeners();
        }
        isLoadingCalendar = false;
        notifyListeners();
        refreshController.refreshCompleted();
      });
      // Request API
      await ApiRequest().requestCalendarInviteVisitor(context, month, callBack);
    }
  }

  void addNewInvite(InviteNewVisitor inviteNewVisitor) {
    var listNew = List<InviteNewVisitor>()..add(inviteNewVisitor);
    var listTemp = utilities.insertNewInviteInGroupInvite(
        context, langSaved, listInvitationGroup, inviteNewVisitor);
    listInvitationGroup = listTemp;
    // Combine two list
    listVisitorInvitation =
        utilities.combineTwoList(listVisitorInvitation, listNew);
    updateScheduler = !updateScheduler;
    notifyListeners();
    
    invitationDataSource.source.add(inviteNewVisitor);
    mapCalendarLoaded[currentMonthSelected].add(inviteNewVisitor);
    invitationDataSource.notifyListeners(CalendarDataSourceAction.add, listNew);
  }

  void updateOldInvite(InviteNewVisitor inviteNewVisitor) {
    var listTemp = utilities.updateInviteInGroupInvite(
        context, langSaved, listInvitationGroup, inviteNewVisitor);
    listInvitationGroup = listTemp;
    // Combine two list
    listVisitorInvitation[listVisitorInvitation.indexWhere((element) => element.id == inviteNewVisitor.id)] = inviteNewVisitor;
    updateScheduler = !updateScheduler;
    notifyListeners();

    invitationDataSource.source[invitationDataSource.source.indexWhere((element) => element.id == inviteNewVisitor.id)] = inviteNewVisitor;
    mapCalendarLoaded[currentMonthSelected][mapCalendarLoaded[currentMonthSelected].indexWhere((element) => element.id == inviteNewVisitor.id)] = inviteNewVisitor;
    invitationDataSource.notifyListeners(CalendarDataSourceAction.reset, invitationDataSource.source);
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context).inviteListTitle;
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  void onClickLeft(BuildContext context) {
    changeLayout();
  }

  @override
  void onClickRight(BuildContext context) {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class InvitationDataSource extends CalendarDataSource {
  InvitationDataSource(this.source, this.currentLang);
  InvitationDataSource.init();

  String currentLang;

  List<InviteNewVisitor> source = List();

  @override
  List<dynamic> get appointments => source;

  @override
  String getLocation(int index) {
    return source[index].branchName;
  }

  @override
  String getNotes(int index) {
    return source[index].description;
  }

  @override
  Color getColor(int index) {
    try {
      var colorValue = Constants.PREFIX_COLOR +
          source[index]
              .color
              .replaceAll(RegExp("[^0-9a-zA-Z]+"), "")
              .replaceAll('"', "");
      return Color(int.parse(colorValue));
    } catch (_) {
      return AppColors.DARK_BLUE_TEXT;
    }
  }

  @override
  String getSubject(int index) {
    return source[index].invitationName;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].getEndDate(currentLang);
  }

  @override
  DateTime getStartTime(int index) {
    return source[index].getStartDate(currentLang);
  }
}
