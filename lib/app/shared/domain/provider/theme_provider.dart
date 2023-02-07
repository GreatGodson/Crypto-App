import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}

final darkModeProvider =
    StateNotifierProvider.autoDispose<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
