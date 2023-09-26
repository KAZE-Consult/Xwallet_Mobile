// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/sub_dealers/vm/sub_dealers_vm.dart';
import 'package:xwallet/reuseables/app_button.dart';
import 'package:xwallet/reuseables/app_dropdown_field.dart';
import 'package:xwallet/reuseables/telco_icon.dart';
import 'package:xwallet/reuseables/text_area_field.dart';
import 'package:xwallet/utils/app_colors.dart';
import 'package:xwallet/utils/enums.dart';
import 'package:xwallet/utils/extensions.dart';
import 'package:xwallet/utils/helper_functions.dart';
import 'package:xwallet/utils/text_styles.dart';

class AddSubDealer extends ConsumerStatefulWidget {
  const AddSubDealer({super.key});
  static Future<bool?> open(BuildContext context) {
    return Navigator.push<bool?>(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const AddSubDealer();
        },
      ),
    );
  }

  @override
  ConsumerState<AddSubDealer> createState() => _AddSubDealerState();
}

class _AddSubDealerState extends ConsumerState<AddSubDealer> {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AppDropDownItem? selectedTelco;
  @override
  Widget build(BuildContext context) {
    final colors = AppColors(ref);
    final styles = TextStyles(ref);
    final vm = ref.read(subDealersVm.notifier);
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: IconThemeData(color: colors.accent),
        title: Text('Add Sub-dealer', style: styles.bodyBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              'To add a new sub-dealer, fill in the information below.',
              textAlign: TextAlign.center,
              style: styles.subtitle3,
            ),
          ),
          const SizedBox(height: 16),
          AppDropDownButtonField(
            text: selectedTelco?.title.data ?? 'Select Service Provider',
            icon: selectedTelco?.icon,
            options: Telco.values.map((e) {
              return AppDropDownItem(
                icon: TelcoIcon(id: e.getId()),
                title: Text(e.toString(), style: styles.body),
              );
            }).toList(),
            onSelect: (value) {
              selectedTelco = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          //
          Text('Subdealer Phone', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            controller: phoneNoController,
            hintText: 'xxxxxxxxxxx',
            maxLength: 11,
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          //
          Text('Subdealer Email', style: styles.subtitle),
          const SizedBox(height: 4),
          AppTextField(
            controller: emailController,
            hintText: 'aaa@b.com',
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) {
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 24),
          AppButton(
            isEnabled: validateInput(),
            color: colors.accent,
            child: Text('Send Invite', style: bodyBoldLight),
            onTap: () async {
              final isSuccess = await vm.inviteSubdealer(
                emailController.text,
                phoneNoController.text,
                onError: (value) {
                  showSnackbar(context, value);
                },
              );
              if (!isSuccess) return;
              //show success message

              showSnackbar(context, 'Success', isSuccess: true);
              Navigator.pop(context, true);
            },
          )
        ],
      ),
    );
  }

  bool validateInput() {
    if (phoneNoController.text.length < 11) return false;
    if (emailController.text.length < 4) return false;
    if (selectedTelco == null) return false;
    if (!emailController.text.isValidEmail()) return false;
    return true;
  }
}
