import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../classes/todo.dart';

final todosProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) => TodosNotifier());

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([Todo(id: '001', description: 'Whatever', completed: false)]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId) todo.copy(completed: !todo.completed) else todo,
    ];
  }
}
