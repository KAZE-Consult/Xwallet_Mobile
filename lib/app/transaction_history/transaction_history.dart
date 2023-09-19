import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/home/vm/home_vm.dart';
import 'package:xwallet/app/transaction_history/components/transaction_item_view.dart';

import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';

class TransactionHistory extends ConsumerWidget {
  const TransactionHistory({super.key});
  static open(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const TransactionHistory();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeVmProvider);
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    final transactions = vm.transactionHistory;
    return Scaffold(
      backgroundColor: colors.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: colors.accent.withOpacity(0.1),
            elevation: 0,
            iconTheme: IconThemeData(color: colors.accent),
            title: Text('Transaction History', style: styles.bodyBold),
          ),
          CupertinoSliverRefreshControl(
            refreshTriggerPullDistance: 80,
            refreshIndicatorExtent: 50,
            builder: (context, refreshState, pulledExtent,
                refreshTriggerPullDistance, refreshIndicatorExtent) {
              return LinearProgressIndicator(
                backgroundColor: colors.accent.withOpacity(0.3),
                color: colors.white,
              );
            },
            onRefresh: () async {
              final session = ref.read(sessionProvider).value;
              return vm.getTransactionHistory(session!.sessionId!);
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverList.separated(
            itemCount: transactions.length,
            separatorBuilder: (context, index) => Divider(
              indent: 16,
              endIndent: 16,
              color: colors.reversePrimary.withOpacity(0.1),
            ),
            itemBuilder: (context, index) {
              final trans = transactions[index];
              return TransactionItemView(transaction: trans);
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16 + MediaQuery.of(context).padding.bottom,
            ),
          )
        ],
      ),
    );
  }
}
