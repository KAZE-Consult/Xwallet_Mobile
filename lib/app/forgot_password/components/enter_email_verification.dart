import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../reuseables/app_button.dart';
import '../../../reuseables/text_area_field.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class EnterEmailVerification extends ConsumerWidget {
  const EnterEmailVerification({super.key});
  static open(BuildContext context) {
    return Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const EnterEmailVerification()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You\'ve got mail?', style: styles.title),
            const SizedBox(height: 12),
            Text("We'll send reset instructions to your mail",
                style: styles.subtitle2),
            const SizedBox(height: 16),
            Text('Enter Code', style: styles.subtitle),
            const SizedBox(height: 4),
            const AppTextField(
              hintText: 'Enter Code',
            ),
            const SizedBox(height: 32),
            AppButton(
              color: colors.accent,
              size: const Size(double.infinity, 45),
              child: Text('Continue', style: styles.bodyBoldLight),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Back to Sign-in", style: styles.subtitle2)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
