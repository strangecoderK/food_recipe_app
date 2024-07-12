import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

void main() {
  testWidgets('big_button component test', (WidgetTester tester) async {
    String text = 'test';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BigButton(text: text),
        ),
      ),
    );
    final initialContainer = tester.widget<Container>(
      find.descendant(
        of: find.byType(BigButton),
        matching: find.byWidgetPredicate((w) => w is Container),
      ),
    );
    expect((initialContainer.decoration as BoxDecoration).color,
        equals(ColorStyles.primary100));
    await tester.press(find.byType(BigButton));
    await tester.pump();
    final pressedContainer = tester.widget<Container>(
      find.descendant(
        of: find.byType(BigButton),
        matching: find.byWidgetPredicate((w) => w is Container),
      ),
    );
    expect((pressedContainer.decoration as BoxDecoration).color,
        equals(ColorStyles.gray4));
  });
}
