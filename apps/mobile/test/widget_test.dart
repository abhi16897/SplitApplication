import 'package:flutter_test/flutter_test.dart';
import 'package:split_app/main.dart';

void main() {
  testWidgets('shows the Split welcome screen', (tester) async {
    await tester.pumpWidget(const SplitApp());

    expect(find.text('Shared expenses, made simple.'), findsOneWidget);
    expect(find.text('Android · iOS · Web'), findsOneWidget);
  });
}
