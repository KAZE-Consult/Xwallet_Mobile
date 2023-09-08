import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xwallet/app/team/components/add_new_dealer.dart';
import '../../reuseables/app_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';

class TeamView extends StatelessWidget {
  const TeamView({super.key});
  static open(BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const TeamView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.accent.withOpacity(0.1),
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accent),
        title: Text(
          'Dealer Reps',
          style: bodyBold,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Create and manage your dealer representatives here.',
                textAlign: TextAlign.center,
                style: subtitle3,
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppButton(
            color: AppColors.accent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add),
                const SizedBox(width: 4),
                Text('Create Dealer Rep', style: bodyBoldLight),
              ],
            ),
            onTap: () {
              AddNewDealer.open(context);
            },
          ),
          const SizedBox(height: 16),
          const CupertinoSearchTextField(
            placeholder: 'Search sub-dealer',
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < 5; i++) ...[
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Emmanuel Abu-Ekpeshie'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text('emmanuelabu@gmail.com'),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text('Last login: '),
                      Text('23/10/2020'),
                    ],
                  ),
                ],
              ),
              trailing: Container(
                alignment: Alignment.center,
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green.withOpacity(0.1),
                ),
                child:
                    const Text('Online', style: TextStyle(color: Colors.green)),
              ),
            ),
            const Divider()
          ],
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
