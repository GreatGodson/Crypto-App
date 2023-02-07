import 'package:crypto_app/app/shared/domain/provider/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DarkModeNotifier darkModeNotifier;

  setUp(() {
    darkModeNotifier = DarkModeNotifier();
  });
  test('DarkModeNotifier returns true', () {
    // ignore: invalid_use_of_protected_member
    final initialState = darkModeNotifier.state;
    expect(initialState, true);
    darkModeNotifier.toggle();

    // ignore: invalid_use_of_protected_member
    final toggledState = darkModeNotifier.state;
    expect(toggledState, false);
  });
}
