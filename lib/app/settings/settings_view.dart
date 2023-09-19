// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/business_details/business_details.dart';
import 'package:xwallet/app/payments/payments.dart';
import 'package:xwallet/app/profile/profile_page.dart';
import 'package:xwallet/app/team/team_view.dart';
import 'package:xwallet/src/settings/settings_controller.dart';
import 'package:xwallet/utils/app_colors.dart';
import '../../utils/text_styles.dart';
import '../auth_wrapper/login/vm/auth_vm.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedInDealer = ref.watch(userProvider).value;
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
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
      backgroundColor: colors.primary,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Settings', style: styles.title),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 16),
              const CircleAvatar(),
              const SizedBox(width: 12),
              Text(
                '${loggedInDealer!.lastName!} ${loggedInDealer.firstName!}',
                style: styles.body.copyWith(fontSize: 20),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.bell_circle_fill,
                color: colors.accent.withOpacity(0.7),
                size: 30,
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 12),
          Divider(indent: 16, endIndent: 16, color: colors.grey),
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
                  color: colors.boxFill,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(settingsList[i].label, style: styles.body),
                    Icon(Icons.arrow_forward_ios_rounded, color: colors.grey)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 55,
              padding: const EdgeInsets.only(
                  left: 16, right: 8, top: 16, bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors.boxFill,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dark Mode', style: styles.body),
                  CupertinoSwitch(
                    activeColor: colors.accent,
                    value: colors.isDarkMode,
                    onChanged: (value) {
                      SettingsController().toggleDarkMode(val: value);
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          CupertinoButton(
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 55,
              padding: const EdgeInsets.only(
                  left: 16, right: 8, top: 16, bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors.boxFill,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Logout', style: styles.body),
                  const Icon(Icons.logout, color: Colors.red)
                ],
              ),
            ),
          ),
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
