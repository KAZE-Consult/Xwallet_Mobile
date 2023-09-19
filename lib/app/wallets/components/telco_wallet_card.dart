import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xwallet/model/wallet/telco_balance.dart';
import 'package:xwallet/reuseables/telco_icon.dart';
import 'package:xwallet/src/settings/settings_controller.dart';
import '../../../reuseables/app_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class TelcoWalletCard extends ConsumerWidget {
  const TelcoWalletCard({
    super.key,
    required this.telcoBalance,
  });
  final TelcoBalance telcoBalance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = NumberFormat("#,##0", "en_US");
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.boxFill,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.boxStrokeColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              TelcoIcon(id: telcoBalance.serviceProvider!),
              const SizedBox(width: 8),
              Text(
                telcoBalance.telcoWalletAccount ?? '',
                style: styles.subtitle,
              ),
              const Spacer(),
              Icon(Icons.more_horiz, color: colors.grey),
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
                    border: Border.all(color: colors.grey),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${telcoBalance.dataBalance}MB',
                          style: styles.bodyBold),
                      const SizedBox(height: 4),
                      Text('Data balance', style: styles.subtitle),
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
                    border: Border.all(color: colors.grey),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NGN${currency.format(telcoBalance.airtimeBalance)}',
                          style: styles.bodyBold),
                      const SizedBox(height: 4),
                      Text('Airtime balance', style: styles.subtitle),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppButton(
            size: const Size(double.infinity, 50),
            color: colors.accent,
            child: Text('Restock', style: bodyBoldLight),
            onTap: () {
              SettingsController().toggleDarkMode();
            },
          )
        ],
      ),
    );
  }
}
