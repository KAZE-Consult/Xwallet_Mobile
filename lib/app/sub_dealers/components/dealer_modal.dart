import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/sub_dealers/components/is_active_view.dart';
import 'package:xwallet/app/sub_dealers/sub_dealer_details.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

import '../../../model/user_model.dart';

class DealerModal extends ConsumerWidget {
  const DealerModal(this.subdealer, {super.key});
  final UserModel subdealer;
  static open(BuildContext context, UserModel subdealer) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => DealerModal(subdealer),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Container(
      color: colors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              '${subdealer.firstName} ${subdealer.lastName}',
              style: styles.body,
            ),
            subtitle:
                Text(subdealer.walletAccount ?? '--', style: styles.subtitle),
            trailing: IsActiveView(isActive: subdealer.isActive == true),
          ),
          Text('Sales', style: styles.subtitle2),
          Text('NGN 100,000', style: styles.title),
          const SizedBox(height: 8),
          Align(
              alignment: Alignment.topRight,
              child: Text('23/10/2020', style: styles.subtitle2)),
          const SizedBox(height: 8),
          AppButton(
            size: const Size(double.infinity, 45),
            color: colors.accent.withOpacity(0.1),
            child: Text(
              'View Profile',
              style: bodyBold.copyWith(color: colors.accent),
            ),
            onTap: () {
              Navigator.pop(context);
              SubDealerDetails.open(context, subdealer);
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16)
        ],
      ),
    );
  }
}
