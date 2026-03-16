import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardQuickActionsSection extends StatelessWidget {
  const DashboardQuickActionsSection({super.key});

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
              'Quick Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ActionChip(
                  label: 'Transactions',
                  icon: Icons.receipt_long_outlined,
                  onTap: () => context.go('/transactions'),
                ),
                _ActionChip(
                  label: 'Budgets',
                  icon: Icons.pie_chart_outline,
                  onTap: () => context.go('/budgets'),
                ),
                _ActionChip(
                  label: 'Security',
                  icon: Icons.security_outlined,
                  onTap: () => context.go('/profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18, color: const Color(0xFF1E3A8A)),
      label: Text(label),
      onPressed: onTap,
      side: BorderSide(color: Colors.grey.shade300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
    );
  }
}
