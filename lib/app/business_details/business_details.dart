import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});
  static open(BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const BusinessDetails(),
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
        title: Text(
          'Business Details',
          style: bodyBold,
        ),
        actions: [
          CupertinoButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: bodyBold.copyWith(color: AppColors.accent),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
              child:
                  Text('Update your business details here', style: subtitle3)),
          const SizedBox(height: 16),
          Text('Business Name', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          Text('Street Address', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          Text('Local Government', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          Text('City', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
        ],
      ),
    );
  }
}
