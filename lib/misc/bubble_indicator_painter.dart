import 'dart:math';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class BubbleIndicatorPainter extends CustomPainter {
  final Paint painter;

  final double dxTarget;

  final double dxEntry;

  final double radius;

  final double dy;

  final PageController pageController;

  BubbleIndicatorPainter({
    this.dxTarget = 160,
    this.dxEntry = 19,
    this.radius = 19,
    this.dy = 19,
    required this.pageController,
  })  : painter = Paint()
          ..color = AppColors.primaryLight
          ..style = PaintingStyle.fill,
        super(repaint: pageController);

  @override
  void paint(Canvas canvas, Size size) {
    final entry = Offset(dxEntry, dy);
    final target = Offset(dxTarget, dy);

    final path = Path();

    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));

    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, pi);

    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, pi);

    final pos = pageController.position;

    final fullExtent =
        pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension;

    final pageOffset = pos.extentBefore / fullExtent;

    canvas.translate(size.width * pageOffset, 0);

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
