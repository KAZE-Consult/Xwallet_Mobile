import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../model/transaction_model.dart';
import '../../../reuseables/trans_type_view.dart';
import '../../../utils/text_styles.dart';

class TransactionItemView extends ConsumerWidget {
  const TransactionItemView({
    super.key,
    required this.transaction,
  });

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = TextStyles(ref);
    final currency = NumberFormat("#,##0", "en_US");

    return ListTile(
      // horizontalTitleGap: 0,
      leading: TransTypeView(transType: transaction.tranType ?? ''),
      title: Text(transaction.naration ?? '', style: styles.body),
      subtitle: Text(
        DateFormat('MMM dd, yyyy').format(transaction.transactionDate!),
        style: styles.subtitle2,
      ),
      trailing: Text(
        '${transaction.tranType == 'C' ? '+ ' : '- '}₦${currency.format(transaction.amount)}',
        style: styles.bodyBold,
      ),
    );
  }
}
