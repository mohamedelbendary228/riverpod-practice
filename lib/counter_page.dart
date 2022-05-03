import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<int> counter = ref.watch(counterProvider(3));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       ref.invalidate(counterProvider);
        //     },
        //     icon: const Icon(Icons.refresh),
        //   ),
        // ],
      ),
      body: Center(
        child: Text(
          counter
              .when(
                data: (value) => value,
                error: (e, _) => e,
                loading: () => 0,
              )
              .toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     ref.read(counterProvider.notifier).state++;
      //   },
      // ),
    );
  }
}
