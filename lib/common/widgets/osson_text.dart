import 'package:flutter/material.dart';
//todo add all param
class OSText extends StatelessWidget {
  const OSText(this.text, {Key? key, this.style, this.textAlign}) : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
