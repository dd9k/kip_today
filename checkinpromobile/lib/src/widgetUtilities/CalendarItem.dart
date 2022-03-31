import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/model/AttendanceList.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Calendar extends StatelessWidget {
  final String day;
  final String totalWorkingTimeALlDay;
  final double height;
  final double heightlist;
  final int item;
  final bool isLate;
//  final bool isEnoughWorkingTime;
  List<AttendanceList> lst;
  String lang = Constants.VN_CODE;
  SharedPreferences preferences;

  Calendar(
      {this.day,
      this.height,
      this.heightlist,
      this.item,
      this.lst,
      this.totalWorkingTimeALlDay,
      this.lang,
      this.isLate,
//      this.isEnoughWorkingTime,
      this.preferences});

  @override
  Widget build(BuildContext context) {
    var isNoCheckIn = (lst?.isEmpty != false || lst[0].timeIn == null);
    var isNoCheckOut = false;
    if (lst?.isNotEmpty == true &&
        lst[0].timeIn != null &&
        lst[0].timeOut == null) {
      var now = DateTime.parse(DateFormat("yyyy-MM-dd").format(DateTime.now()));
      DateTime tempDate = DateFormat("yyyy-MM-dd").parse(lst[0].timeIn);
      if (tempDate.compareTo(now) != 0) {
        isNoCheckOut = true;
      }
    }
    var textDate = Utilities().convertDateToStringDate(
        day, context, preferences,
        isWithoutTime: true);
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //         <--- border radius here
            ),
        color: isNoCheckIn ? context.bgColorNoCheckin : context.bgCard,
      ),
      child: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        textDate,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontStyle: FontStyle.italic),
                      ),
                    ),
                    if (isLate || (!isNoCheckIn && isNoCheckOut))
                      if (isLate)
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              width: 0.5,
                              color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 2, left: 3, right: 3),
                            child: Text(
                              AppLocalizations.of(context).isLate,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                    fontSize: 9.5,
                                    color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                                  ),
                            ),
                          ),
                        ),
                    SizedBox(
                      width: 5,
                    ),
                    if (isNoCheckOut)
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              width: 0.5,
                              color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 2, left: 3, right: 3),
                          child: Text(
                            AppLocalizations.of(context).isNoOut,
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
                                      fontSize: 9.5,
                                      color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
                                    ),
                          ),
                        ),
                      ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                if (isNoCheckIn)
                  Text(
                    AppLocalizations.of(context).noCheckedin,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        height: 1.25),
                  )
                else
                  Column(
                    children: [
                      Container(
                        height: heightlist,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: item,
                            itemBuilder: (context, index) {
                              return CheckInCheckOutAttendance(
                                timecheckin: isNoCheckIn
                                    ? ''
                                    : _convertDateStringToTime(
                                        lst[index].timeIn),
                                timecheckout: isNoCheckOut
                                    ? ''
                                    : _convertDateStringToTime(
                                        lst[index].timeOut),
                                isFirst: index == 0,
                              );
                            }),
                      ),
                      if (totalWorkingTimeALlDay != '')
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            totalWorkingTimeALlDay,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: AppColors.DARK_BLUE_TEXT,
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _convertDateStringToTime(String dateString) {
  if (dateString == null) {
    return '';
  }
  DateTime date = DateTime.parse(dateString);
  String dateHour = DateFormat('HH:mm').format(date);
  return dateHour;
}

class CheckInCheckOutCalendar extends StatefulWidget {
  final String locaton;
  final String dayofmonth;
  final String timecheckin;
  final String timecheckout;

  CheckInCheckOutCalendar({
    this.locaton,
    this.dayofmonth,
    this.timecheckin,
    this.timecheckout,
  });

  @override
  _CheckInCheckOutCalendarState createState() =>
      _CheckInCheckOutCalendarState();
}

class _CheckInCheckOutCalendarState extends State<CheckInCheckOutCalendar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget.dayofmonth,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget.locaton,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Card(
              color: AppColors.CHECKIN_BUTTON_BG_COLOR,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Icon(Icons.login, color: Colors.white),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    child: Text(
                      widget.timecheckin,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              color: AppColors.CHECKOUT_BUTTON_BG_COLOR,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Icon(Icons.logout, color: Colors.white),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    child: Text(
                      widget.timecheckout,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CheckInCheckOutAttendance extends StatelessWidget {
  final String timecheckin;
  final String timecheckout;
  final bool isFirst;

  CheckInCheckOutAttendance(
      {this.timecheckin, this.timecheckout, this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Opacity(opacity: isFirst ? 1.0 : 0.0, child: AppImage.checkin),
        Container(
          width: 3,
        ),
        Text(
          timecheckin,
          style: Theme.of(context).textTheme.headline3,
        ),
        Container(
          width: 20,
        ),
        Opacity(opacity: isFirst ? 1.0 : 0.0, child: AppImage.checkout),
        Container(
          width: 3,
        ),
        Text(
          timecheckout,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
