import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.onRequest});

  final VoidCallback onRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.boxFill,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.boxStrokeColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MTN', style: subtitle),
          const SizedBox(height: 8),
          Text('NGN 45,000', style: bodyBold),
          const SizedBox(height: 8),
          SizedBox(
            height: 30,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                onRequest();
              },
              child: Row(
                children: [
                  Text(
                    'Request now',
                    style: subtitle.copyWith(color: AppColors.accent),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    'assets/icons/request.svg',
                    color: AppColors.accent,
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
