import 'package:esilv_shop/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Panier Esilv Shop'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Votre panier total est de"),
                Text(
                  ref.read(cartProvider.notifier).priceInEuros,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: products.isEmpty
                ? Center(child: Text("Votre panier est vide"))
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(products[index].title, maxLines: 2),
                      subtitle: Text(
                        products[index].getPrice(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Image.network(products[index].image, width: 80),
                      trailing: TextButton(
                        onPressed: () => ref
                            .read(cartProvider.notifier)
                            .remove(products[index]),
                        child: Text("Retirer".toUpperCase()),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: () {}, child: Text("Commander")),
            ),
          ),
        ],
      ),
    );
  }
}
