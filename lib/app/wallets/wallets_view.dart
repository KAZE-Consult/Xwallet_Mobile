import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xwallet/app/home/components/naira_wallet_preview.dart';
import 'package:xwallet/app/wallets/vm/wallet_vm.dart';
import 'package:xwallet/utils/extensions.dart';
import '../../reuseables/app_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';
import 'components/new_wallet_card.dart';
import 'components/telco_wallet_card.dart';

class WalletsView extends ConsumerStatefulWidget {
  const WalletsView({super.key});

  @override
  ConsumerState<WalletsView> createState() => _WalletsViewState();
}

class _WalletsViewState extends ConsumerState<WalletsView>
    with TickerProviderStateMixin {
  int telcoWalletInFocus = 0;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(walletVmProvider);
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    final wallet = vm.wallet;
    final currency = NumberFormat("#,##0", "en_US");

    if (wallet == null) {
      return Scaffold(
        backgroundColor: colors.bgColor,
        body: Center(
          child: CircularProgressIndicator(
            color: colors.primary,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: colors.bgColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Wallets', style: styles.title),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Manage your wallets here', style: styles.subtitle2),
          ),
          const SizedBox(height: 12),
          const NairaWalletPreview(),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Telco Wallets', style: styles.body),
          ),
          const SizedBox(height: 8),
          // telco wallets
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: wallet.telcoBalance!.length + 1,
              onPageChanged: (value) {
                telcoWalletInFocus = value;
                setState(() {});
              },
              itemBuilder: (_, i) {
                if (i == wallet.telcoBalance!.length) {
                  return const NewWalletCard();
                }
                return TelcoWalletCard(telcoBalance: wallet.telcoBalance![i]);
              },
            ),
          ),
          const SizedBox(height: 8),
          //indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              wallet.telcoBalance!.length,
              (i) {
                final isShowing = telcoWalletInFocus == i;
                return CircleAvatar(
                  radius: 5,
                  backgroundColor: isShowing
                      ? colors.accent
                      : colors.accent.withOpacity(0.3),
                ).padding(const EdgeInsets.symmetric(horizontal: 4));
              },
            ),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: styles.subtitle),
                Text(
                  'See All',
                  style: styles.subtitle.copyWith(color: colors.accent),
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
              indicatorColor: colors.accent,
              unselectedLabelStyle: subtitle,
              tabs: [
                Tab(child: Text('Airtime', style: styles.subtitle)),
                Tab(child: Text('Data', style: styles.subtitle)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < 5; i++) ...[
            ListTile(
              title: Text('Emmanuel Abu-Ekpeshie', style: styles.body),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('NGN 15,000', style: styles.bodyBold),
                  const SizedBox(height: 2),
                  Text('23/10/2020', style: styles.subtitle3),
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
