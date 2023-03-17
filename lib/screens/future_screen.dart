import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auxiliars/api_service.dart';

class FutureScreen extends ConsumerWidget {
  static const routeName = '/future';

  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureValue = ref.watch(futureValueProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
            child: futureValue.when(
                data: (value) => Text(value),
                error: ((error, stackTrace) =>
                    const Text('Something went wrong')),
                loading: () => const Text('Data is Loading'))));
  }
}
