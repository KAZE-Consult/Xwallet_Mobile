import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/onboard/vm/onboard_vm.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import '../../../../reuseables/app_button.dart';
import '../../../../reuseables/text_area_field.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/text_styles.dart';

class EnterRole extends ConsumerWidget {
  const EnterRole({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(onboardVmProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          Text("Your personal details.", style: title),
          const SizedBox(height: 12),
          Text(
            'Glad to have you. Tell us a bit about yourself.',
            style: subtitle2,
          ),
          const SizedBox(height: 16),
          //
          Text('First Name', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(
            hintText: 'Enter your first name',
          ),
          const SizedBox(height: 16),
          //
          Text('Last Name', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(
            hintText: 'Enter your last name',
          ),
          const SizedBox(height: 16),
          //
          Text('Email Address', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(
            hintText: 'Enter your email address',
          ),
          const SizedBox(height: 16),
          //
          Text('Role', style: subtitle),
          const SizedBox(height: 4),
          AppDropDownButtonField(
            text: vm.selectedRole ?? 'Select Role',
            onSelect: (v) {
              vm.selectRole(v?.title.data);
            },
            optionsHeader: 'Select Role',
            options: [
              AppDropDownItem(title: const Text('Others')),
              AppDropDownItem(title: const Text('Dealer')),
            ],
          ),
          const SizedBox(height: 24),
          AppButton(
            color: AppColors.accent,
            size: const Size(double.infinity, 45),
            child: Text('Continue', style: bodyBoldLight),
            onTap: () {
              if (vm.selectedRole == null) return;
              pageController.nextPage(
                  duration: const Duration(milliseconds: 650),
                  curve: Curves.ease);
            },
          ),
        ],
      ),
    );
  }
}
