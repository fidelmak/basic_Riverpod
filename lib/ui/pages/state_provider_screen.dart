import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider.autoDispose<int>((ref) => 672);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(valueStateProvider);
    ref.listen(valueStateProvider, (prev, curr) {
      if (curr == 700) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You have reached the max 700")));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(" State Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "the value is of the state is ${state}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              color: Colors.redAccent,
              child: TextButton(
                  onPressed: () {
                    ref.read(valueStateProvider.notifier).state++;
                  },
                  child: Text(
                    "change state",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              color: Colors.redAccent,
              child: TextButton(
                  onPressed: () {
                    ref.invalidate(valueStateProvider);
                  },
                  child: Text(
                    "Invalidate",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
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
