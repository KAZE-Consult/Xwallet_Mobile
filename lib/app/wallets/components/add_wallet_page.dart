import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/wallets/components/enter_otp_wallet.dart';
import 'package:xwallet/app/wallets/vm/wallet_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/telco_icon.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class AddWalletPage extends ConsumerStatefulWidget {
  final int serviceProvider;
  const AddWalletPage({super.key, required this.serviceProvider});
  static open(BuildContext context, int serviceProvider) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return AddWalletPage(serviceProvider: serviceProvider);
        },
      ),
    );
  }

  @override
  ConsumerState<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends ConsumerState<AddWalletPage> {
  String phoneNo = '';
  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Add Wallet', style: styles.bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: TelcoIcon(id: widget.serviceProvider, height: 30),
          ),
          const SizedBox(height: 16),
          //
          Text('Phone number', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            hintText: '',
            keyboardType: TextInputType.number,
            onChanged: (val) {
              phoneNo = val;
            },
          ),
          const SizedBox(height: 16),
          //
          AppButton(
            color: colors.accent,
            child: Text('Continue', style: bodyBoldLight),
            onTap: () async {
              if (phoneNo.length < 6) return;
              final otp = await EnterOtpWallet.open(
                context,
                phoneNo,
                widget.serviceProvider,
              );
            },
          )
        ],
      ),
    );
  }
}
