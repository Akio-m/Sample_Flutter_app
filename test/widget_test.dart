import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';

void main() {
  testWidgets('flutter_app sample test!', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());
    await tester.pump();

    expect(find.text('Apple:200yen'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);

  });
}