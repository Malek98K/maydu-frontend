import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/transaction.dart' as app_domain;

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(Supabase.instance.client);
});

class TransactionRepository {
  final SupabaseClient _supabase;

  TransactionRepository(this._supabase);

  // OWASP ASVS: Fetch only data belonging to the authenticated user using RLS
  Future<List<app_domain.Transaction>> getTransactions() async {
    try {
      final response = await _supabase
          .from('transactions')
          .select()
          .order('date', ascending: false);

      return (response as List).map((json) => app_domain.Transaction.fromJson(json)).toList();
    } catch (e) {
      // Log error securely without exposing sensitive info
      throw Exception('Failed to load transactions');
    }
  }

  Future<void> addTransaction(app_domain.Transaction transaction) async {
    try {
      await _supabase.from('transactions').insert(transaction.toJson());
    } catch (e) {
      throw Exception('Failed to add transaction');
    }
  }
}
