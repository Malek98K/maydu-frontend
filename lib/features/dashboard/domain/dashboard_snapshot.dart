import '../../budgets/domain/budget.dart';
import '../../transactions/domain/transaction.dart';

enum DashboardAlertLevel { info, warning, critical }

class DashboardAlert {
  final DashboardAlertLevel level;
  final String title;
  final String message;

  const DashboardAlert({
    required this.level,
    required this.title,
    required this.message,
  });
}

class DashboardSnapshot {
  final double totalBalance;
  final double monthlyIncome;
  final double monthlyExpenses;
  final double budgetTotal;
  final double budgetUsed;
  final double budgetRemaining;
  final double budgetUsage;
  final double forecastMonthEndBalance;
  final int daysRemainingThisMonth;
  final List<DashboardAlert> alerts;
  final List<Transaction> recentTransactions;
  final List<Budget> activeBudgets;

  const DashboardSnapshot({
    required this.totalBalance,
    required this.monthlyIncome,
    required this.monthlyExpenses,
    required this.budgetTotal,
    required this.budgetUsed,
    required this.budgetRemaining,
    required this.budgetUsage,
    required this.forecastMonthEndBalance,
    required this.daysRemainingThisMonth,
    required this.alerts,
    required this.recentTransactions,
    required this.activeBudgets,
  });
}
