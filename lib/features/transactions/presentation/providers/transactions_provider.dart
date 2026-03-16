import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/transaction_repository.dart';
import '../../domain/transaction.dart' as app_domain;

final transactionsProvider = AsyncNotifierProvider<TransactionsNotifier, List<app_domain.Transaction>>(() {
  return TransactionsNotifier();
});

class TransactionsNotifier extends AsyncNotifier<List<app_domain.Transaction>> {
  late final TransactionRepository _repository;

  @override
  FutureOr<List<app_domain.Transaction>> build() async {
    _repository = ref.watch(transactionRepositoryProvider);
    return _fetchTransactions();
  }

  Future<List<app_domain.Transaction>> _fetchTransactions() async {
    return await _repository.getTransactions();
  }

  Future<void> addTransaction(app_domain.Transaction transaction) async {
    // Optimistic UI update or refresh
    state = const AsyncValue.loading();
    try {
      await _repository.addTransaction(transaction);
      // OWASP SCP: Ensure data state is consistently refreshed from authority
      state = AsyncValue.data(await _fetchTransactions());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
