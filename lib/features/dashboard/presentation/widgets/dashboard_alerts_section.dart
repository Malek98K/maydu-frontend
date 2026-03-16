import 'package:flutter/material.dart';
import '../../domain/dashboard_snapshot.dart';

class DashboardAlertsSection extends StatelessWidget {
  final List<DashboardAlert> alerts;

  const DashboardAlertsSection({
    super.key,
    required this.alerts,
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
              'Alerts',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            ...alerts.map(
              (alert) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _backgroundColor(alert.level),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(_icon(alert.level), color: _foregroundColor(alert.level), size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alert.title,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: _foregroundColor(alert.level),
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              alert.message,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: _foregroundColor(alert.level),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _backgroundColor(DashboardAlertLevel level) {
    switch (level) {
      case DashboardAlertLevel.critical:
        return Colors.red.shade50;
      case DashboardAlertLevel.warning:
        return Colors.orange.shade50;
      case DashboardAlertLevel.info:
        return Colors.blue.shade50;
    }
  }

  Color _foregroundColor(DashboardAlertLevel level) {
    switch (level) {
      case DashboardAlertLevel.critical:
        return Colors.red.shade800;
      case DashboardAlertLevel.warning:
        return Colors.orange.shade800;
      case DashboardAlertLevel.info:
        return Colors.blue.shade800;
    }
  }

  IconData _icon(DashboardAlertLevel level) {
    switch (level) {
      case DashboardAlertLevel.critical:
        return Icons.error_outline;
      case DashboardAlertLevel.warning:
        return Icons.warning_amber_outlined;
      case DashboardAlertLevel.info:
        return Icons.info_outline;
    }
  }
}
