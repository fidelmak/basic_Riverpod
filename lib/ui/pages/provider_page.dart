import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) => 42);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Center(
        child: Text(
          "the value is ${ref.watch(valueProvider)}",
          style: TextStyle(fontSize: 40),
        ),
      ),
      // body: Consumer(
      //     builder: (BuildContext context, WidgetRef ref, Widget? child) {
      //   return Center(
      //     child: Text(
      //       "the value is ${ref.watch(valueProvider)}",
      //       style: TextStyle(fontSize: 40),
      //     ),
      //   );
      // }),
    );
  }
}
