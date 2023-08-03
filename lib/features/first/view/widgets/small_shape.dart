import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/enum/annimation_type.dart';

class SmallShapeWidget extends StatelessWidget {
  const SmallShapeWidget({
    super.key,
    required this.onTap,
    required this.animationType,
    required this.alignment,
  });

  final AnimationType animationType;
  final VoidCallback onTap;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: alignment,
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: onTap,
        key: Key(animationType.name),

        child: SizedBox(
          child: Container(
            height: 70.r,
            width: 70.r,
            decoration: BoxDecoration(
              color: animationType.color,
              borderRadius: BorderRadius.circular(animationType.radius),
            ),
            // margin: REdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}
