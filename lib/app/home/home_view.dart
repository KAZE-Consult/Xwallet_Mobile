// ignore_for_file: prefer_is_empty

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/home/vm/home_vm.dart';
import 'package:xwallet/app/request_airtime/request_airtime.dart';
import 'package:xwallet/app/transaction_history/transaction_history.dart';
import 'package:xwallet/app/wallets/vm/wallet_vm.dart';
import 'package:xwallet/reuseables/loading_tile_list.dart';
import 'package:xwallet/reuseables/sticky_header.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';
import '../auth_wrapper/login/vm/auth_vm.dart';
import '../transaction_history/components/transaction_item_view.dart';
import 'components/add_wallet_btn.dart';
import 'components/naira_wallet_preview.dart';
import 'components/wallet_card.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    final vm = ref.read(homeVmProvider.notifier);
    final walletVm = ref.read(walletVmProvider.notifier);
    final session = ref.read(sessionProvider).value;
    vm.getTransactionHistory(session!.sessionId!);
    walletVm.getWallet(session.sessionId!);
  }

  @override
  Widget build(BuildContext context) {
    final loggedInDealer = ref.watch(userProvider).value;
    final vm = ref.watch(homeVmProvider);
    final walletProvider = ref.watch(walletVmProvider);
    final wallet = walletProvider.wallet;
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: StickyHeader(
              minHeight: 265,
              maxHeight: 265,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: MediaQuery.of(context).padding.top + 16,
                      bottom: 95,
                    ),
                    margin: const EdgeInsets.only(bottom: 70),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/card.png'),
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 18),
                        const SizedBox(width: 12),
                        Text('Hello ${loggedInDealer?.firstName},',
                            style: bodyLight.copyWith(fontSize: 22)),
                        const Spacer(),
                        Icon(
                          CupertinoIcons.bell_circle_fill,
                          size: 30,
                          color: colors.white,
                        )
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: NairaWalletPreview(),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Wallets', style: styles.subtitle),
            ),
          ),
          if (wallet?.telcoBalance == null)
            const SliverToBoxAdapter(
                child: LoadingTileList(2, isHorizontal: true))
          else ...[
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    if (wallet != null)
                      for (int i = 0; i < wallet.telcoBalance!.length; i++) ...[
                        WalletCard(
                          telcoWallet: wallet.telcoBalance![i],
                          onRequest: () {
                            RequestAirtime.open(context);
                          },
                        ),
                        const SizedBox(width: 16),
                      ],
                    const AddWalletBtn(),
                  ],
                ),
              ),
            ),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          //Transaction History
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Transaction', style: styles.subtitle),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 4)),
          if (vm.getTransHistoryPreview().isEmpty)
            const SliverToBoxAdapter(child: LoadingTileList(3)),
          SliverList.separated(
            itemCount: vm.getTransHistoryPreview().length,
            separatorBuilder: (context, index) => Divider(
              indent: 16,
              endIndent: 16,
              color: colors.reversePrimary.withOpacity(0.1),
            ),
            itemBuilder: (context, index) {
              final transaction = vm.getTransHistoryPreview()[index];
              return TransactionItemView(transaction: transaction);
            },
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    TransactionHistory.open(context);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: colors.accent),
                    ),
                    child: Text(
                      'View all',
                      style: subtitle.copyWith(color: colors.accent),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 130))
        ],
      ),
    );
  }
}
