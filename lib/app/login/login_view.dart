import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xwallet/app/onboard/onboard_view.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/text_styles.dart';

import '../../utils/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (_, a, a2) {
        return const LoginView();
      },
    );
  }

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Back!', style: title),
            const SizedBox(height: 12),
            Text('Enter your Login details', style: subtitle2),
            const SizedBox(height: 16),
            Text('Username', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your username',
            ),
            const SizedBox(height: 16),
            Text('Password', style: subtitle),
            const SizedBox(height: 4),
            AppTextField(
              obscureText: obscurePassword,
              hintText: 'Enter your password',
              suffixIcon: GestureDetector(
                onTap: () {
                  obscurePassword = !obscurePassword;
                  setState(() {});
                },
                child: Icon(
                  obscurePassword
                      ? Icons.remove_red_eye
                      : CupertinoIcons.eye_slash,
                  color: Colors.black45,
                ),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password',
                style: subtitle.copyWith(color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 32),
            AppButton(
              color: AppColors.accent,
              size: const Size(double.infinity, 45),
              child: const Text('Submit'),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: subtitle2),
                  Text(
                    "Sign Up",
                    style: subtitle2.copyWith(color: AppColors.accent),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushReplacement(context, OnboardView.route());
              },
            )
          ],
        ),
      ),
    );
  }
}
