import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/forgot_password/forgot_password.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/src/settings/settings_controller.dart';
import 'package:xwallet/utils/extensions.dart';
import 'package:xwallet/utils/text_styles.dart';

import '../../../utils/app_colors.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({
    required this.toOnboard,
    super.key,
  });
  final VoidCallback toOnboard;

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  String userName = '';
  String password = '';
  bool obscurePassword = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final authVm = AuthVm();
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text('LOGO'),
            const SizedBox(height: 16),
            Text('Welcome Back!', style: styles.title),
            const SizedBox(height: 16),
            Text('Enter your Login details', style: styles.subtitle2),
            const SizedBox(height: 16),
            Text('Username', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              onChanged: (val) {
                userName = val;
              },
              hintText: 'Enter your username',
            ),
            const SizedBox(height: 16),
            Text('Password', style: styles.subtitle),
            const SizedBox(height: 4),
            AppTextField(
              obscureText: obscurePassword,
              hintText: 'Enter your password',
              onChanged: (val) {
                password = val;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  obscurePassword = !obscurePassword;
                  setState(() {});
                },
                child: Icon(
                  obscurePassword
                      ? Icons.remove_red_eye
                      : CupertinoIcons.eye_slash,
                  color: colors.reversePrimary.withOpacity(0.5),
                ),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  ForgotPassword.open(context);
                },
                child: Text(
                  'Forgot Password',
                  style: subtitle.copyWith(color: colors.accent),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              color: colors.accent,
              size: const Size(double.infinity, 45),
              child: Text('Submit', style: bodyBoldLight),
              onTap: () async {
                if (userName.isEmpty || password.isEmpty) return;
                isLoading = true;
                setState(() {});
                await authVm.login(userName, password);
                isLoading = false;
                setState(() {});
              },
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: styles.subtitle2),
                  Text(
                    "Sign Up",
                    style: subtitle2.copyWith(color: colors.accent),
                  ),
                ],
              ),
              onPressed: () {
                widget.toOnboard();
              },
            )
          ],
        ),
      ),
    ).showLoading(isLoading);
  }
}
