import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/budget_repository.dart';
import '../../domain/budget.dart' as app_domain;

final budgetsProvider = AsyncNotifierProvider<BudgetsNotifier, List<app_domain.Budget>>(() {
  return BudgetsNotifier();
});

class BudgetsNotifier extends AsyncNotifier<List<app_domain.Budget>> {
  late final BudgetRepository _repository;

  @override
  FutureOr<List<app_domain.Budget>> build() async {
    _repository = ref.watch(budgetRepositoryProvider);
    return _fetchBudgets();
  }

  Future<List<app_domain.Budget>> _fetchBudgets() async {
    return await _repository.getBudgets();
  }

  Future<void> addBudget(app_domain.Budget budget) async {
    state = const AsyncValue.loading();
    try {
      await _repository.addBudget(budget);
      state = AsyncValue.data(await _fetchBudgets());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
