import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//todo add all param
class OSFilledButton extends StatelessWidget {
  const OSFilledButton({Key? key, required this.onPressed, required this.child}) : super(key: key);
  final VoidCallback onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 45.h, child: FilledButton(onPressed: onPressed, child: child));
  }
}
