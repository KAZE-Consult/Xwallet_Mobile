// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/utils/helper_functions.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import 'app_button.dart';

class ResendOtpView extends ConsumerStatefulWidget {
  const ResendOtpView(this.resendOtp, {super.key});
  final Function resendOtp;

  @override
  ConsumerState<ResendOtpView> createState() => _ResendOtpViewState();
}

class _ResendOtpViewState extends ConsumerState<ResendOtpView> {
  bool allowResend = false;
  int timeLeft = 60;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeLeft = timeLeft - 1;
      setState(() {});
      if (timer.tick == 60) {
        timer.cancel();
        allowResend = true;
        setState(() {});
        return;
      }
    });
  }

  reStartTimer() {
    timeLeft = 60;
    allowResend = false;
    setState(() {});
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeLeft = timeLeft - 1;
      setState(() {});
      if (timer.tick == 60) {
        timer.cancel();
        allowResend = true;
        setState(() {});
        return;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: AppButton(
            isEnabled: allowResend,
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
              final isSuccess = await widget.resendOtp();
              if (!isSuccess) {
                showSnackbar(context, 'Error sending OTP');
                return;
              }
              showSnackbar(context, 'OTP sent successfully');
              reStartTimer();
              return;
              // final username = ref.read(userProvider).value!.userName!;
              // AuthVm().sendOtp(username, action: 3);
            },
          ),
        ),
        if (!allowResend)
          Text('Retry in ${timeLeft.toString()}s', style: styles.subtitle)
      ],
    );
  }
}
