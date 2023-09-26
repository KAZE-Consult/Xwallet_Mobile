import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/sub_dealers/components/add_sub_dealer.dart';
import 'package:xwallet/app/sub_dealers/vm/sub_dealers_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import '../../reuseables/loading_tile_list.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';
import 'components/dealer_modal.dart';
import 'components/is_active_view.dart';

class SubDealers extends ConsumerStatefulWidget {
  const SubDealers({super.key});

  @override
  ConsumerState<SubDealers> createState() => _SubDealersState();
}

class _SubDealersState extends ConsumerState<SubDealers> {
  @override
  void initState() {
    super.initState();
    final vm = ref.read(subDealersVm.notifier);
    vm.getSubDealers();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    final vm = ref.watch(subDealersVm);
    final subDealers = vm.subDealers;

    return Scaffold(
      backgroundColor: colors.bgColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Sub-dealers', style: styles.title),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Manage and add new sub-dealers here.',
                style: styles.subtitle2),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              color: colors.accent,
              child: Text('Add Sub-dealer', style: styles.bodyBoldLight),
              onTap: () async {
                final isSuccess = await AddSubDealer.open(context);
                if (isSuccess == true) {
                  vm.getSubDealers();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoSearchTextField(
              placeholder: 'Search sub-dealer',
              style: styles.body,
            ),
          ),
          if (subDealers != null)
            for (int i = 0; i < subDealers.length; i++) ...[
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  DealerModal.open(context, subDealers[i]);
                },
                child: ListTile(
                  title: Text(
                      '${subDealers[i].firstName} ${subDealers[i].lastName}',
                      style: styles.body),
                  subtitle: Text(subDealers[i].walletAccount ?? '--',
                      style: styles.subtitle),
                  trailing: IsActiveView(
                    isActive: subDealers[i].isActive == true,
                  ),
                ),
              ),
              const Divider(indent: 16, endIndent: 16, height: 4)
            ]
          else
            const LoadingTileList(3),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
