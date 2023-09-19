import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/onboard/vm/onboard_vm.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import '../../../../reuseables/app_button.dart';
import '../../../../reuseables/text_area_field.dart';
import '../../../../utils/helper_functions.dart';
import '../../../../utils/text_styles.dart';

class EnterRole extends ConsumerWidget {
  const EnterRole(
      {required this.toLogin, super.key, required this.pageController});
  final VoidCallback toLogin;

  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(onboardVmProvider);
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text("Your personal details.", style: styles.title),
          const SizedBox(height: 12),
          Text(
            'Glad to have you. Tell us a bit about yourself.',
            style: styles.subtitle2,
          ),
          const SizedBox(height: 16),
          //
          Text('First Name', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            hintText: 'Enter your first name',
            onChanged: vm.setFirstName,
          ),
          const SizedBox(height: 16),
          //
          Text('Last Name', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            hintText: 'Enter your last name',
            onChanged: vm.setLastName,
          ),
          const SizedBox(height: 16),
          //
          Text('Email Address', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            hintText: 'Enter your email address',
            onChanged: vm.setEmailAddress,
          ),
          const SizedBox(height: 16),
          //
          Text('Role', style: styles.subtitle),
          const SizedBox(height: 4),
          AppDropDownButtonField(
            text: getRoleString(vm.onboardInput.roleId) ?? 'Select Role',
            onSelect: (v) {
              vm.selectRole(getRoleId(v?.title.data));
            },
            optionsHeader: 'Select Role',
            options: [
              AppDropDownItem(title: Text('Dealer', style: styles.body)),
              AppDropDownItem(title: Text('Subdealer', style: styles.body)),
              AppDropDownItem(title: Text('Retailer', style: styles.body)),
            ],
          ),
          const SizedBox(height: 24),
          AppButton(
            color: colors.accent,
            size: const Size(double.infinity, 45),
            child: Text('Continue', style: bodyBoldLight),
            onTap: () {
              if (!vm.validatePage1()) return;
              pageController.nextPage(
                  duration: const Duration(milliseconds: 650),
                  curve: Curves.ease);
            },
          ),
          const SizedBox(height: 8),
          CupertinoButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: styles.subtitle2),
                Text(
                  "Login",
                  style: styles.subtitle2.copyWith(color: colors.accent),
                ),
              ],
            ),
            onPressed: () {
              toLogin();
            },
          )
        ],
      ),
    );
  }
}
