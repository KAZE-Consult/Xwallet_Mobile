import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class AddWalletBtn extends ConsumerWidget {
  const AddWalletBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
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
                color: colors.accent.withOpacity(0.1),
              ),
              child: Icon(Icons.add, color: colors.accent),
            ),
            const SizedBox(height: 8),
            Text(
              'Add Wallet',
              style: body.copyWith(color: colors.accent),
            ),
          ],
        ),
      ),
    );
  }
}
