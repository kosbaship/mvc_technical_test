import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ossos_technical_test/common/enum/annimation_type.dart';
import 'package:ossos_technical_test/common/widgets/ossos_filled_button.dart';
import 'package:ossos_technical_test/common/widgets/ossos_text_button.dart';
import 'package:ossos_technical_test/common/widgets/ossos_text_field.dart';
import 'package:ossos_technical_test/features/first/view/widgets/small_shape.dart';
import 'package:ossos_technical_test/features/home/view/home_screen.dart';
import 'package:ossos_technical_test/features/second/model/pokemon.dart';
import 'package:ossos_technical_test/features/second/view/widgets/pokemon_card.dart';
import 'package:ossos_technical_test/features/spalsh_screen.dart';

import 'package:ossos_technical_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const myName = "Abd-Alazeez";
  var myNameFinder = find.text(myName);
  var emptyTextFinder = find.text("You have not entered name yet");

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (tester) async {
      app.main();
      await tester.pump();
      expect(find.byType(FlutterLogo), findsOneWidget);

      await tester.pumpAndSettle();
      expect(find.byType(SplashScreen), findsNothing);
      expect(find.byType(HomeScreen), findsOneWidget);

      expect(find.byType(OSTextButton), findsNWidgets(1));
      expect(find.byType(OSFilledButton), findsNWidgets(2));
      var textFiledFinder = find.byType(OSTextField);
      expect(textFiledFinder, findsOneWidget);
      expect(emptyTextFinder, findsOneWidget);
      await tester.enterText(textFiledFinder, myName);
      await tester.pump();
      expect(emptyTextFinder, findsNothing);
      expect(myNameFinder, findsNWidgets(2));
      await tester.tap(find.byType(OSFilledButton).at(0));
      await tester.pumpAndSettle();
      var thirdShape = find.byKey(Key(AnimationType.circleShape.name));
      thirdShape.isVisible();
      await tester.ensureVisible(thirdShape);
      await tester.pumpAndSettle();
      expect(find.text("Hi $myName"), findsOneWidget);
      await tester.tap(thirdShape);
      await tester.pumpAndSettle();
      await tester.back();
      await tester.pumpAndSettle();


      await tester.tap(find.byType(OSFilledButton).at(1));
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
          find.byType(CircularProgressIndicator), find.byType(PagedListView<int, Pokemon>), const Offset(0, -200));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await tester.back();
      await tester.pumpAndSettle();
    });
  });
}

extension on WidgetTester {
  Future<void> back() async {
    final NavigatorState navigator = state(find.byType(Navigator));
    navigator.pop();
    await pump();
  }
}

extension FinderExtension on Finder {
  bool isVisible() {
    return hitTestable().evaluate().isNotEmpty;
  }
}
