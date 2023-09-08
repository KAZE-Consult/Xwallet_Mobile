import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../reuseables/app_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';

class WalletsView extends StatefulWidget {
  const WalletsView({super.key});

  @override
  State<WalletsView> createState() => _WalletsViewState();
}

class _WalletsViewState extends State<WalletsView>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Wallets', style: title),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Manage your wallets here', style: subtitle2),
          ),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Balance', style: body),
                const SizedBox(height: 12),
                Text('NGN 80,128', style: smallTitle),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        color: AppColors.accent.withOpacity(0.1),
                        child: const Text(
                          'Withdraw',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppButton(
                        color: AppColors.accent,
                        child: const Text(
                          'Fund',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Telco Wallets', style: body),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.boxFill,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.boxStrokeColor),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.abc),
                    Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.black12),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('980GB', style: bodyBold),
                            const SizedBox(height: 4),
                            Text('Data balance', style: subtitle),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.black12),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('NGN 157,000', style: bodyBold),
                            const SizedBox(height: 4),
                            Text('Airtime balance', style: subtitle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AppButton(
                  size: const Size(double.infinity, 50),
                  color: AppColors.accent,
                  child: Text('Restock', style: bodyBoldLight),
                  onTap: () {},
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: subtitle),
                Text(
                  'See All',
                  style: subtitle.copyWith(color: AppColors.accent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: AppColors.accent,
              unselectedLabelStyle: subtitle,
              tabs: [
                Tab(child: Text('Airtime', style: subtitle)),
                Tab(child: Text('Data', style: subtitle)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < 5; i++) ...[
            ListTile(
              title: Text('Emmanuel Abu-Ekpeshie', style: body),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('NGN 15,000', style: bodyBold),
                  const SizedBox(height: 2),
                  Text('23/10/2020', style: subtitle3),
                ],
              ),
              trailing: Container(
                alignment: Alignment.center,
                width: 75,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red.withOpacity(0.1),
                ),
                child:
                    const Text('Expense', style: TextStyle(color: Colors.red)),
              ),
            ),
            const Divider(indent: 16, endIndent: 16)
          ],
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
