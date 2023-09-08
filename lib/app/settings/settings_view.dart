// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xwallet/app/business_details/business_details.dart';
import 'package:xwallet/app/payments/payments.dart';
import 'package:xwallet/app/profile/profile_page.dart';
import 'package:xwallet/app/team/team_view.dart';

import 'package:xwallet/utils/app_colors.dart';

import '../../utils/text_styles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsList = [
      SettingsItem(
        label: 'Business Details',
        onClick: () {
          BusinessDetails.open(context);
        },
      ),
      SettingsItem(
        label: 'Profile',
        onClick: () {
          ProfilePage.open(context);
        },
      ),
      SettingsItem(
        label: 'Team',
        onClick: () {
          TeamView.open(context);
        },
      ),
      SettingsItem(
        label: 'Payments',
        onClick: () {
          Payments.open(context);
        },
      ),
      SettingsItem(
        label: 'Customer Service',
        onClick: () {},
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Settings', style: title),
          ),
          ListTile(
            leading: const CircleAvatar(),
            title: Text('Emmanuel A.', style: body),
            trailing: const Icon(CupertinoIcons.bell),
          ),
          const Divider(indent: 16, endIndent: 16),
          const SizedBox(height: 8),
          for (int i = 0; i < settingsList.length; i++) ...[
            CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              onPressed: settingsList[i].onClick,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 8, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(settingsList[i].label, style: body),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: AppColors.grey)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class SettingsItem {
  String label;
  VoidCallback onClick;
  SettingsItem({
    required this.label,
    required this.onClick,
  });
}
