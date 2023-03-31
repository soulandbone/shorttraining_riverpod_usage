import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorttraining_riverpod_usage/providers/riverpod.dart';

import '../classes/todo.dart';

class ListScreen extends ConsumerWidget {
  static const routeName = '/list';

  ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: ListView(
          children: [
            for (final todo in todos)
              CheckboxListTile(
                  value: todo.completed,
                  onChanged: (value) =>
                      ref.read(todosProvider.notifier).toggle(todo.id),
                  title: Text(todo.description))
          ],
        ));
  }
}
