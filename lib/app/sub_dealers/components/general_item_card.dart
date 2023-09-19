import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class GeneralItemCard extends ConsumerWidget {
  const GeneralItemCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    return Container(
      decoration: BoxDecoration(
          color: colors.boxFill,
          border: Border.all(color: colors.boxStrokeColor),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Total Sales', style: subtitle3),
              const Spacer(),
              const Icon(Icons.more_horiz, color: Colors.black45),
            ],
          ),
          const SizedBox(height: 16),
          Text('NGN 250,000.000', style: title),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.arrow_upward_rounded,
                  size: 18, color: Colors.green),
              const Text('20% ', style: TextStyle(color: Colors.green)),
              const Text('than last month'),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/chart.svg',
                height: 30,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
