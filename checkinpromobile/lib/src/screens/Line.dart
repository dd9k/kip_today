import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  Paint _paint;
  double _progress;
  Color _color;

  LinePainter(this._progress, this._color) {
    _paint = Paint()
      ..color = _color
      ..strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0.0, 0.0), Offset(size.width * _progress, 0), _paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}

// ignore: must_be_immutable
class LineAnimation extends StatefulWidget {
  final bool isAnimation;
  final double progress;
  final Color color;
  LineAnimation(
      {Key key,
      @required this.isAnimation,
      this.progress = 1,
      this.color = const Color(0xFFEBEBEA)})
      : super(key: key);

  @override
  LineAnimationState createState() {
    return LineAnimationState();
  }
}

// ignore: unused_element
class LineAnimationState extends State<LineAnimation>
    with SingleTickerProviderStateMixin {
  double _progress = 0; // zero to one

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
  }

  void animated(double progress, {Function onCompleteAnimation}) {
    var controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    // Setup animation
    Animation<double> animation;
    animation = Tween(begin: widget.isAnimation ? 0.0 : 1.0, end: progress)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {
              _progress = animation.value;
            });
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              // ignore: unnecessary_statements
              onCompleteAnimation();
            }
          });
    // Start animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: CustomPaint(painter: LinePainter(_progress, widget.color)));
  }
}
