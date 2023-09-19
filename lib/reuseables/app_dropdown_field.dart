// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class AppDropDownButtonField extends ConsumerWidget {
  const AppDropDownButtonField({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.onSelect,
    this.options,
    this.textStyle,
    this.arrowColor,
    this.backgroundColor,
    this.icon,
    this.optionsHeader,
    this.border,
  }) : super(key: key);
  final String text;
  final double? width;
  final VoidCallback? onPressed;
  final double? height;
  final double? borderRadius;
  final String? optionsHeader;
  final Border? border;

  ///Returns the selected in the dropdown
  final ValueSetter<AppDropDownItem?>? onSelect;

  /// style of the display text
  final TextStyle? textStyle;
  final Color? arrowColor;
  final Color? backgroundColor;
  final Widget? icon;

  ///the value of each option
  ///the toString() method of each item should return the string you want to show as an option
  final List<AppDropDownItem>? options;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
        if (onPressed != null) {
          onPressed!();
        }
        final res = await showOptions(context, optionsHeader);
        if (onSelect != null) {
          onSelect!(res);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        height: height ?? 45,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 7),
          border: Border.all(color: colors.boxStrokeColor),
          color: backgroundColor ?? colors.boxFill,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 8)],
            Text(text, style: textStyle ?? styles.subtitle2),
            const SizedBox(width: 8),
            const Spacer(),
            Icon(Icons.keyboard_arrow_down_rounded,
                color: arrowColor ?? colors.reversePrimary.withOpacity(0.5))
          ],
        ),
      ),
    );
  }

  Future<AppDropDownItem?> showOptions(
      BuildContext context, String? optionsHeader) async {
    if (options == null) return null;
    final res = await showModalBottomSheet<AppDropDownItem>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return OptionsModal(options: options!, optionsHeader: optionsHeader);
      },
    );
    return res;
  }
}

class OptionsModal extends ConsumerWidget {
  const OptionsModal({
    Key? key,
    required this.options,
    this.optionsHeader,
  }) : super(key: key);
  final List<AppDropDownItem> options;
  final String? optionsHeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        color: colors.primary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (optionsHeader != null) ...[
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(optionsHeader!, style: styles.title),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.clear,
                        size: 30,
                        color: colors.reversePrimary.withOpacity(0.4),
                      ),
                    )
                  ],
                ),
              ),
            ],
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                separatorBuilder: (context, index) => Divider(
                  color: colors.reversePrimary.withOpacity(0.1),
                ),
                itemBuilder: (context, index) {
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context, options[index]);
                    },
                    child: Container(
                      color: colors.primary,
                      child: ListTile(
                        tileColor: colors.primary,
                        leading: options[index].icon,
                        title: options[index].title,
                        subtitle: options[index].subtitle,
                        trailing: options[index].trailing,
                      ),
                    ),
                  );
                },
                itemCount: options.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDropDownItem {
  Widget? icon;
  Text title;
  Text? subtitle;
  Widget? trailing;
  AppDropDownItem({
    this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
  });
}
