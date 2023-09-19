import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/utils/app_colors.dart';

import 'notify_vm.dart';
import 'text_styles.dart';

class NotifyView extends ConsumerWidget {
  const NotifyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(notifyVm);
    final colors = AppColors(ref);
    return AnimatedPositioned(
      curve: Curves.easeInSine,
      duration: const Duration(milliseconds: 600),
      left: 0,
      right: 0,
      top: vm.isShowing ? 0 : -170,
      child: Material(
        color: colors.grey,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(vm.msg, style: bodyBold),
            ),
            CupertinoButton(
              padding: const EdgeInsets.only(bottom: 8, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Dismiss',
                    style: bodyBold.copyWith(color: colors.accent),
                  ),
                  Icon(Icons.clear, color: colors.accent)
                ],
              ),
              onPressed: () {
                vm.removeMsg();
              },
            )
          ],
        ),
      ),
    );
  }
}
