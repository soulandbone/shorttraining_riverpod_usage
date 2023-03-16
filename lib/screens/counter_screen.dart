import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class CounterScreen extends ConsumerWidget {
  static const routeName = '/counter';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);

    ref.listen(counterProvider, (prev, next) {
      if (next == 5) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Warning'),
                  content:
                      const Text('You have reached the counter amount of 5'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Ok')),
                  ],
                ));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (ref.read(counterProvider.notifier).state += 1);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
