import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:score_board/utils/colors.dart';

class LabelTriangle extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final Widget child;
  final bool visible;
  final Function onTap;

  const LabelTriangle({
    Key key,
    this.color = AppColors.black,
    this.height = 60,
    this.width = 60,
    @required this.child,
    this.onTap,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: InkWell(
        onTap: onTap,
        child: CustomPaint(
          painter: _ShapesPainter(color),
          child: Container(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0, right: 28, bottom: 4.0, left: 4.0),
              child: Center(
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: child
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShapesPainter extends CustomPainter {
  final Color color;
  _ShapesPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    var path = Path();
    path.lineTo(0, size.width);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
