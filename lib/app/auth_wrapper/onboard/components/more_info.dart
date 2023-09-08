import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/auth_wrapper/onboard/vm/onboard_vm.dart';

import '../../../../reuseables/app_button.dart';
import '../../../../reuseables/app_dropdown_field.dart';
import '../../../../reuseables/text_area_field.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/text_styles.dart';

class MoreInfo extends ConsumerWidget {
  const MoreInfo({
    super.key,
    required this.pageController,
    required this.toLogin,
  });
  final VoidCallback toLogin;

  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(onboardVmProvider);
    final isDealer = vm.selectedRole == 'Dealer';
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
          if (isDealer) ...[
            //
            Text('Select Network Operator', style: subtitle),
            const SizedBox(height: 4),
            const AppDropDownButtonField(
              text: 'Select network operator',
            ),
            const SizedBox(height: 16),
            //
            Text('Super-Sim Phone Number', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your Super-Sim Phone Number',
            ),
            const SizedBox(height: 16),
            //
            Text('Username', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your Username',
            ),
            const SizedBox(height: 16),
            //
            Text('Password', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your Password',
            ),
            const SizedBox(height: 16),
          ]
          // if is not dealer
          else ...[
            Text('Personal Phone Number', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your Phone Number',
            ),
            const SizedBox(height: 16),
            //
            Text('Username', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your Username',
            ),
            const SizedBox(height: 16),
            //
            Text('Password', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your Password',
            ),
            const SizedBox(height: 16),
          ],
          const SizedBox(height: 24),
          AppButton(
            color: AppColors.accent,
            size: const Size(double.infinity, 45),
            child: Text('Continue', style: bodyBoldLight),
            onTap: () {
              // pageController.nextPage(
              //     duration: const Duration(milliseconds: 650),
              //     curve: Curves.ease);
              AuthVm().login('userName', 'password');
            },
          ),
          CupertinoButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: subtitle2),
                Text(
                  "Login",
                  style: subtitle2.copyWith(color: AppColors.accent),
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
