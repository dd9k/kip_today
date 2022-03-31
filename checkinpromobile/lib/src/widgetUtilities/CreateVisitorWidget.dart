import 'package:flutter/material.dart';

import 'AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

// ignore: must_be_immutable
class CreateEventsWidget extends StatelessWidget {
  IconData icon;
  String text;
  TextStyle style;
  Function ontap;
  CreateEventsWidget({this.icon, this.text, this.style, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                size: 24,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                text,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EventsWidget extends StatelessWidget {
  IconData icon;
  IconData iconRight;
  String text;
  TextStyle style;
  bool countUser;
  Function ontap;
  EventsWidget({
    this.icon,
    this.text,
    this.style,
    this.ontap,
    this.iconRight,
    this.countUser,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: ontap,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    icon,
                    size: 24,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    text,
                    style: style,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    iconRight,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          countUser == true
              ? ItemUserWidget(
                  image: AssetImage('assets/images/default_avatar.png'),
                  email: 'nguyen van a',
                  name: 'A hi hi đồ chó',
                  ontap: () {},
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemUserWidget extends StatelessWidget {
  ImageProvider<Object> image;
  Function ontap;
  String name;
  String email;
  ItemUserWidget({this.image, this.name, this.email, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, top: 10),
      child: Card(
        elevation: 0,
        color: context.bgCard,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/default_avatar.png'),
                  radius: AdaptiveTextSize()
                      .getadaptiveTextSize(context, multiplier: 2.35),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        email,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.delete_forever,
                  size: 25,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DayVisitor extends StatefulWidget {
  String daystart;
  String todaystart;
  String dayend;
  String todayend;

  DayVisitor({
    this.daystart,
    this.todaystart,
    this.dayend,
    this.todayend,
  });
  @override
  _DayVisitorState createState() => _DayVisitorState();
}

class _DayVisitorState extends State<DayVisitor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.access_time,
                  size: 24,
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Start'),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                            child: Text(
                              widget.daystart,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(widget.todaystart),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Column(
                          children: [
                            Text('End'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5),
                              child: Text(
                                widget.dayend,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(widget.todayend),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
