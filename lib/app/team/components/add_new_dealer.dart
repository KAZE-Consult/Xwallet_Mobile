import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class AddNewDealer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accent),
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
            color: AppColors.accent,
            child: Text('Save Sub-dealer', style: bodyBoldLight),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
