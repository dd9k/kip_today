

import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.height: 60.0,
    this.iconSize: 30.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  Function onOptionClicked;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  int currentIndex = 0;
  int previousIndex;
  List<int> flexValues = [100, 100, 100, 100];
  List<double> opacityValues = [1.0, 0.0, 0.0, 0.0];
  List<double> fractionalOffsetValues = [0.0, 0.0, 0.0, 0.0];
  List<double> verticalShiftValues = [-4.0, 8.0, 8.0, 8.0];
  List<double> skewValues = [0.0, 0.0, 0.0, 0.0];
  AnimationController _controller;
  Animation animation;
  Animation skewFirstHalfAnimation;
  Animation skewSecondHalfAnimation;
  Animation translationFirstHalfAnimation;
  Animation translationSecondHalfAnimation;
  Animation opacityFirstHalfAnimation;
  Animation opacitySecondHalfAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));
    translationFirstHalfAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.85, curve: Curves.easeIn),
            parent: _controller));
    translationSecondHalfAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
        curve: Interval(0.15, 1.0, curve: Curves.easeOut),
        parent: _controller));
    opacityFirstHalfAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.50, curve: Curves.easeIn),
            parent: _controller));
    opacitySecondHalfAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            curve: Interval(0.50, 1.0, curve: Curves.easeOut),
            parent: _controller));
    skewFirstHalfAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.3, curve: Curves.easeIn),
            parent: _controller));
    skewSecondHalfAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
        CurvedAnimation(
            curve: Interval(0.7, 1.0, curve: Curves.easeOut),
            parent: _controller));

    animation.addListener(() {
      setState(() {
//        flexValues[previousIndex] = 100 - (50 * animation.value).toInt();
//        flexValues[currentIndex] = 100 + (50 * animation.value).toInt();
        opacityValues[previousIndex] = 1.0 - opacityFirstHalfAnimation.value;
        opacityValues[currentIndex] = 0.0 + opacitySecondHalfAnimation.value;
        verticalShiftValues[currentIndex] = 8 - (12 * animation.value);
        verticalShiftValues[previousIndex] = -4 + (12 * animation.value);
        if (currentIndex > previousIndex) {
          fractionalOffsetValues[currentIndex] =
              -1 + translationSecondHalfAnimation.value;
          fractionalOffsetValues[previousIndex] =
              translationFirstHalfAnimation.value;
          skewValues[currentIndex] =
              skewFirstHalfAnimation.value - skewSecondHalfAnimation.value;
          skewValues[previousIndex] =
              -skewFirstHalfAnimation.value + skewSecondHalfAnimation.value;
        } else if (currentIndex < previousIndex) {
          fractionalOffsetValues[currentIndex] =
              1 - translationSecondHalfAnimation.value;
          fractionalOffsetValues[previousIndex] =
          -translationFirstHalfAnimation.value;
          skewValues[currentIndex] =
              -skewFirstHalfAnimation.value + skewSecondHalfAnimation.value;
          skewValues[previousIndex] =
              skewFirstHalfAnimation.value - skewSecondHalfAnimation.value;
        }
      });
    });
  }

  _updateIndex(int index) {
  widget.onTabSelected(index);
  onOptionClicked(pressedIndex: index);
  }

  onOptionClicked({@required int pressedIndex}) {
    if (pressedIndex != currentIndex) {
      _selectedIndex = pressedIndex;
      previousIndex = currentIndex;
      currentIndex = pressedIndex;
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());
    widget.onOptionClicked = onOptionClicked;
    return BottomAppBar(
      shape: widget.notchedShape,
      child: Container(
        width: double.infinity,
        height: 56.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: items,
        ),
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = isSelected(index) ? widget.selectedColor : widget.color;
    return Flexible(
      fit: FlexFit.tight,
      flex: flexValues[index],
      child: FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        clipBehavior: Clip.none,
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          _updateIndex(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform.translate(
              offset: Offset(0.0, verticalShiftValues[index]),
              child: Transform(
                transform: Matrix4.skewY(skewValues[index]),
                child: Icon(
                  item.iconData,
                  size: widget.iconSize,
                  color: color,
                ),
              ),
            ),
            ClipRect(
              child: FractionalTranslation(
                translation: Offset(fractionalOffsetValues[index], 0.0),
                child: Opacity(
                    opacity: opacityValues[index],
                    child: Center(
                      child: Text(
                        item.text,
                        style: AppTextStyles.textBottomBarSelected,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isSelected(int index) => _selectedIndex == index;
}
