import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/reuseables/app_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';

class Payments extends ConsumerStatefulWidget {
  const Payments({super.key});
  static open(BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Payments(),
      ),
    );
  }

  @override
  ConsumerState<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends ConsumerState<Payments>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text(
          'Payments',
          style: bodyBold,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Create and manage your payment and withdrawal methods here.',
                textAlign: TextAlign.center,
                style: subtitle3,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Withdrawal Method', style: subtitle),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.boxFill,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colors.boxStrokeColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Emmanuel Abu-Ekpeshie', style: bodyBold),
                    const Spacer(),
                    const Icon(Icons.more_horiz_rounded, color: Colors.black45),
                  ],
                ),
                const SizedBox(height: 8),
                Text('0123874920', style: subtitle),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset('assets/images/mastercard.png', height: 30),
                    const SizedBox(width: 8),
                    Text('Firstbank Nigeria', style: body),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Payment Methods', style: subtitle),
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 221,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  viewportFraction: 0.92,
                  enableInfiniteScroll: false,
                ),
                items: [1, 2, 3].map((i) {
                  return const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: CardWidget(),
                  );
                }).toList(),
              ),
              Positioned(
                right: 32,
                bottom: 24,
                child: PhysicalModel(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(100),
                  color: colors.accent,
                  child: CircleAvatar(
                    backgroundColor: colors.accent,
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('History', style: subtitle),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              child: Row(
                children: [
                  Text(
                    'Download all as pdf',
                    style: bodyBold.copyWith(color: colors.accent),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    CupertinoIcons.arrow_down_doc,
                    color: colors.accent,
                  )
                ],
              ),
              onTap: () {},
            ),
          ),
          TabBar(
            isScrollable: true,
            controller: tabController,
            labelColor: colors.accent,
            indicatorColor: colors.accent,
            unselectedLabelColor: Colors.black45,
            tabs: const [
              Tab(text: 'Payments'),
              Tab(text: 'Withdrawals'),
            ],
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < 5; i++) ...[
            ListTile(
              leading:
                  const CircleAvatar(child: Icon(CupertinoIcons.doc_chart)),
              title: Text('Invoice #001 - July 2023', style: body),
              subtitle: Text('FIRST BANK: ******5983', style: subtitle3),
              trailing: Text('NGN 59,000', style: smallHeader),
            ),
            const Divider(indent: 16, endIndent: 16)
          ],
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/card.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/mastercard.png'),
              const Spacer(),
              const Icon(
                Icons.more_horiz_rounded,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(height: 16),
          Center(child: Text('****  ****  ****  6863', style: titleLight)),
          const SizedBox(height: 24),
          Text('Nwachi Ifeanyichukwu Victor', style: bodyBoldLight),
          const SizedBox(height: 8),
          Text('10/27', style: subtitle2Light),
        ],
      ),
    );
  }
}
