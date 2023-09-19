import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/wallets/vm/wallet_vm.dart';
import 'package:xwallet/model/bank_model.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class SelectBank extends ConsumerStatefulWidget {
  const SelectBank({super.key});
  static Future<BankModel?> open(BuildContext context) {
    return Navigator.push<BankModel?>(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const SelectBank();
        },
      ),
    );
  }

  @override
  ConsumerState<SelectBank> createState() => _SendMoneyState();
}

class _SendMoneyState extends ConsumerState<SelectBank> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(walletVmProvider);
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    final filteredList = vm.banks
        ?.where((e) => e.bankName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Select bank', style: styles.bodyBold),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 66),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: CupertinoSearchTextField(
              style: styles.body,
              onChanged: (value) {
                query = value;
                setState(() {});
              },
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          for (int i = 0; i < filteredList!.length; i++) ...[
            GestureDetector(
              onTap: () {
                Navigator.pop(context, filteredList[i]);
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title:
                    Text(filteredList[i].bankName ?? '--', style: styles.body),
                subtitle: Text(
                  vm.banks![i].bankShortName ?? '--',
                  style: styles.subtitle1,
                ),
              ),
            ),
            Divider(
              color: colors.reversePrimary.withOpacity(0.1),
            )
          ]
        ],
      ),
    );
  }
}
