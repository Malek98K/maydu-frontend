import 'package:flutter/material.dart';
import '../../../transactions/domain/transaction.dart';
import 'dashboard_formatters.dart';

class DashboardRecentActivitySection extends StatelessWidget {
  final List<Transaction> transactions;
  final bool obscure;

  const DashboardRecentActivitySection({
    super.key,
    required this.transactions,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            if (transactions.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'No recent activity yet.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              )
            else
              ...transactions.map(
                (transaction) {
                  final isIncome = transaction.type == 'income';
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: isIncome ? Colors.green.shade50 : Colors.red.shade50,
                      child: Icon(
                        isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                        color: isIncome ? Colors.green : Colors.red,
                        size: 18,
                      ),
                    ),
                    title: Text(transaction.notes ?? 'Transaction'),
                    subtitle: Text(formatShortDate(transaction.date)),
                    trailing: Text(
                      formatCurrency(transaction.amount, obscure: obscure),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isIncome ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
