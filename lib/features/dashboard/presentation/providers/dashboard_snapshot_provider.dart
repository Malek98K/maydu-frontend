import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../budgets/domain/budget.dart';
import '../../../budgets/presentation/providers/budgets_provider.dart';
import '../../../transactions/domain/transaction.dart';
import '../../../transactions/presentation/providers/transactions_provider.dart';
import '../../domain/dashboard_snapshot.dart';

final dashboardSnapshotProvider = Provider<AsyncValue<DashboardSnapshot>>((ref) {
  final transactionsState = ref.watch(transactionsProvider);
  final budgetsState = ref.watch(budgetsProvider);

  if (transactionsState.isLoading || budgetsState.isLoading) {
    return const AsyncValue.loading();
  }

  if (transactionsState.hasError || budgetsState.hasError) {
    return AsyncValue.error(
      Exception('Unable to load dashboard data.'),
      StackTrace.empty,
    );
  }

  final transactions = transactionsState.value ?? const <Transaction>[];
  final budgets = budgetsState.value ?? const <Budget>[];

  final monthlyIncome = transactions
      .where((transaction) => transaction.type == 'income')
      .fold<double>(0, (sum, transaction) => sum + transaction.amount);

  final monthlyExpenses = transactions
      .where((transaction) => transaction.type != 'income')
      .fold<double>(0, (sum, transaction) => sum + transaction.amount);

  final totalBalance = monthlyIncome - monthlyExpenses;

  final budgetTotal = budgets.fold<double>(0, (sum, budget) => sum + budget.limitAmount);
  final budgetUsed = budgets.fold<double>(0, (sum, budget) => sum + budget.currentAmount);
  final budgetRemaining = budgetTotal - budgetUsed;
  final budgetUsage = budgetTotal > 0 ? (budgetUsed / budgetTotal).clamp(0.0, 1.0) : 0.0;

  final now = DateTime.now();
  final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
  final daysElapsed = now.day.clamp(1, daysInMonth);
  final averageDailyExpense = monthlyExpenses / daysElapsed;
  final projectedExpenses = averageDailyExpense * daysInMonth;
  final forecastMonthEndBalance = monthlyIncome - projectedExpenses;
  final daysRemainingThisMonth = daysInMonth - now.day;

  final alerts = <DashboardAlert>[];

  if (budgetUsage >= 1) {
    alerts.add(
      const DashboardAlert(
        level: DashboardAlertLevel.critical,
        title: 'Budget exceeded',
        message: 'Your monthly budget has been exceeded. Review recent expenses now.',
      ),
    );
  } else if (budgetUsage >= 0.9) {
    alerts.add(
      const DashboardAlert(
        level: DashboardAlertLevel.warning,
        title: 'Budget nearing limit',
        message: 'You have used over 90% of your monthly budget.',
      ),
    );
  }

  final highExpenseCount = transactions
      .where((transaction) => transaction.type != 'income' && transaction.amount >= 300)
      .length;

  if (highExpenseCount > 0) {
    alerts.add(
      DashboardAlert(
        level: DashboardAlertLevel.warning,
        title: 'Unusual spending detected',
        message: '$highExpenseCount large expense transaction(s) were detected this month.',
      ),
    );
  }

  if (alerts.isEmpty) {
    alerts.add(
      const DashboardAlert(
        level: DashboardAlertLevel.info,
        title: 'All clear',
        message: 'No spending or security alerts right now.',
      ),
    );
  }

  final recentTransactions = [...transactions]
    ..sort((a, b) => b.date.compareTo(a.date));

  return AsyncValue.data(
    DashboardSnapshot(
      totalBalance: totalBalance,
      monthlyIncome: monthlyIncome,
      monthlyExpenses: monthlyExpenses,
      budgetTotal: budgetTotal,
      budgetUsed: budgetUsed,
      budgetRemaining: budgetRemaining,
      budgetUsage: budgetUsage,
      forecastMonthEndBalance: forecastMonthEndBalance,
      daysRemainingThisMonth: daysRemainingThisMonth,
      alerts: alerts,
      recentTransactions: recentTransactions.take(5).toList(),
      activeBudgets: budgets,
    ),
  );
});
