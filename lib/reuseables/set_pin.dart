// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/app/home/components/enter_otp_set_pin.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/pin_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/extensions.dart';
import 'package:xwallet/utils/helper_functions.dart';
import 'package:xwallet/utils/text_styles.dart';

class SetPin extends ConsumerStatefulWidget {
  const SetPin({super.key, required this.force});
  final bool force;
  static Future<bool?> open(BuildContext context, bool force) {
    return Navigator.push<bool?>(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return SetPin(force: force);
        },
      ),
    );
  }

  @override
  ConsumerState<SetPin> createState() => _SetOtpState();
}

class _SetOtpState extends ConsumerState<SetPin> {
  bool isLoading = false;
  String pin = '';
  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        systemOverlayStyle: colors.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Set Pin', style: styles.bodyBold),
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
                'You need to set a 4 digit pin in order to continue with this transaction',
                textAlign: TextAlign.center,
                style: styles.subtitle3,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Text(
              '4 Digit Pin',
              style: styles.body,
            ),
          ),
          const SizedBox(height: 16),
          PinField(
            onChanged: (otp) {
              pin = otp;
              setState(() {});
            },
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: AppButton(
              isEnabled: pin.length > 3,
              color: colors.accent,
              size: const Size(double.infinity, 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Continue', style: styles.bodyBoldLight),
                ],
              ),
              onTap: () async {
                const storage = FlutterSecureStorage();
                final user = ref.read(userProvider).value!;
                isLoading = true;
                setState(() {});
                await storage.write(key: 'username', value: user.userName);
                final isSuccess = await AuthVm().sendOtp(action: 3);
                isLoading = false;
                if (!isSuccess) {
                  showSnackbar(context, 'An error occured, please try again');
                  return;
                }
                setState(() {});
                EnterOtpSetPin.open(context, pin);
                // goto otp page
              },
            ),
          ),
        ],
      ),
    ).showLoading(isLoading);
  }
}
