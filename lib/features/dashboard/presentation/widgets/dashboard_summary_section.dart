import 'package:flutter/material.dart';
import '../../domain/dashboard_snapshot.dart';
import 'dashboard_formatters.dart';

class DashboardSummarySection extends StatelessWidget {
  final DashboardSnapshot snapshot;
  final bool obscure;

  const DashboardSummarySection({
    super.key,
    required this.snapshot,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E3A8A),
              ),
        ),
        const SizedBox(height: 12),
        _MetricCard(
          title: 'Total Balance',
          value: formatCurrency(snapshot.totalBalance, obscure: obscure),
          subtitle: 'Secure reserve + spending snapshot',
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _MetricCard(
                title: 'Month Income',
                value: formatCurrency(snapshot.monthlyIncome, obscure: obscure),
                subtitle: 'Current month',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _MetricCard(
                title: 'Month Expense',
                value: formatCurrency(snapshot.monthlyExpenses, obscure: obscure),
                subtitle: 'Current month',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _MetricCard(
          title: 'Forecast (Month End)',
          value: formatCurrency(snapshot.forecastMonthEndBalance, obscure: obscure),
          subtitle: '${snapshot.daysRemainingThisMonth} day(s) remaining this month',
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.subtitle,
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
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
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
