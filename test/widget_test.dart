import 'package:flutter_test/flutter_test.dart';
import 'package:xingxu_app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const XingXuApp());
    await tester.pumpAndSettle();
    expect(find.text('今日灵感计划'), findsOneWidget);
  });
}
