// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xwallet/app/auth_wrapper/auth_wrapper.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/nav/nav_wrapper_vm.dart';
import 'package:xwallet/app/settings/settings_view.dart';
import 'package:xwallet/app/sub_dealers/sub_dealers.dart';
import 'package:xwallet/app/wallets/wallets_view.dart';

import '../../utils/app_colors.dart';
import '../home/home_view.dart';

class NavWrapper extends ConsumerStatefulWidget {
  const NavWrapper({super.key});

  @override
  ConsumerState<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends ConsumerState<NavWrapper> {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    SystemChrome.setSystemUIOverlayStyle(colors.isDarkMode
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark);
    final navVm = ref.watch(navVmProvider);
    final loggedInDealer = ref.watch(userProvider).value;
    ref.watch(sessionProvider).value;
    if (loggedInDealer == null) return const AuthWrapper();
    List<NavItem> navItems = [
      NavItem(title: 'Home', iconPath: 'assets/icons/home.svg'),
      NavItem(title: 'Wallets', iconPath: 'assets/icons/wallets.svg'),
      NavItem(title: 'Sub-dealers', iconPath: 'assets/icons/sub_dealers.svg'),
      NavItem(title: 'Settings', iconPath: 'assets/icons/settings.svg'),
    ];
    // final styles = TextStyles(ref);

    return Stack(
      children: [
        Scaffold(
          backgroundColor: colors.primary,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: navVm.onPageChanged,
            controller: navVm.pageController,
            children: const [
              HomeView(),
              WalletsView(),
              SubDealers(),
              SettingsView(),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom:
              Platform.isAndroid ? 16 : MediaQuery.of(context).padding.bottom,
          child: Material(
            elevation: 5,
            shadowColor: colors.isDarkMode ? Colors.black : Colors.black12,
            borderRadius: BorderRadius.circular(100),
            color: colors.primary,
            child: Container(
              height: 78,
              decoration: BoxDecoration(
                color: colors.isDarkMode ? colors.boxFill : colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < navItems.length; i++)
                    InkWell(
                      onTap: () {
                        navVm.goToPage(i);
                      },
                      child: SizedBox(
                        width: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              navItems[i].iconPath,
                              height: 27,
                              color: i == navVm.pageIndex
                                  ? colors.accent
                                  : colors.reversePrimary.withOpacity(0.5),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              navItems[i].title,
                              style: TextStyle(
                                  color: i == navVm.pageIndex
                                      ? colors.accent
                                      : colors.reversePrimary.withOpacity(0.5),
                                  fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const WelcomeOverlay()
      ],
    );
  }
}

class WelcomeOverlay extends ConsumerStatefulWidget {
  const WelcomeOverlay({
    super.key,
  });

  @override
  ConsumerState<WelcomeOverlay> createState() => _WelcomeOverlayState();
}

class _WelcomeOverlayState extends ConsumerState<WelcomeOverlay>
    with TickerProviderStateMixin {
  late AnimationController visibilityController;
  late AnimationController spacingController;
  late Animation dyAnimation;
  late Animation<double> spacingAnimation;
  late Animation<double> offsetAnimation;
  @override
  void initState() {
    super.initState();
    visibilityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    spacingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    dyAnimation = Tween(begin: 0.0, end: -1000.0).animate(visibilityController);
    spacingAnimation = Tween(begin: 0.0, end: 50.0).animate(spacingController);
    offsetAnimation = Tween(begin: 500.0, end: 0.0).animate(spacingController);
    visibilityController.addListener(() {
      setState(() {});
    });
    spacingController.addListener(() {
      setState(() {});
    });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      spacingController.animateTo(1, curve: Curves.ease);
      await Future.delayed(const Duration(seconds: 3));
      visibilityController.animateTo(1, curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loggedInDealer = ref.watch(userProvider).value;
    final colors = AppColors(ref);
    return Transform.translate(
      offset: Offset(0, dyAnimation.value),
      child: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Colors.pink,
            colors.accent,
          ], stops: const [
            0.3,
            1
          ]),
        ),
        child: Material(
          color: Colors.transparent,
          child: Transform.translate(
            offset: Offset(0, offsetAnimation.value),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                const Text('LOGO'),
                const SizedBox(height: 16),
                const SizedBox(height: 120, width: 120, child: Placeholder()),
                const Spacer(),
                Text(
                  'Hello ${loggedInDealer?.firstName}!👋🏽',
                  style: const TextStyle(color: Colors.white, fontSize: 34),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome back to XWallet\nWe missed you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                SizedBox(height: 50 + spacingAnimation.value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  String title;
  String iconPath;
  NavItem({
    required this.title,
    required this.iconPath,
  });
}
