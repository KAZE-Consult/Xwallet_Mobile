import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker(
      {Key? key,
      this.type,
      required this.text,
      this.enabled = true,
      required this.onSelect,
      this.initialDate})
      : super(key: key);
  final DateTimePickerType? type;
  final bool enabled;
  final String text;
  final ValueChanged<DateTime?> onSelect;
  final DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: false,
          enableDrag: false,
          backgroundColor: Colors.transparent,
          builder: (_) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            height: 350,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.light,
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDate,
                onDateTimeChanged: (value) {
                  onSelect(value);
                },
              ),
            ),
          ),
        );
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: enabled ? 1 : 0.6,
        child: Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.boxFill,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: AppColors.boxStrokeColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(text, style: subtitle),
              const Spacer(),
              const Icon(CupertinoIcons.calendar, color: Colors.black45),
            ],
          ),
        ),
      ),
    );
  }
}

enum DateTimePickerType { date, dateTime }
