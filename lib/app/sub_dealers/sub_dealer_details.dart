import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/sub_dealers/components/add_new_telco_modal.dart';
import 'package:xwallet/app/sub_dealers/components/general_item_card.dart';
import 'package:xwallet/app/sub_dealers/components/is_active_view.dart';
import 'package:xwallet/app/sub_dealers/vm/sub_dealers_vm.dart';
import 'package:xwallet/model/user_model.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/helper_functions.dart';
import '../../utils/text_styles.dart';
import 'components/request_item_card.dart';

class SubDealerDetails extends ConsumerStatefulWidget {
  const SubDealerDetails(this.subdealer, {super.key});
  final UserModel subdealer;
  static open(BuildContext context, UserModel subdealer) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => SubDealerDetails(subdealer),
      ),
    );
  }

  @override
  ConsumerState<SubDealerDetails> createState() => _SubDealerDetailsState();
}

class _SubDealerDetailsState extends ConsumerState<SubDealerDetails>
    with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: colors.accent.withOpacity(0.1),
            elevation: 0,
            iconTheme: IconThemeData(color: colors.accent),
            actions: [
              IconButton(
                onPressed: () {
                  _Options.open(context);
                },
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 4)),
          SliverToBoxAdapter(
              child: ListTile(
            leading: const CircleAvatar(radius: 25),
            title: Text('Remilekun Airtimes', style: styles.bigBody),
            subtitle: Text('0023488562', style: styles.subtitle),
            trailing: IsActiveView(isActive: widget.subdealer.isActive ?? true),
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    size: Size((screenWidth * 0.5) - 24, 45),
                    color: colors.accent,
                    child: Text(
                      'Update Info',
                      style: styles.bodyBoldLight,
                    ),
                    onTap: () {},
                  ),
                  AppButton(
                    size: Size((screenWidth * 0.5) - 24, 45),
                    color: colors.accent.withOpacity(0.1),
                    child: Text(
                      'Add New Telco',
                      style: styles.bodyBold.copyWith(color: colors.accent),
                    ),
                    onTap: () {
                      AddNewTelcoModal.open(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TabBar(
                isScrollable: true,
                controller: tabController,
                labelColor: colors.accent,
                indicatorColor: colors.accent,
                unselectedLabelColor: colors.reversePrimary.withOpacity(0.7),
                labelStyle: styles.subtitle,
                tabs: const [
                  Tab(text: 'General'),
                  Tab(text: 'Requests'),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          if (tabController.index == 0)
            SliverList.separated(
              itemCount: 6,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return const GeneralItemCard();
              },
            )
          else
            SliverList.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return const RequestItemCard();
              },
            )
        ],
      ),
    );
  }
}

class _Options extends ConsumerWidget {
  const _Options();
  static open(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const _Options();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = TextStyles(ref);
    final colors = AppColors(ref);
    final vm = ref.read(subDealersVm.notifier);
    final options = [
      'Suspend Sub-dealer',
      'Deactivate Sub-dealer',
      'Delete Sub-dealer'
    ];
    return Container(
      color: colors.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < options.length; i++)
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                if (i == 1) {
                  vm.deactivateSubDealer(
                    onError: (value) {
                      showSnackbar(context, value);
                    },
                  );
                }
              },
              child: ListTile(
                title: Text(options[i], style: styles.body),
              ),
            ),
          SizedBox(height: MediaQuery.of(context).padding.bottom)
        ],
      ),
    );
  }
}
