import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/home/components/send_money.dart';
import 'package:xwallet/app/wallets/vm/wallet_vm.dart';
import 'package:xwallet/utils/app_colors.dart';
import '../../../reuseables/app_button.dart';
import '../../../utils/text_styles.dart';
import '../vm/home_vm.dart';

class NairaWalletPreview extends ConsumerWidget {
  const NairaWalletPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    final vm = ref.watch(homeVmProvider);
    final session = ref.watch(sessionProvider).value;
    final walletProvider = ref.watch(walletVmProvider);
    final currency = NumberFormat("#,##0", "en_US");
    final wallet = walletProvider.wallet;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.isDarkMode ? colors.boxFill : const Color(0xffECEAF5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: colors.isDarkMode ? Colors.black45 : Colors.black12,
            offset: const Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Balance', style: styles.subtitle1),
              Text(wallet?.walletAccount ?? '--', style: styles.subtitle1),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'NGN${currency.format(wallet?.walletBalance ?? 0)}',
            style: styles.smallTitle,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  color: colors.accent.withOpacity(0.2),
                  child: Text(
                    'Send Money',
                    style: TextStyle(
                      color: colors.accent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    await SendMoney.open(context);
                    vm.getTransactionHistory(session!.sessionId!);
                    walletProvider.getWallet(session.sessionId!);
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  color: colors.accent,
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
    );
  }
}
