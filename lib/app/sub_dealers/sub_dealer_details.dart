import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xwallet/app/sub_dealers/components/add_new_telco_modal.dart';
import 'package:xwallet/app/sub_dealers/components/general_item_card.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/reuseables/sticky_header.dart';

import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';
import 'components/request_item_card.dart';

class SubDealerDetails extends StatefulWidget {
  const SubDealerDetails({super.key});
  static open(BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => const SubDealerDetails()),
    );
  }

  @override
  State<SubDealerDetails> createState() => _SubDealerDetailsState();
}

class _SubDealerDetailsState extends State<SubDealerDetails>
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: AppColors.accent.withOpacity(0.1),
            elevation: 0,
            iconTheme: const IconThemeData(color: AppColors.accent),
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
              title: Text('Remilekun Airtimes', style: bigBody),
              subtitle: const Text('0023488562'),
              trailing: Container(
                alignment: Alignment.center,
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green.withOpacity(0.1),
                ),
                child:
                    const Text('Active', style: TextStyle(color: Colors.green)),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    size: Size((screenWidth * 0.5) - 24, 45),
                    color: AppColors.accent,
                    child: Text(
                      'Update Info',
                      style: bodyBoldLight,
                    ),
                    onTap: () {},
                  ),
                  AppButton(
                    size: Size((screenWidth * 0.5) - 24, 45),
                    color: AppColors.accent.withOpacity(0.1),
                    child: Text(
                      'Add New Telco',
                      style: bodyBold.copyWith(color: AppColors.accent),
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
                labelColor: AppColors.accent,
                indicatorColor: AppColors.accent,
                unselectedLabelColor: Colors.black45,
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

class _Options extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ListTile(
          title: Text('Suspend Sub-dealer'),
        ),
        const ListTile(
          title: Text('Deactivate Sub-dealer'),
        ),
        const ListTile(
          title: Text('Delete Sub-dealer'),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom)
      ],
    );
  }
}
