import 'package:crypto_app/app/modules/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: MyThemes.lightTheme,
        // darkTheme: MyThemes.darkTheme,
        // themeMode: ThemeMode.dark,
        home: HomeScreen(),
      ),
    );
  }

  testWidgets('smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createWidgetUnderTest());
    // await tester.runAsync(() => Future.delayed(const Duration(seconds: 10)));
    // await tester.pumpAndSettle();
    // expect(find.byKey(const Key('list_view_builder')), findsOneWidget);
    expect(find.byKey(const Key('switch_key')), findsOneWidget);
  });
}
