// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xwallet/model/telco_model.dart';
import 'package:xwallet/utils/app_colors.dart';

class TelcoIcon extends ConsumerWidget {
  const TelcoIcon({super.key, required this.id, this.height});
  final int? id;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    final path = getTelcoById(id)?.logoPath;
    if (path == null) return const SizedBox();
    bool isSvg = path.split('.').last == 'svg';
    if (isSvg) {
      return SvgPicture.asset(path,
          height: height ?? 19, width: 19, color: colors.reversePrimary);
    }
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Transform.scale(
        scale: 1.8,
        child: SizedBox(
          child: Image.asset(
            path,
            height: height ?? 19,
            width: 19,
          ),
        ),
      ),
    );
  }
}
