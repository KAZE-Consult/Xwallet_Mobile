import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/forgot_password/components/enter_email_verification.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/utils/app_colors.dart';
import '../../reuseables/text_area_field.dart';
import '../../utils/text_styles.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});
  static open(BuildContext context) {
    return Navigator.push(context,
        CupertinoPageRoute(builder: (context) => const ForgotPassword()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text('LOGO'),
            const SizedBox(height: 16),
            Text('Forgot Password?', style: title),
            const SizedBox(height: 12),
            Text("We'll send reset instructions to your mail",
                style: subtitle2),
            const SizedBox(height: 16),
            Text('Email', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your mail',
            ),
            const SizedBox(height: 32),
            AppButton(
              color: colors.accent,
              size: const Size(double.infinity, 45),
              child: Text('Continue', style: bodyBoldLight),
              onTap: () {
                EnterEmailVerification.open(context);
              },
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Back to Sign-in", style: subtitle2)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
