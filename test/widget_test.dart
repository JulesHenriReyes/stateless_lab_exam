import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';

void main() {
  testWidgets('renders shopping cart with all items without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Place Order'), findsOneWidget);
    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('USB-C Hub'), findsOneWidget);
    expect(find.text('Laptop Stand'), findsOneWidget);
    expect(find.text('STUDENT10'), findsOneWidget);
  });

  testWidgets('taps all interactive buttons and logs console messages', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // 1. Back button
    await tester.tap(find.byIcon(CupertinoIcons.chevron_back));
    await tester.pump();

    // 2. Cart badge
    await tester.tap(find.byIcon(CupertinoIcons.bag_fill));
    await tester.pump();

    // 3. Edit delivery address
    await tester.tap(find.text('Edit'));
    await tester.pump();

    // 4. Cart item actions - Trash
    final trashButtons = find.byIcon(CupertinoIcons.trash);
    for (int i = 0; i < trashButtons.evaluate().length; i++) {
      await tester.tap(trashButtons.at(i));
      await tester.pump();
    }

    // 5. Cart item actions - Decrease
    final minusButtons = find.byIcon(CupertinoIcons.minus);
    for (int i = 0; i < minusButtons.evaluate().length; i++) {
      await tester.tap(minusButtons.at(i));
      await tester.pump();
    }

    // 6. Cart item actions - Increase
    final plusButtons = find.byIcon(CupertinoIcons.plus);
    for (int i = 0; i < plusButtons.evaluate().length; i++) {
      await tester.tap(plusButtons.at(i));
      await tester.pump();
    }

    // 7. Voucher card
    await tester.tap(find.text('STUDENT10'));
    await tester.pump();

    // 8. Place order button (scroll into view then tap)
    final placeOrderFinder = find.text('Place Order');
    await tester.ensureVisible(placeOrderFinder);
    await tester.pumpAndSettle();
    await tester.tap(placeOrderFinder);
    await tester.pump();
  });
}
