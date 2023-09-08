import 'package:flutter/material.dart';
import 'package:xwallet/app/sub_dealers/sub_dealer_details.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class DealerModal extends StatelessWidget {
  const DealerModal({super.key});
  static open(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const DealerModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Remilekun Airtimes', style: bigBody),
            subtitle: const Text('0023488562'),
            trailing: Container(
              alignment: Alignment.center,
              width: 70,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green.withOpacity(0.1),
              ),
              child:
                  const Text('Active', style: TextStyle(color: Colors.green)),
            ),
          ),
          Text('Sales', style: subtitle2),
          Text('NGN 100,000', style: title),
          const SizedBox(height: 8),
          Align(
              alignment: Alignment.topRight,
              child: Text('23/10/2020', style: subtitle2)),
          const SizedBox(height: 8),
          AppButton(
            size: const Size(double.infinity, 45),
            color: AppColors.accent.withOpacity(0.1),
            child: Text(
              'View Profile',
              style: bodyBold.copyWith(color: AppColors.accent),
            ),
            onTap: () {
              Navigator.pop(context);
              SubDealerDetails.open(context);
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16)
        ],
      ),
    );
  }
}
