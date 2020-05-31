import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/modules/games/games_page.dart';

main() {
  testWidgets('GamesPage has title', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(GamesPage(title: 'Games')));
      final titleFinder = find.text('Games');
      expect(titleFinder, findsOneWidget);
  });
}
