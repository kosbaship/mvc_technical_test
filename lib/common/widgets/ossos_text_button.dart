import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//todo add all param
class OSTextButton extends StatelessWidget {
  const OSTextButton({Key? key, required this.label, required this.onPressed, this.icon, this.style}) : super(key: key);

  final Widget label;

  final VoidCallback onPressed;

  final Widget? icon;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? SizedBox(
            height: 45.h,
            child: TextButton.icon(
              style: style,
              onPressed: onPressed,
              icon: icon!,
              label: label,
            ),
          )
        : SizedBox(
            height: 45.h,
            child: TextButton(style: style, onPressed: onPressed, child: label),
          );
  }
}
