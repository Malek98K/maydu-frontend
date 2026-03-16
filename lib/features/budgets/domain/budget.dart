class Budget {
  final String id;
  final String categoryId;
  final double limitAmount;
  final double currentAmount; // Derived or fetched
  final DateTime startDate;
  final DateTime endDate;

  Budget({
    required this.id,
    required this.categoryId,
    required this.limitAmount,
    this.currentAmount = 0.0,
    required this.startDate,
    required this.endDate,
  });

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      limitAmount: (json['limit_amount'] as num).toDouble(),
      currentAmount: json.containsKey('current_amount') ? (json['current_amount'] as num).toDouble() : 0.0,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'limit_amount': limitAmount,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
    };
  }

  double get remaining => limitAmount - currentAmount;
  double get progressPercentage => limitAmount > 0 ? (currentAmount / limitAmount).clamp(0.0, 1.0) : 0.0;
}
