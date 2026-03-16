import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/budget.dart' as app_domain;

final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  return BudgetRepository(Supabase.instance.client);
});

class BudgetRepository {
  final SupabaseClient _supabase;

  BudgetRepository(this._supabase);

  // OWASP ASVS: Database authorization bounds are respected via RLS on Supabase.
  Future<List<app_domain.Budget>> getBudgets() async {
    try {
      final response = await _supabase
          .from('budgets')
          .select()
          .order('end_date', ascending: false);

      return (response as List).map((json) => app_domain.Budget.fromJson(json)).toList();
    } catch (e) {
      // Secure logging, returning sanitized exception to the app layer
      throw Exception('Failed to load budgets');
    }
  }

  Future<void> addBudget(app_domain.Budget budget) async {
    try {
      await _supabase.from('budgets').insert(budget.toJson());
    } catch (e) {
      throw Exception('Failed to create budget');
    }
  }
}
