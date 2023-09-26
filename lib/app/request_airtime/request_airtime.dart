import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class RequestAirtime extends ConsumerWidget {
  const RequestAirtime({super.key});
  static open(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const RequestAirtime();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        systemOverlayStyle: colors.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Request Airtime', style: styles.bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              'To request for airtime, fill in the information below.',
              textAlign: TextAlign.center,
              style: styles.subtitle3,
            ),
          ),
          const SizedBox(height: 16),
          Text('Available Balance: NGN250,000',
              style: body.copyWith(color: colors.accent)),
          const SizedBox(height: 16),
          const AppDropDownButtonField(text: 'Select Service Provider'),
          const SizedBox(height: 16),
          Text('Airtime amount', style: styles.subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: 'Amount'),
          const SizedBox(height: 24),
          AppButton(
            color: colors.accent,
            child: Text('Send Request', style: styles.bodyBoldLight),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
