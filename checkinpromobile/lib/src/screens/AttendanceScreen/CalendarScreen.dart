import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/screens/customcalendar/table_calendar.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/widgetUtilities/CalendarItem.dart';
import 'package:checkinpromobile/src/model/AttendanceDetailResponse.dart';
import 'CalendarNotifier.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
//import 'package:checkinpromobile/src/constants/AppStyles.dart';

class CalendarPage extends StatefulWidget {
  static const String route_name = '/calendar-page';

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<CalendarPage> {
  bool color = true;
  CalendarController calendarController;
  List<AttendanceDetail> lst;
  CalendarNotifier provider;
  bool check = false;
  AttendanceDetail item;
  DateTime initDay;
  DateTime selectDateTime;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<CalendarNotifier>(context, listen: false);
    provider.db = Provider.of<Database>(context, listen: false);
    calendarController = CalendarController();
    provider.loadData(context, callback: () {
      _onDay(DateTime.now());
    });
    initDay = DateTime.now();
    selectDateTime = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDay(DateTime date) {
    item = provider.items[date.day - 1];
    if (selectDateTime.year != DateTime.now().year ||
        (selectDateTime.month > DateTime.now().month ||
            selectDateTime.month < DateTime.now().month - 1)) {
      setState(() {
        check = false;
      });
      return;
    }
    if (item.checkin != null && item.checkout != null) {
      setState(() {
        check = true;
      });
    } else if (item.checkin != null && item.checkout == null) {
      setState(() {
        check = true;
      });
    } else {
      setState(() {
        check = false;
      });
    }
  }

  void _onDaySelected(DateTime day, List events, List offdays, List checkindays,
      List checkoutdays, List endweekday) {
    selectDateTime = day;
    _onDay(day);
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var newDate = DateTime(first.year, first.month + 1);
    initDay = newDate;
    String string = dateFormat.format(newDate);
    String items = "$string";
    provider.itemDateSelected = items;
    if (initDay.month != DateTime.now().month ||
        initDay.year != DateTime.now().year) {
      setState(() {
        check = false;
      });
    }
    if (initDay.month > DateTime.now().month ||
        initDay.year != DateTime.now().year) {
      return;
    }
    provider.postAttendanceDetail(context, items, callback: () {
      if (newDate.year == DateTime.now().year &&
          newDate.month == DateTime.now().month) {
        initDay = DateTime(first.year, first.month + 1, DateTime.now().day);
        selectDateTime = initDay;
        _onDay(DateTime.now());
      }
      if (selectDateTime.isBefore(last) && selectDateTime.isAfter(first)) {
        _onDay(selectDateTime);
      }
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Container(
      color: context.bgSliverAppBar,
      padding: EdgeInsets.fromLTRB(
          0, locator<Utilities>().paddingTopSizeHeight, 0, 0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.clear_outlined,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context).calendar.toUpperCase(),
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
        ),
        body: Selector<CalendarNotifier, bool>(
          builder: (context, isLoading, child) {
            if (isLoading) {
              return Container(
                color: context.bgSliverAppBar,
                width: double.infinity,
                height: double.infinity,
                child: new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Center(child: new CircularProgressIndicator())),
              );
            } else {
              if (provider.items == null || provider.items.length <= 0) {
                return _buildLayoutNotFound();
              }
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TableCalendar(
                      initialSelectedDay: initDay,
                      onVisibleDaysChanged: _onVisibleDaysChanged,
                      onDaySelected: _onDaySelected,
                      checkindays: provider.checkin,
                      checkoutdays: provider.checkout,
                      offdays: provider.off,
                      availableGestures: AvailableGestures.all,
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonShowsNext: false,
                      ),
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) =>
                            Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.BLUE_COLOR,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              date.day.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        todayDayBuilder: (context, date, events) => Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              date.day.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                        endweekDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                date.day.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: AppColors.NOCHECKIN_BUTTON_BG_COLOR,
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                        ),
                        checkinDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                date.day.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                    color: Colors.green[300],
                                    shape: BoxShape.circle),
                              )
                            ],
                          ),
                        ),
                        checkoutDayBuilder: (context, date, events) =>
                            Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                date.day.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.green[200],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.orange[200],
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        offDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                date.day.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: AppColors.NOCHECKIN_BUTTON_BG_COLOR,
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      calendarController: calendarController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green[300],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(AppLocalizations.of(context).checkIn),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.orange[200],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(AppLocalizations.of(context).checkOut),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor:
                                AppColors.NOCHECKIN_BUTTON_BG_COLOR,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(AppLocalizations.of(context).absent),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      child: Container(
                        child: _buildEvent(),
                      ),
                      visible: check,
                    )
                  ],
                ),
              );
            }
          },
          selector: (cx, provider) => provider.isLoading,
        ),
      ),
    );
  }

  String _convertDateStringToTime(String dateString) {
    if (dateString == null) {
      return 'không có';
    }
    DateTime date = DateTime.parse(dateString);
    String dateHour = DateFormat('HH:mm').format(date);
    return dateHour;
  }

  String _convertDateStringToTimedayOfMonth(String dateString) {
    if (dateString == null) {
      return 'không có';
    }
    DateTime date = DateTime.parse(dateString);
    String dateHour = DateFormat('dd-MM-yyyy').format(date);
    return dateHour;
  }

  Widget _buildEvent() {
    return CheckInCheckOutCalendar(
      locaton: item == null
          ? '-'
          : item.location == null
              ? '-'
              : item.location,
      dayofmonth: item == null
          ? '-'
          : item.dayOfMonth == null
              ? '-'
              : _convertDateStringToTimedayOfMonth(item.dayOfMonth),
      timecheckin: item == null
          ? '-'
          : item.checkin == null
              ? '-'
              : _convertDateStringToTime(item.checkin),
      timecheckout: item == null
          ? '-'
          : item.checkout == null
              ? '-'
              : _convertDateStringToTime(item.checkout),
    );
  }

  Widget _buildLayoutNotFound() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pic_no_data_found.png',
              cacheWidth: (857 ~/ 4) * SizeConfig.devicePixelRatio,
              cacheHeight: (781 ~/ 4) * SizeConfig.devicePixelRatio,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                AppLocalizations.of(context).noResultsFoundTitle,
                style: TextStyle(
                  fontSize: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 1.85),
                  fontFamily: AppTextStyles.tahomaFont,
                ),
              ),
            ),
            _buildBtnTryAgainRefresh()
          ],
        ),
      ),
    );
  }

  Widget _buildBtnTryAgainRefresh() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnTryAgainController,
        disable: provider.isLoading,
        btnText: AppLocalizations.of(context).tryAgainButtonTitle,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.loadData(context, callback: () {
            _onDay(DateTime.now());
          });
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
