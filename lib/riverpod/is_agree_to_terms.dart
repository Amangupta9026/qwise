import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsAgreeToTermsNotifier extends Notifier<bool> {
  final bool _isAgreeToTermsAndConditions = false;

  bool get isAgreeToTermsAndConditions => _isAgreeToTermsAndConditions;

  void toggle() {
    state = !state;
  }

  @override
  bool build() {
    return isAgreeToTermsAndConditions;
  }
}

final isAgreeToTermsProvider =
    NotifierProvider<IsAgreeToTermsNotifier, bool>(() {
  return IsAgreeToTermsNotifier();
});
