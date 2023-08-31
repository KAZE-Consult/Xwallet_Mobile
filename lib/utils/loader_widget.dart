import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'loader_vm.dart';

class LoaderWidget extends ConsumerWidget {
  const LoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loaderVm);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: vm.isLoading
          ? Container(
              color: Colors.black.withOpacity(0.6),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            )
          : const SizedBox(),
    );
  }
}
