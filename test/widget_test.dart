import 'package:flutter_test/flutter_test.dart';
import 'package:claims_desk_mobile/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ClaimsDeskApp());
    expect(find.text('Claims Desk'), findsOneWidget);
    // Advance timer past splash duration so fake_async timer completes
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
