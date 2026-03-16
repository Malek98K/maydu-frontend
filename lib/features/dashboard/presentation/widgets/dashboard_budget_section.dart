import 'package:flutter/material.dart';
import '../../domain/dashboard_snapshot.dart';
import 'dashboard_formatters.dart';

class DashboardBudgetSection extends StatelessWidget {
  final DashboardSnapshot snapshot;
  final bool obscure;

  const DashboardBudgetSection({
    super.key,
    required this.snapshot,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    final usagePercent = (snapshot.budgetUsage * 100).round();
    final barColor = snapshot.budgetUsage >= 1
        ? Colors.red
        : snapshot.budgetUsage >= 0.9
            ? Colors.orange
            : const Color(0xFF1E3A8A);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Budget Status',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Used: ${formatCurrency(snapshot.budgetUsed, obscure: obscure)}'),
                Text('Remaining: ${formatCurrency(snapshot.budgetRemaining, obscure: obscure)}'),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                minHeight: 10,
                value: snapshot.budgetUsage,
                backgroundColor: Colors.grey[200],
                color: barColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$usagePercent% of your monthly budget used',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
