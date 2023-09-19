import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/wallets/vm/wallet_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class EnterOtpWallet extends ConsumerStatefulWidget {
  const EnterOtpWallet(
      {super.key, required this.phoneNo, required this.serviceProvider});
  final String phoneNo;
  final int serviceProvider;
  static Future<bool?> open(
      BuildContext context, String phoneNo, int serviceProvider) {
    return Navigator.push<bool?>(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return EnterOtpWallet(
              phoneNo: phoneNo, serviceProvider: serviceProvider);
        },
      ),
    );
  }

  @override
  ConsumerState<EnterOtpWallet> createState() => _EnterOtpWalletState();
}

class _EnterOtpWalletState extends ConsumerState<EnterOtpWallet> {
  String otp = '';
  @override
  void initState() {
    super.initState();
    final vm = ref.read(walletVmProvider.notifier);
    vm.sendCreateWalletToken(widget.phoneNo);
  }

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
        title: Text('Enter OTP', style: styles.bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              'A 4 digit otp has been sent to ${widget.phoneNo}',
              textAlign: TextAlign.center,
              style: styles.subtitle3,
            ),
          ),
          const SizedBox(height: 16),
          //
          AppTextField(
            hintText: 'Enter OTP',
            keyboardType: TextInputType.number,
            onChanged: (val) {
              otp = val;
            },
          ),
          const SizedBox(height: 16),
          //
          Align(
            alignment: Alignment.center,
            child: AppButton(
              size: const Size(150, 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh,
                    color: colors.reversePrimary.withOpacity(0.4),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Resend OTP',
                    style: styles.bodyBold.copyWith(
                      color: colors.reversePrimary.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              onTap: () async {
                final vm = ref.read(walletVmProvider.notifier);
                vm.sendCreateWalletToken(widget.phoneNo);
              },
            ),
          ),
          const SizedBox(height: 16),
          AppButton(
            color: colors.accent,
            child: Text('Continue', style: bodyBoldLight),
            onTap: () async {
              if (otp.isEmpty) return false;
              final vm = ref.read(walletVmProvider.notifier);
              vm.createWalletAccount(
                serviceProvider: widget.serviceProvider,
                telcoPhoneNo: widget.phoneNo,
                otp: otp,
              );
            },
          )
        ],
      ),
    );
  }
}
