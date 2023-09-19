import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/reuseables/date_time_picker.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  static open(BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ProfilePage(),
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
        title: Text(
          'Your Profile',
          style: bodyBold,
        ),
        actions: [
          CupertinoButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: bodyBold.copyWith(color: colors.accent),
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
                  Text('Update your personal details here', style: subtitle3)),
          const SizedBox(height: 16),
          //
          Text('First Name', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Last Name', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Email Address', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Phone Number', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          const Divider(height: 16),
          const SizedBox(height: 16),
          //
          Text('Date of Birth', style: subtitle),
          const SizedBox(height: 4),
          DateTimePicker(
            text: 'Date of birth',
            onSelect: (value) {},
          ),
          const SizedBox(height: 16),
          //
          Text('BVN', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Means of Identification', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Identification Number', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          const Divider(height: 16),
          const SizedBox(height: 16),
          //
          Text('Street Address', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Super-Sim Phone Number', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: ''),
          const SizedBox(height: 16),
          //
          Text('Select Network Operator', style: subtitle),
          const SizedBox(height: 4),
          const AppDropDownButtonField(text: 'Emma75'),
          const SizedBox(height: 16),
          //
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
