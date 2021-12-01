import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/main.dart';
import 'package:holiday/repository/holiday_repository_impl.dart';
import 'package:integration_test/integration_test.dart';

import 'stub/stub_holiday_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test the full app flow', (tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      provideHolidayRepository.overrideWithValue(StubHolidayRepository()),
    ], child: const MyApp()));

    await tester.pumpAndSettle();

    expect(find.text('My Request'), findsOneWidget);
    expect(find.text('Public holidays'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);
    expect(find.text('15'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
  });
}
