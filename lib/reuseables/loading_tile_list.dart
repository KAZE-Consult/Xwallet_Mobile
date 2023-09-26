import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/utils/app_colors.dart';

class LoadingTileList extends ConsumerWidget {
  const LoadingTileList(this.count, {super.key, this.isHorizontal = false});
  final int count;
  final bool isHorizontal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    if (isHorizontal) {
      return SizedBox(
        height: 155,
        child: Row(
          children: [
            const SizedBox(width: 16),
            for (int i = 0; i < count; i++) ...[
              Container(
                height: 140,
                width: 160,
                margin: const EdgeInsets.only(right: 0),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors.reversePrimary.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      color: colors.reversePrimary.withOpacity(0.1),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 24,
                      width: 120,
                      color: colors.reversePrimary.withOpacity(0.03),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 24,
                      width: 80,
                      color: colors.reversePrimary.withOpacity(0.03),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16)
            ]
          ],
        ),
      );
    }
    return Column(
      children: [
        for (int i = 0; i < count; i++) ...[
          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.reversePrimary.withOpacity(0.02),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 200,
                  color: colors.reversePrimary.withOpacity(0.1),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 14,
                  width: 120,
                  color: colors.reversePrimary.withOpacity(0.03),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12)
        ]
      ],
    );
  }
}
