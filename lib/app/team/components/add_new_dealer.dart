import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class AddNewDealer extends ConsumerWidget {
  const AddNewDealer({super.key});
  static open(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const AddNewDealer();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Add new Dealer rep', style: bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              'To add a new sub-dealer, fill in the information below.',
              textAlign: TextAlign.center,
              style: subtitle3,
            ),
          ),
          const SizedBox(height: 16),
          //
          Text('First name', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Last name', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Email', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          const SizedBox(height: 24),
          AppButton(
            color: colors.accent,
            child: Text('Save Sub-dealer', style: bodyBoldLight),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
