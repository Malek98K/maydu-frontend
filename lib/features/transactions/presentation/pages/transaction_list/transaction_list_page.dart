import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/transactions_provider.dart';
import 'package:student_finance_guardian/l10n/generated/app_localizations.dart';

class TransactionListPage extends ConsumerWidget {
  const TransactionListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsState = ref.watch(transactionsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.transactionsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: l10n.transactionsAddTooltip,
            onPressed: () {
              // TODO: Navigate to add transaction
            },
          ),
        ],
      ),
      body: transactionsState.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return Center(child: Text(l10n.transactionsNoTransactions));
          }

          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tx = transactions[index];
              final isIncome = tx.type == 'income';
              
              return ListTile(
                leading: Icon(
                  isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                  color: isIncome ? Colors.green : Colors.red,
                ),
                title: Text(tx.notes ?? 'Transaction'), 
                subtitle: Text(tx.date.toLocal().toString().split(' ')[0]),
                trailing: Text(
                  '\$${tx.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: isIncome ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
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
