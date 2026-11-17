import 'package:esilv_shop/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts on product list', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: EsilvShop()));
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });
}
