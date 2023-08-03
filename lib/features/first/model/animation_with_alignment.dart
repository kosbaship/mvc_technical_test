import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../common/enum/annimation_type.dart';

class AnimationWithAlignment extends Equatable  {
  final AnimationType animationType;
  final Alignment alignment;

  AnimationWithAlignment({required this.animationType, required this.alignment});

  AnimationWithAlignment copyWith({Alignment? alignment}) => AnimationWithAlignment(
        animationType: animationType,
        alignment: alignment ?? this.alignment,
      );



  @override
  String toString() {
    return "animationType : ${animationType.name} , alignment : ${alignment.toString()}";
  }

  @override
  List<Object?> get props => [alignment , animationType];
}
