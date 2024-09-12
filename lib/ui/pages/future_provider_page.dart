import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gr_analysis/ui/model/model.dart';

import '../services/api_service.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose<Suggestions>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestions();
});

class FutureStateProviderPage extends ConsumerWidget {
  const FutureStateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(" Future  Provider"),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider.future),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: ListView(
            children: [
              suggestionRef.when(data: (data) {
                return Center(
                  child: Text(
                    data.activity,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                );
              }, error: (error, _) {
                return Text(error.toString());
              }, loading: () {
                return CircularProgressIndicator();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
