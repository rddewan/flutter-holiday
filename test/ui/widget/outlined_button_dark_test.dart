import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/ui/widget/outlined_button_dark.dart';

void main() {
  testWidgets('given button text when rendered then find text', (tester) async {
    const text = Text("Leave");
    await tester.pumpWidget(
      MaterialApp(
          home: OutlinedButtonDark(
              onPress: () {}, txtLabel: text, faIcon: const Icon(Icons.add))),
    );

    expect(find.text("Leave"), findsOneWidget);
  });

  testWidgets('given button icon when button rendered then find the icon',
      (tester) async {
    const text = Text("Leave");
    const icon = Icon(Icons.switch_right_sharp);
    await tester.pumpWidget(MaterialApp(
      home: OutlinedButtonDark(onPress: () {}, txtLabel: text, faIcon: icon),
    ));

    expect(find.byIcon(Icons.switch_right_sharp), findsOneWidget);
  });
}
