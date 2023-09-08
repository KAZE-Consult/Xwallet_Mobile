import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class AddWalletBtn extends StatelessWidget {
  const AddWalletBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: SizedBox(
        height: 116,
        width: 116,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.accent.withOpacity(0.1),
              ),
              child: const Icon(Icons.add, color: AppColors.accent),
            ),
            const SizedBox(height: 8),
            Text(
              'Add Wallet',
              style: body.copyWith(color: AppColors.accent),
            ),
          ],
        ),
      ),
    );
  }
}
