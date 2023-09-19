import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class AppTextField extends ConsumerWidget {
  final String? hintText;

  final bool isReadOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  final TextInputType? keyboardType;

  final bool obscureText;

  final String? errorMessage;

  final FocusNode? focusNode;

  final TextEditingController? controller;

  final bool enabled;

  final List<TextInputFormatter>? inputFormatters;

  final bool enableInteractiveSelection;

  final double borderRadius;

  final Color? fillColor;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  final bool isTransparentBorder;

  final Color? textColor;
  final int? minLines;
  final int? maxLines;

  final TextCapitalization textCapitalization;

  final Color? borderColor;

  final int? maxLength;

  const AppTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.keyboardType,
    this.errorMessage,
    this.controller,
    this.focusNode,
    this.borderRadius = 6.0,
    this.enabled = true,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.obscureText = false,
    this.fillColor,
    this.isTransparentBorder = false,
    this.textCapitalization = TextCapitalization.none,
    this.borderColor,
    this.textColor,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.onTap,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return CupertinoTextField(
      padding: const EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 12),
      inputFormatters: inputFormatters,
      enableInteractiveSelection: enableInteractiveSelection,
      enabled: enabled,
      textCapitalization: textCapitalization,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      minLines: minLines,
      readOnly: isReadOnly,
      onTap: onTap,
      maxLines: maxLines,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: BoxDecoration(
        color: fillColor ?? colors.boxFill,
        border: Border.all(color: borderColor ?? colors.boxStrokeColor),
        borderRadius: BorderRadius.circular(7),
      ),
      suffix: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: suffixIcon,
      ),
      placeholder: hintText,
      placeholderStyle: styles.subtitle2,
      style: TextStyle(color: colors.reversePrimary),
      // placeholderStyle: TextStyle(fontSize: 14, color: Colors.black45),
    );
  }
}
