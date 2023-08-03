
import 'package:flutter/material.dart';

enum AnimationType {
  withoutDecoration(Colors.deepPurple, BoxShape.rectangle, 0),
  withBorderRadius(Colors.lightBlue, BoxShape.rectangle, 16),
  circleShape(Colors.redAccent, BoxShape.circle, 125);

  final Color color;
  final BoxShape shape;
  final double radius;

  const AnimationType(this.color, this.shape, this.radius);
}