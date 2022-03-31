import 'package:checkinpromobile/src/screens/scanQR/ScanQRScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:flutter/material.dart';

class FabWithIcon extends StatefulWidget {
  FabWithIcon({this.index, this.onPress, this.child});
  final int index;
  final Function onPress;
  final Widget child;
  @override
  State createState() => FabWithIconState();
}

class FabWithIconState extends State<FabWithIcon> {
  bool _show = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        {
          return FloatingActionButton(
            onPressed: () {
              AppRouter.pushTo(context, ScanQRScreen.route_name);
            },
            heroTag: null,
            child: Icon(Icons.code),
            elevation: 2.0,
          );
        }
      case 1:
        {
          return _show
              ? FloatingActionButton(
                  child: Icon(Icons.add),
                  elevation: 2.0,
                  heroTag: null,
                  onPressed: () {
                    var sheetController = showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18.0),
                              topLeft: Radius.circular(18.0)),
                        ),
                        context: context,
                        builder: (context) => widget.child);

                    _showButton(false);

                    sheetController.then((value) => _showButton(true));
                  },
                )
              : Container();
        }
    }
    return FloatingActionButton(
      onPressed: null,
      heroTag: null,
      child: Icon(Icons.code),
      elevation: 2.0,
    );
  }

  void _showButton(bool value) {
    setState(() {
      _show = value;
    });
  }
}
