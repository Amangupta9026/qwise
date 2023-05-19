import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class ObscureTextNotifier extends Notifier<bool> {
  final bool _obscureText = false;

  bool get obscureText => _obscureText;

  void toggle() {
    state = !state;
  }

  @override
  bool build() {
    return _obscureText;
  }
}

final obscureTextProvider = NotifierProvider<ObscureTextNotifier, bool>(() {
  return ObscureTextNotifier();
});
