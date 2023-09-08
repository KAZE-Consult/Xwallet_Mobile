import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xwallet/app/request_airtime/request_airtime.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

import 'components/add_wallet_btn.dart';
import 'components/wallet_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Hello, User', style: title),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Balance', style: body),
                    Text('Wallet Account', style: body),
                  ],
                ),
                const SizedBox(height: 12),
                Text('NGN 80,128', style: smallTitle),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        color: AppColors.accent.withOpacity(0.1),
                        child: const Text(
                          'Send Money',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppButton(
                        color: AppColors.accent,
                        child: const Text(
                          'Fund',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(height: 16),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   padding: const EdgeInsets.all(16),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: AppColors.boxFill,
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(color: AppColors.boxStrokeColor),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('Top selling wallets', style: bodyBold),
          //       const SizedBox(height: 8),
          //       Table(
          //         children: [
          //           TableRow(children: [
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 8.0),
          //               child: Text('Wallet', style: subtitle),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 8.0),
          //               child: Text('Sales', style: subtitle),
          //             ),
          //           ]),
          //           TableRow(children: [
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 8.0),
          //               child: Text('MTN NG', style: body),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 8.0),
          //               child: Text('NGN 367,000', style: body),
          //             ),
          //           ]),
          //           TableRow(children: [
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 8.0),
          //               child: Text('9mobile', style: body),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 8.0),
          //               child: Text('NGN 367,000', style: body),
          //             ),
          //           ]),
          //           TableRow(children: [
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 0.0),
          //               child: Text('Airtel NG', style: body),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 0.0),
          //               child: Text('NGN 367,000', style: body),
          //             ),
          //           ]),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wallets', style: subtitle),
                Text(
                  'View all',
                  style: subtitle.copyWith(color: AppColors.accent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                for (int i = 0; i < 2; i++) ...[
                  WalletCard(
                    onRequest: () {
                      RequestAirtime.open(context);
                    },
                  ),
                  const SizedBox(width: 16),
                ],
                const AddWalletBtn(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          //Transaction History
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Transaction', style: subtitle),
          ),
          const SizedBox(height: 4),
          for (int i = 0; i < 4; i++) ...[
            ListTile(
              // horizontalTitleGap: 0,
              leading:
                  const CircleAvatar(child: Icon(Icons.arrow_outward_sharp)),
              title: const Text('MTN Request'),
              subtitle: const Text('May 6, 2023'),
              trailing: Text('+ ₦35,000', style: bodyBold),
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.accent),
                  ),
                  child: Text(
                    'View all',
                    style: subtitle.copyWith(color: AppColors.accent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
