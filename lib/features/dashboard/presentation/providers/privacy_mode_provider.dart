import 'package:flutter_riverpod/flutter_riverpod.dart';

final privacyModeProvider = NotifierProvider<PrivacyModeNotifier, bool>(() {
  return PrivacyModeNotifier();
});

class PrivacyModeNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void toggle() {
    state = !state;
  }
}
