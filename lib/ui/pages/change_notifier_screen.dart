import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gr_analysis/ui/pages/cart_page.dart';

import '../model/product.dart';
import '../provider/cart_provider.dart';
import '../widgets/product_card.dart';

class ChangeNotifierScreen extends ConsumerWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Sky',
      description: 'A high-performance Sky',
      price: 1200.0,
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Product(
      id: '2',
      name: 'Flowers',
      description: 'A feature-packed Flowers',
      price: 800.0,
      imageUrl: 'https://picsum.photos/200/300?car',
    ),
    Product(
      id: '3',
      name: 'Nature Arts ',
      description: 'Beautiful Art piece',
      price: 200.0,
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Product(
      id: '4',
      name: 'smothies ',
      description: 'Beautiful Art piece',
      price: 200.0,
      imageUrl: 'https://picsum.photos/200/300',
    ),
  ];

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final cartNotif = ref.watch(cartChangeNotifier);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        actions: [
          Stack(children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((ctx) => CartPage())));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
            Positioned(
                // top: 50,
                left: 20,
                child: Text(
                  cartNotif.product.length.toString(),
                  style: TextStyle(color: Colors.white),
                )),
          ]),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onPress: () {
              ref.read(cartChangeNotifier.notifier).addProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                duration: Duration(seconds: 1),
                content: Text(" ${product.name.toString()} , added "),
              ));
            },
            msg: "Add to Cart",
          );
        },
      ),
    );
  }
}
