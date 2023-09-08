import 'package:flutter/material.dart';
import 'package:xwallet/app/auth_wrapper/login/login_view.dart';
import 'package:xwallet/app/auth_wrapper/onboard/onboard_view.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  PageController pageController = PageController();
  toLogin() {
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  toOnboard() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        LoginView(toOnboard: toOnboard),
        OnboardView(toLogin: toLogin)
      ],
    );
  }
}
