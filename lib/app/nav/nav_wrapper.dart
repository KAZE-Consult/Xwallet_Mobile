// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xwallet/app/auth_wrapper/auth_wrapper.dart';
import 'package:xwallet/app/auth_wrapper/login/login_view.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/nav/nav_wrapper_vm.dart';
import 'package:xwallet/app/auth_wrapper/onboard/onboard_view.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final navVm = ref.watch(navVmProvider);
    final user = ref.watch(userProvider).value;
    if (user == null) return const AuthWrapper();
    List<NavItem> navItems = [
      NavItem(title: 'Home', iconPath: 'assets/icons/home.svg'),
      NavItem(title: 'Wallets', iconPath: 'assets/icons/wallets.svg'),
      NavItem(title: 'Sub-dealers', iconPath: 'assets/icons/sub_dealers.svg'),
      NavItem(title: 'Settings', iconPath: 'assets/icons/settings.svg'),
    ];
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[100],
          body: PageView(
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
            shadowColor: Colors.black12,
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            child: Container(
              height: 78,
              decoration: BoxDecoration(
                color: Colors.white,
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
                                    ? AppColors.accent
                                    : Colors.black45,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                navItems[i].title,
                                style: TextStyle(
                                    color: i == navVm.pageIndex
                                        ? AppColors.accent
                                        : Colors.black45,
                                    fontSize: 10),
                              )
                            ],
                          ),
                        )),
                ],
              ),
            ),
          ),
        ),
      ],
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
