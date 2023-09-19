import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class PinField extends ConsumerWidget {
  const PinField({super.key, required this.onChanged});
  final ValueSetter<String> onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Pinput(
      defaultPinTheme: PinTheme(
        height: 70,
        width: 52,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colors.reversePrimary.withOpacity(0.1),
        ),
        textStyle: styles.tileTitle,
      ),
      onChanged: onChanged,
    );
  }
}
