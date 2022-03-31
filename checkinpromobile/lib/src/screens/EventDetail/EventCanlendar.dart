import 'package:flutter/material.dart';

class EventCalendarPage extends StatefulWidget {
  static const String route_name = '/eventcalendar-page';
  @override
  _EventCalendarPageState createState() => _EventCalendarPageState();
}

class _EventCalendarPageState extends State<EventCalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.red,
      width: MediaQuery.of(context).size.width * 1 / 2,
    );
  }
}
