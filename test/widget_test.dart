import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

void main() {
  testWidgets('flutter_app sample test!', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());
    await tester.pump();

  });
}