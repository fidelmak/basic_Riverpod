import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamRef = ref.watch(streamValueProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(" Stream  Provider"),
        ),
        body: Center(
          child: streamRef.when(data: (int data) {
            return Text(
              data.toString(),
              style: TextStyle(color: Colors.redAccent, fontSize: 34),
            );
          }, error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          }, loading: () {
            return CircularProgressIndicator();
          }),
        ));
  }
}
