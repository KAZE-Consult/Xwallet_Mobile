// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/forgot_password/components/enter_email_verification.dart';
import 'package:xwallet/app/forgot_password/forgot_password_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/extensions.dart';
import 'package:xwallet/utils/helper_functions.dart';
import '../../reuseables/text_area_field.dart';
import '../../utils/text_styles.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});
  static open(BuildContext context) {
    return Navigator.push(context,
        CupertinoPageRoute(builder: (context) => const ForgotPassword()));
  }

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  bool isLoading = false;
  String username = '';
  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    final vm = ref.read(forgotPasswordNotifier.notifier);
    return Scaffold(
      backgroundColor: colors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text('LOGO'),
            const SizedBox(height: 16),
            Text('Forgot Password?', style: styles.title),
            const SizedBox(height: 12),
            Text("We'll send reset instructions to your mail",
                style: styles.subtitle2),
            const SizedBox(height: 16),
            Text('User Name', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Enter your username',
              onChanged: (val) {
                username = val;
                setState(() {});
              },
            ),
            const SizedBox(height: 32),
            AppButton(
              isEnabled: username.isNotEmpty,
              color: colors.accent,
              size: const Size(double.infinity, 45),
              child: Text('Continue', style: styles.bodyBoldLight),
              onTap: () async {
                isLoading = true;
                setState(() {});
                final isSuccess =
                    await vm.resetPassword(username, onError: (val) {
                  showSnackbar(context, val, isSuccess: false);
                });
                isLoading = false;
                setState(() {});
                if (!isSuccess) return;
                EnterEmailVerification.open(context);
              },
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Back to Sign-in", style: styles.subtitle2)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ).showLoading(isLoading);
  }
}
