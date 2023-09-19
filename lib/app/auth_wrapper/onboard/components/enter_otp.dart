import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/pin_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/text_styles.dart';

class EnterOtp extends ConsumerStatefulWidget {
  const EnterOtp({super.key});
  static Future<bool?> open(BuildContext context) {
    return Navigator.push<bool?>(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const EnterOtp();
        },
      ),
    );
  }

  @override
  ConsumerState<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends ConsumerState<EnterOtp> {
  String phoneOtp = '';
  String emailOtp = '';
  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Verification', style: styles.bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: colors.boxStrokeColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'OTP\'s have been sent to both your number and your email, please check and paste the values in the following fields.',
                textAlign: TextAlign.center,
                style: styles.subtitle3,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Phone Verification',
              style: styles.body,
            ),
          ),
          const SizedBox(height: 16),
          PinField(
            onChanged: (otp) {
              phoneOtp = otp;
              setState(() {});
            },
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Email Verification',
              style: styles.body,
            ),
          ),
          const SizedBox(height: 16),
          PinField(
            onChanged: (otp) {
              emailOtp = otp;
              setState(() {});
            },
          ),
          const SizedBox(height: 32),
          if (emailOtp.length == 4 && phoneOtp.length == 4)
            AppButton(
              color: colors.accent,
              child: Text('Verify', style: styles.bodyBoldLight),
              onTap: () async {
                final isSuccess = await AuthVm().validateOtp(
                  '$emailOtp$phoneOtp',
                  onError: (value) {},
                );
                if (!isSuccess) return;
                //show success screeen
              },
            )
          else
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
                onTap: () async {},
              ),
            ),
        ],
      ),
    );
  }
}
