import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/utils/text_styles.dart';
import '../utils/app_colors.dart';

class SuccessScreen extends ConsumerWidget {
  const SuccessScreen({super.key});
  static open(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const SuccessScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors(ref);
    return Scaffold(
      backgroundColor: colors.white,
      body: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Colors.pink,
            colors.accent,
          ], stops: const [
            0.3,
            1
          ]),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const SizedBox(height: 20),
              LottieBuilder.asset('assets/lotties/success.json', repeat: false),
              const SizedBox(height: 20),
              const Text(
                "Transaction Successful!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              AppButton(
                color: colors.white.withOpacity(0.1),
                size: const Size(double.infinity, 45),
                child: Text('Continue', style: bodyBoldLight),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
