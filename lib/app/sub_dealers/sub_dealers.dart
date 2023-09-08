import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xwallet/app/sub_dealers/components/add_sub_dealer.dart';
import 'package:xwallet/reuseables/app_button.dart';

import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';
import 'components/dealer_modal.dart';

class SubDealers extends StatelessWidget {
  const SubDealers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Sub-dealers', style: title),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Text('Manage and add new sub-dealers here.', style: subtitle2),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              color: AppColors.accent,
              child: Text('Add Sub-dealer', style: bodyBoldLight),
              onTap: () {
                AddSubDealer.open(context);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CupertinoSearchTextField(
              placeholder: 'Search sub-dealer',
            ),
          ),
          for (int i = 0; i < 5; i++) ...[
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                DealerModal.open(context);
              },
              child: ListTile(
                title: const Text('Remilekun Airtimes'),
                subtitle: const Text('0023488562'),
                trailing: Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green.withOpacity(0.1),
                  ),
                  child: const Text('Active',
                      style: TextStyle(color: Colors.green)),
                ),
              ),
            ),
            const Divider(indent: 16, endIndent: 16, height: 4)
          ],
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
