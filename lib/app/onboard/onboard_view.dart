import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xwallet/app/login/login_view.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';

import '../../reuseables/app_button.dart';
import '../../reuseables/text_area_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (_, a, a2) {
        return const OnboardView();
      },
    );
  }

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
            Text("Let's get started.", style: title),
            const SizedBox(height: 12),
            Text(
              'Please input some details about your business.',
              style: subtitle2,
            ),
            const SizedBox(height: 16),
            Text('First Name', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your first name',
            ),
            const SizedBox(height: 16),
            Text('Last Name', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your last name',
            ),
            const SizedBox(height: 16),
            Text('Email Address', style: subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter your email address',
            ),
            const SizedBox(height: 16),
            Text('Role', style: subtitle),
            const SizedBox(height: 4),
            const AppDropDownButtonField(text: 'Select Role'),
            const SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'By Continuing, you agree to our ',
                style: subtitle3,
                children: [
                  WidgetSpan(
                    child: termsLink(),
                  ),
                  const TextSpan(text: ' and '),
                  WidgetSpan(
                    child: privacyPolicyLink(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              color: AppColors.accent,
              size: const Size(double.infinity, 45),
              child: const Text('Continue'),
              onTap: () {},
            ),
            const SizedBox(height: 16),
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
                Navigator.pushReplacement(context, LoginView.route());
              },
            )
          ],
        ),
      ),
    );
  }
}

GestureDetector termsLink() {
  final Uri tosLink = Uri.parse('');
  return GestureDetector(
    child: const Text(
      'Terms & Conditions',
      style: TextStyle(color: Colors.blueAccent, fontSize: 14),
    ),
    onTap: () {
      // launchUrl(tosLink);
    },
  );
}

GestureDetector privacyPolicyLink() {
  final Uri privacyPolicyUrl = Uri.parse('');
  return GestureDetector(
    child: const Text(
      'Data Privacy Policy.',
      style: TextStyle(color: Colors.blueAccent, fontSize: 14),
    ),
    onTap: () {
      // launchUrl(privacyPolicyUrl);
    },
  );
}
