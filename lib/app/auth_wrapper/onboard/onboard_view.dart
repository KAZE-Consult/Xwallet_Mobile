// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:xwallet/app/auth_wrapper/onboard/components/more_info.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/extensions.dart';

import 'components/enter_role.dart';
import 'vm/onboard_vm.dart';

class OnboardView extends ConsumerStatefulWidget {
  const OnboardView({super.key, required this.toLogin});

  final VoidCallback toLogin;
  @override
  ConsumerState<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends ConsumerState<OnboardView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(onboardVmProvider);
    final colors = AppColors(ref);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        elevation: 0,
        leading: _BackButton(pageController: pageController),
      ),
      backgroundColor: colors.primary,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          EnterRole(pageController: pageController, toLogin: widget.toLogin),
          MoreInfo(pageController: pageController, toLogin: widget.toLogin),
        ],
      ),
    ).showLoading(vm.isLoading);
  }
}

class _BackButton extends ConsumerStatefulWidget {
  final PageController pageController;
  const _BackButton({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  @override
  ConsumerState<_BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends ConsumerState<_BackButton> {
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    bool shouldShowBack() {
      if ((widget.pageController.page ?? 0) >= 1) return true;
      return false;
    }

    return shouldShowBack()
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: colors.reversePrimary,
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
