import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/cart_provider.dart';
import '../widgets/product_card.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotif = ref.watch(cartChangeNotifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Cart Items",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            // Fix: Constrain the ListView with Expanded
            child: ListView.builder(
              itemCount: cartNotif.product.length,
              itemBuilder: (context, index) {
                final product = cartNotif.product[index];
                return ProductCard(
                  product: product,
                  onPress: () {
                    ref
                        .read(cartChangeNotifier.notifier)
                        .removeProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 1),
                      content: Text(" ${product.name.toString()} , removed "),
                    ));
                  },
                  msg: 'Remove from cart',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
