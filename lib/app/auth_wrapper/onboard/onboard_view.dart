// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:xwallet/app/auth_wrapper/onboard/components/more_info.dart';

import 'components/enter_role.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key, required this.toLogin});

  final VoidCallback toLogin;
  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _BackButton(pageController: pageController),
      ),
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          EnterRole(pageController: pageController),
          MoreInfo(pageController: pageController, toLogin: widget.toLogin),
        ],
      ),
    );
  }
}

class _BackButton extends StatefulWidget {
  final PageController pageController;
  const _BackButton({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  @override
  State<_BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<_BackButton> {
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    bool shouldShowBack() {
      if ((widget.pageController.page ?? 0) >= 1) return true;
      return false;
    }

    return shouldShowBack()
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
          )
        : const SizedBox();
  }
}
