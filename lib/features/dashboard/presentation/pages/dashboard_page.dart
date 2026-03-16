import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_snapshot_provider.dart';
import '../providers/privacy_mode_provider.dart';
import '../widgets/dashboard_alerts_section.dart';
import '../widgets/dashboard_budget_section.dart';
import '../widgets/dashboard_quick_actions_section.dart';
import '../widgets/dashboard_recent_activity_section.dart';
import '../widgets/dashboard_summary_section.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscured = ref.watch(privacyModeProvider);
    final dashboardState = ref.watch(dashboardSnapshotProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              ref.read(privacyModeProvider.notifier).toggle();
            },
            tooltip: 'Toggle Privacy Mode',
          ),
        ],
      ),
      body: dashboardState.when(
        data: (snapshot) => SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dashboardSnapshotProvider);
              ref.invalidate(privacyModeProvider);
              await Future<void>.delayed(const Duration(milliseconds: 300));
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                DashboardSummarySection(snapshot: snapshot, obscure: isObscured),
                const SizedBox(height: 12),
                DashboardBudgetSection(snapshot: snapshot, obscure: isObscured),
                const SizedBox(height: 12),
                DashboardAlertsSection(alerts: snapshot.alerts),
                const SizedBox(height: 12),
                const DashboardQuickActionsSection(),
                const SizedBox(height: 12),
                DashboardRecentActivitySection(
                  transactions: snapshot.recentTransactions,
                  obscure: isObscured,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Unable to load dashboard right now. Please try again shortly.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
