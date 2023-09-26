// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/pin_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/extensions.dart';
import 'package:xwallet/utils/helper_functions.dart';
import 'package:xwallet/utils/text_styles.dart';

class EnterOtpSetPin extends ConsumerStatefulWidget {
  const EnterOtpSetPin(this.pin, {super.key});
  final String pin;
  static Future<bool?> open(BuildContext context, String pin) {
    return Navigator.push<bool?>(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return EnterOtpSetPin(pin);
        },
      ),
    );
  }

  @override
  ConsumerState<EnterOtpSetPin> createState() => _EnterOtpState();
}

class _EnterOtpState extends ConsumerState<EnterOtpSetPin> {
  bool isLoading = false;
  String otp = '';
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
                'An OTP has been sent to your number, please check and enter value in the field below',
                textAlign: TextAlign.center,
                style: styles.subtitle3,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Verification',
              style: styles.body,
            ),
          ),
          const SizedBox(height: 16),
          PinField(
            onChanged: (otp) {
              this.otp = otp;
              setState(() {});
            },
          ),
          const SizedBox(height: 32),
          if (otp.length == 4)
            AppButton(
              color: colors.accent,
              child: Text('Verify', style: styles.bodyBoldLight),
              onTap: () async {
                isLoading = true;
                setState(() {});
                final isSuccess = await AuthVm().setTransactionPin(
                  widget.pin,
                  otp,
                  onError: (value) {
                    showSnackbar(context, value, isSuccess: false);
                  },
                );
                if (!isSuccess) return;
                isLoading = false;
                setState(() {});
                showSnackbar(
                  context,
                  'Your pin has been set successfully',
                  isSuccess: false,
                );
                await Future.delayed(const Duration(milliseconds: 200));
                Navigator.pop(context, true);
                Navigator.pop(context, true);
              },
            )
          // else
          //   ResendOtpView(),
        ],
      ),
    ).showLoading(isLoading);
  }
}
