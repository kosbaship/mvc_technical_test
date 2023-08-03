import 'package:flutter/material.dart';

import '../config_size.dart';
//todo add all param
class OSTextField extends StatelessWidget {
  const OSTextField({
    Key? key,
    this.keyboardAppearance,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.filled = true,
    this.prefixIcon,
    this.icon,
    this.suffixIcon,
    this.suffix,
    this.prefix,
    this.hintText,
    this.hintTextStyle,
    this.textStyle,
    this.labelText,
    this.contentPadding,
    this.borderColor, this.onChanged, this.controller,
  }) : super(key: key);

  final Brightness? keyboardAppearance;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final bool filled;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String? labelText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final ValueChanged<String>? onChanged;
final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: false,
      onChanged: onChanged,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: textStyle ??
          Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                decoration: TextDecoration.none,
                decorationColor: Theme.of(context).colorScheme.outline,
              ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(OSSize.brBorderTextField),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(OSSize.brBorderTextField),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(OSSize.brBorderTextField),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(OSSize.brBorderTextField),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(OSSize.brBorderTextField),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(OSSize.brBorderTextField),
        ),
        filled: filled,
        fillColor: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.05),
        contentPadding: contentPadding ?? const EdgeInsets.only(left: 20, right: 10),
        hintText: hintText,
        hintStyle: hintTextStyle ?? Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
