import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_finance_guardian/l10n/generated/app_localizations.dart';

final privacyModeProvider = NotifierProvider<PrivacyModeNotifier, bool>(() {
  return PrivacyModeNotifier();
});

class PrivacyModeNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void toggle() {
    state = !state;
  }
}

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscured = ref.watch(privacyModeProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboardTitle),
        actions: [
          IconButton(
            icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              ref.read(privacyModeProvider.notifier).toggle();
            },
            tooltip: 'Toggle Privacy Mode',
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.dashboardTotalBalance,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                isObscured ? '****' : '\$1,250.00',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                l10n.dashboardRecentActivity,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(
                child: Center(
                  child: Text(l10n.dashboardNoActivity),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
