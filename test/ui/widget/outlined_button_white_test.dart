import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/ui/widget/outlined_button_dark.dart';
import 'package:holiday/ui/widget/outlined_button_white.dart';

void main() {
  testWidgets('given white button when render button then find the text',
      (tester) async {
    const titleLable = "Switch";

    await tester.pumpWidget(MaterialApp(
      home: OutlinedButtonLight(
          onPressed: () {},
          txtLabel: const Text(titleLable),
          faIcon: const Icon(Icons.switch_right_sharp)),
    ));

    expect(find.text(titleLable), findsOneWidget);
  });

  testWidgets('given white button icon when render button find the icon',
      (tester) async {
    const icon = Icon(Icons.switch_right_sharp);
    const titleLable = "Switch";
    await tester.pumpWidget(MaterialApp(
        home: OutlinedButtonLight(
            onPressed: () {}, txtLabel: const Text(titleLable), faIcon: icon)));

    expect(find.byIcon(Icons.switch_right_sharp), findsOneWidget);
  });
}
