// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:nubank_clone/main.dart';

void main() {
  testWidgets('Home page renders expected sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Nubank Clone'), findsOneWidget);
    expect(find.text('Descubra mais'), findsOneWidget);
    expect(find.text('Área Pix'), findsOneWidget);
  });
}
