import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class ApproveRequestModal extends ConsumerWidget {
  const ApproveRequestModal({super.key});
  static open(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const ApproveRequestModal();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Approve Request', style: bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              'To add a new dealer rep, fill in the information below.',
              textAlign: TextAlign.center,
              style: subtitle3,
            ),
          ),
          const SizedBox(height: 16),
          //
          Text('Request amount', style: subtitle),
          const SizedBox(height: 4),
          Text('NGN 157,800.00', style: title),
          const SizedBox(height: 16),
          //

          Text('Add Comment(Optional)', style: subtitle),
          const SizedBox(height: 4),
          const AppTextField(hintText: 'Comment', maxLines: 3),
          const SizedBox(height: 16),
          const SizedBox(height: 24),
          AppButton(
            color: colors.accent,
            child: Text('Approve', style: bodyBoldLight),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
