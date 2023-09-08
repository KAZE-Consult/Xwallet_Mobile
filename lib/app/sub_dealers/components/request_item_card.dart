import 'package:flutter/material.dart';
import 'package:xwallet/app/sub_dealers/components/approve_request_modal.dart';

import '../../../reuseables/app_button.dart';
import '../../../reuseables/app_dropdown_field.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class RequestItemCard extends StatelessWidget {
  const RequestItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.boxFill,
          border: Border.all(color: AppColors.boxStrokeColor),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 8),
              Text('Remilekun Airtimes'),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            leading: const CircleAvatar(),
            title: Text(
              'NGN 150,000',
              style: bodyBold.copyWith(color: Colors.green),
            ),
            subtitle: const Text(
              'Available balance',
              style: TextStyle(color: Colors.green),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Request Amount: ',
                style: subtitle3,
              ),
              Text(
                'NGN 50,000',
                style: bodyBold,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Request Date: ',
                style: subtitle3,
              ),
              Text(
                '28/7/2023',
                style: body,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          Text('Add Comment', style: subtitle3),
          const SizedBox(height: 4),
          AppDropDownButtonField(
            backgroundColor: Colors.black.withOpacity(0.05),
            text: 'Select comment from dropdown',
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                color: AppColors.accent.withOpacity(0.1),
                size: const Size(100, 40),
                child: Text(
                  'Decline',
                  style: subtitle.copyWith(color: AppColors.accent),
                ),
                onTap: () {},
              ),
              const SizedBox(width: 8),
              AppButton(
                color: AppColors.accent,
                size: const Size(100, 40),
                child: Text(
                  'Approve',
                  style: subtitle.copyWith(color: AppColors.white),
                ),
                onTap: () {
                  ApproveRequestModal.open(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
