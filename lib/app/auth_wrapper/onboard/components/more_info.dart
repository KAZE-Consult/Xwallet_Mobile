// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/auth_wrapper/onboard/components/enter_otp.dart';
import 'package:xwallet/app/auth_wrapper/onboard/vm/onboard_vm.dart';
import 'package:xwallet/model/telco_model.dart';
import 'package:xwallet/reuseables/telco_icon.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/enums.dart';
import '../../../../reuseables/app_button.dart';
import '../../../../reuseables/app_dropdown_field.dart';
import '../../../../reuseables/text_area_field.dart';
import '../../../../utils/text_styles.dart';

class MoreInfo extends ConsumerStatefulWidget {
  const MoreInfo({
    super.key,
    required this.pageController,
    required this.toLogin,
  });
  final VoidCallback toLogin;

  final PageController pageController;

  @override
  ConsumerState<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends ConsumerState<MoreInfo> {
  TelcoModel? selectedTelco;
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(onboardVmProvider);
    final isDealer = vm.onboardInput.roleId == 1;
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
          if (isDealer) ...[
            //
            Text('Select Network Operator', style: styles.subtitle),
            const SizedBox(height: 4),
            AppDropDownButtonField(
              text: selectedTelco?.title ?? 'Select network operator',
              icon: TelcoIcon(id: selectedTelco?.id),
              options: Telco.values
                  .map(
                    (e) => AppDropDownItem(
                      title: Text(e.toString(), style: styles.body),
                    ),
                  )
                  .toList(),
              onSelect: (value) {
                selectedTelco = getTecloByTitle(value?.title.data);
                vm.setServiceProvider(selectedTelco?.id);
              },
            ),
            const SizedBox(height: 16),
            //
            Text('Super-Sim Phone Number', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Enter your Super-Sim Phone Number',
              onChanged: vm.setSuperSimPhoneNo,
              keyboardType: TextInputType.number,
              maxLength: 11,
            ),
            const SizedBox(height: 16),
            //
            Text('Username', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Enter your Username',
              onChanged: vm.setUserName,
            ),
            const SizedBox(height: 16),
            //
            Text('Password', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Enter your Password',
              onChanged: vm.setPassword,
              obscureText: true,
              maxLines: 1,
            ),
            const SizedBox(height: 16),
          ]
          // if is not dealer
          else ...[
            Text('Personal Phone Number', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Enter your Phone Number',
              onChanged: vm.setPersonalPhoneNo,
              maxLength: 11,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            //
            Text('Username', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Enter your Username',
              onChanged: vm.setUserName,
            ),
            const SizedBox(height: 16),
            //
            Text('Password', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Enter your Password',
              onChanged: vm.setPassword,
            ),
            const SizedBox(height: 16),
          ],
          const SizedBox(height: 24),
          AppButton(
            color: colors.accent,
            size: const Size(double.infinity, 45),
            child: Text('Continue', style: bodyBoldLight),
            onTap: () async {
              if (!vm.validatePage2(isDealer)) return;
              vm.setIsLoading(true);
              final isSuccess = await AuthVm().signUp(
                vm.onboardInput,
                onError: (err) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(err)),
                  );
                },
              );
              vm.setIsLoading(false);
              //send otp screen
              if (!isSuccess) return;
              await EnterOtp.open(context);
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
                  style: subtitle2.copyWith(color: colors.accent),
                ),
              ],
            ),
            onPressed: () {
              widget.toLogin();
            },
          )
        ],
      ),
    );
  }
}
