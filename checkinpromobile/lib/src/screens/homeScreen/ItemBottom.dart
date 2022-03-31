import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/model/ChoiceValue.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// tab config used in example
class ItemBottom {
  static const gradients = [
    null,
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, Colors.redAccent, Colors.green, Colors.blue],
      tileMode: TileMode.repeated,
    ),
    LinearGradient(
      begin: Alignment.center,
      end: Alignment(-1, 1),
      colors: [Colors.redAccent, Colors.green, Colors.blue],
      tileMode: TileMode.repeated,
    ),
    RadialGradient(
      center: const Alignment(0, 0), // near the top right
      radius: 5,
      colors: [Colors.green, Colors.blue, Colors.redAccent],
    )
  ];

  static const curves = [
    ChoiceValue<Curve>(
      title: 'Curves.bounceInOut',
      label: 'The curve bounceInOut is used',
      value: Curves.bounceInOut,
    ),
    ChoiceValue<Curve>(
      title: 'Curves.decelerate',
      value: Curves.decelerate,
      label: 'The curve decelerate is used',
    ),
    ChoiceValue<Curve>(
      title: 'Curves.easeInOut',
      value: Curves.easeInOut,
      label: 'The curve easeInOut is used',
    ),
    ChoiceValue<Curve>(
      title: 'Curves.fastOutSlowIn',
      value: Curves.fastOutSlowIn,
      label: 'The curve fastOutSlowIn is used',
    ),
  ];

  static List<TabItem> items({bool image}) {
    if (image) {
      return [
        TabItem<Image>(
          icon: AppImage.home,
          activeIcon: AppImage.homeActive,
          title: 'Home',
        ),
        TabItem<Image>(
          icon: AppImage.people,
          activeIcon: AppImage.peopleActive,
          title: 'Visitor',
        ),
        TabItem<FlareActor>(
          icon: AppImage.scanQR,
          activeIcon: AppImage.scanQR,
          title: 'Scan',
        ),
        TabItem<Image>(
          icon: AppImage.history,
          activeIcon: AppImage.historyActive,
          title: 'Close',
        ),
        TabItem<Image>(
          icon: AppImage.tabMenuProfile,
          activeIcon: AppImage.tabMenuProfileActive,
          title: 'Profile',
        ),
      ];
    }
    return [
      TabItem<IconData>(icon: Icons.home, title: 'Home'),
      TabItem<IconData>(icon: Icons.people, title: "Visitor"),
      TabItem<IconData>(icon: Icons.code, title: "Scan"),
      TabItem<IconData>(icon: Icons.history, title: 'History'),
      TabItem<IconData>(icon: Icons.settings, title: 'Profile'),
    ];
  }
}
