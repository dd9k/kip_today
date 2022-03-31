import 'dart:core';

import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:table_calendar/table_calendar.dart';
import '../homeScreen/visitorLog/createInvitation/DetailEventsCalendar.dart';
import '../homeScreen/visitorLog/createInvitation/DetailEventsCalendarNotifier.dart';
import 'package:checkinpromobile/src/screens/customcalendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events = {};
  List<dynamic> _selectedEvents = [];

  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List offdays, List checkindays,
      List checkoutdays, List visitor) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  Widget calendar() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      child: TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.sunday,
        onDaySelected: _onDaySelected,
        calendarController: _calendarController,
        events: _events,
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonTextStyle: TextStyle(color: Colors.white),
          formatButtonShowsNext: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          AppLocalizations.of(context).eventCalender.toUpperCase(),
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: ListView(
        children: <Widget>[
          calendar(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
