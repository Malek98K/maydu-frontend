String formatCurrency(double value, {required bool obscure}) {
  if (obscure) return '••••';

  final isNegative = value < 0;
  final absolute = value.abs();
  final parts = absolute.toStringAsFixed(2).split('.');
  final whole = parts[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );

  final amount = '\$$whole.${parts[1]}';
  return isNegative ? '-$amount' : amount;
}

String formatShortDate(DateTime value) {
  final month = value.month.toString().padLeft(2, '0');
  final day = value.day.toString().padLeft(2, '0');
  return '$month/$day';
}
