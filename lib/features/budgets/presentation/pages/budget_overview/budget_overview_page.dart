import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/budgets_provider.dart';
import 'package:student_finance_guardian/l10n/generated/app_localizations.dart';

class BudgetOverviewPage extends ConsumerWidget {
  const BudgetOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetsState = ref.watch(budgetsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.budgetsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Create Budget',
            onPressed: () {
              // TODO: Navigate to create budget
            },
          ),
        ],
      ),
      body: budgetsState.when(
        data: (budgets) {
          if (budgets.isEmpty) {
            return Center(child: Text(l10n.budgetsNoBudgets));
          }

          return ListView.builder(
            itemCount: budgets.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final budget = budgets[index];
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${l10n.budgetsCategory}: ${budget.categoryId}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: budget.progressPercentage,
                        backgroundColor: Colors.grey[200],
                        color: budget.progressPercentage > 0.9 ? Colors.red : Colors.green,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.budgetsSpent('\$${budget.currentAmount.toStringAsFixed(2)}')),
                          Text(l10n.budgetsLeft('\$${budget.remaining.toStringAsFixed(2)}')),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Text(l10n.errorGeneric),
        ),
      ),
    );
  }
}
