import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auxiliars/stream_service.dart';

class StreamScreen extends ConsumerWidget {
  static const routeName = '/stream';

  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamValueProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
            child: streamValue.when(
                data: (value) => Text(
                      value.toString(),
                      style: const TextStyle(fontSize: 34),
                    ),
                error: ((error, stackTrace) =>
                    const Text('Something went wrong')),
                loading: () => const Text('Data is Loading'))));
  }
}
