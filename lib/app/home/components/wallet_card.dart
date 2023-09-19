import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:xwallet/model/wallet/telco_balance.dart';
import 'package:xwallet/reuseables/telco_icon.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class WalletCard extends ConsumerWidget {
  const WalletCard(
      {super.key, required this.onRequest, required this.telcoWallet});

  final VoidCallback onRequest;
  final TelcoBalance telcoWallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = NumberFormat("#,##0", "en_US");
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.boxFill,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.boxStrokeColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TelcoIcon(id: telcoWallet.serviceProvider!),
              Text(
                telcoWallet.telcoWalletAccount ?? '',
                style: styles.subtitle3,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('Airtime: ', style: styles.subtitle),
              Text('₦${currency.format(telcoWallet.airtimeBalance ?? 0)}',
                  style: styles.bodyBold),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('Data: ', style: styles.subtitle),
              Text('${currency.format(telcoWallet.dataBalance ?? 0)}MB',
                  style: styles.bodyBold),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 25,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                onRequest();
              },
              child: Row(
                children: [
                  Text(
                    'Request now',
                    style: subtitle.copyWith(color: colors.accent),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    'assets/icons/request.svg',
                    color: colors.accent,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
