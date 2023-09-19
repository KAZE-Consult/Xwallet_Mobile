import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/wallets/components/add_wallet_page.dart';
import 'package:xwallet/model/telco_model.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/reuseables/telco_icon.dart';
import 'package:xwallet/utils/enums.dart';
import 'package:xwallet/utils/text_styles.dart';

import '../../../utils/app_colors.dart';

class NewWalletCard extends ConsumerStatefulWidget {
  const NewWalletCard({
    super.key,
  });

  @override
  ConsumerState<NewWalletCard> createState() => _NewWalletCardState();
}

class _NewWalletCardState extends ConsumerState<NewWalletCard> {
  AppDropDownItem? selectedTelco;
  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Text('Create new telco wallet', style: styles.subtitle2),
          const SizedBox(height: 8),
          AppDropDownButtonField(
            icon: selectedTelco?.icon,
            text: selectedTelco?.title.data ?? 'Select Service Provider',
            options: Telco.values.map((e) {
              final telco = TelcoModel(id: e.getId());
              return AppDropDownItem(
                title: Text(telco.title ?? '--', style: styles.body),
                icon: TelcoIcon(id: e.getId()),
              );
            }).toList(),
            onSelect: (value) {
              selectedTelco = value;
              setState(() {});
            },
          ),
          const Spacer(),
          AppButton(
            size: const Size(double.infinity, 50),
            color: colors.accent,
            child: Text(
              'Add Wallet',
              style: bodyBoldLight,
            ),
            onTap: () {
              if (selectedTelco == null) return;
              AddWalletPage.open(
                context,
                getTecloByTitle(selectedTelco!.title.data)!.id!,
              );
            },
          )
        ],
      ),
    );
  }
}
