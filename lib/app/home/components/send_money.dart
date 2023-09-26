// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/home/components/select_bank.dart';
import 'package:xwallet/app/wallets/vm/wallet_vm.dart';
import 'package:xwallet/model/bank_model.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/reuseables/set_pin.dart';
import 'package:xwallet/reuseables/success_screen.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/extensions.dart';
import 'package:xwallet/utils/helper_functions.dart';
import 'package:xwallet/utils/text_styles.dart';

class SendMoney extends ConsumerStatefulWidget {
  const SendMoney({super.key});
  static open(BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const SendMoney();
        },
      ),
    );
  }

  @override
  ConsumerState<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends ConsumerState<SendMoney> {
  String? transferType;
  bool isLoading = false;
  late WalletVm vm;
  BankModel? selectedBank;
  @override
  void initState() {
    super.initState();
    vm = ref.read(walletVmProvider.notifier);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      final user = ref.read(userProvider).value;
      if (user?.isPinset == false) {
        final hasSet = await SetPin.open(context, true);
        if (hasSet != true) {
          Navigator.pop(context);
        }
        return;
      }
      vm.setSenderAccountNo(vm.wallet!.walletAccount!);
      vm.getBankList();
    });
  }

  @override
  void dispose() {
    vm.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(walletVmProvider);
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Send Money', style: styles.bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          AppDropDownButtonField(
            text: transferType ?? 'Select transfer type',
            options: [
              AppDropDownItem(title: Text('Bank', style: styles.body)),
              AppDropDownItem(title: Text('Wallet', style: styles.body)),
            ],
            onSelect: (value) {
              transferType = value?.title.data;
              int? id;
              if (value?.title.data == 'Bank') {
                id = 1;
              } else {
                id = 2;
              }
              vm.setTransType(id);
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          //
          if (vm.sendToXWalletInputModel.transferType == '1') ...[
            Text('Bank Name', style: styles.subtitle),
            const SizedBox(height: 4),
            AppDropDownButtonField(
              text: selectedBank?.bankName ?? 'Select destination bank',
              onPressed: () async {
                final selectedBank = await SelectBank.open(context);
                this.selectedBank = selectedBank;
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
          ],
          //
          Text('Account number', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            enabled: vm.sendToXWalletInputModel.transferType != null,
            hintText: 'Enter destination account',
            maxLength: 10,
            onChanged: (val) {
              vm.setDestAccountNo(val);
              if (val.length == 10) {
                if (vm.sendToXWalletInputModel.transferType == '2') {
                  vm.walletNameEnquiry(val);
                }
              } else {
                vm.destWalletName = null;
                setState(() {});
              }
            },
            keyboardType: TextInputType.number,
          ),
          if (vm.destWalletName != null) ...[
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(vm.destWalletName!, style: styles.subtitle),
            ),
          ] else
            const SizedBox(height: 16),
          //
          Text('Amount', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            hintText: 'Enter amount',
            onChanged: vm.setAmount,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          //
          Text('Narration', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            hintText: 'Enter narration',
            onChanged: vm.setNarration,
          ),
          const SizedBox(height: 16),
          //8397734249
          Text('PIN', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            obscureText: true,
            maxLines: 1,
            hintText: 'Enter PIN',
            onChanged: vm.setPin,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          //8397734249
          const SizedBox(height: 24),
          AppButton(
            color: colors.accent,
            child: Text('Submit', style: styles.bodyBoldLight),
            onTap: () async {
              //validate
              if (transferType == '1') {
                sendMoneyToBank();
              } else {
                sendMoneyToXWallet();
              }
            },
          )
        ],
      ),
    ).showLoading(isLoading);
  }

  void sendMoneyToXWallet() async {
    if (vm.sendToXWalletInputModel.amount! > vm.wallet!.walletBalance!) {
      showSnackbar(context, 'Amount greater than wallet balance!');
      return;
    }

    isLoading = true;
    setState(() {});
    await vm.sendMoneyToWallet(
      onSuccess: () {
        SuccessScreen.open(context);
      },
      onError: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Transaction failed!'),
          ),
        );
      },
    );
    isLoading = false;
    setState(() {});
  }

  void sendMoneyToBank() async {
    isLoading = true;
    setState(() {});
    await vm.sendMoneyToBank(
      onSuccess: () {
        SuccessScreen.open(context);
      },
      onError: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Transaction failed!'),
          ),
        );
      },
    );
    isLoading = false;
    setState(() {});
  }
}
