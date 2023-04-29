import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/src/modules/todos/controllers/todos_controller.dart';
import 'package:provider_sample/src/modules/todos/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({required this.todo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.description ?? '----'),
      splashColor: Colors.purple.shade50,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      tileColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      leading: Icon(
        todo.isCompleted
            ? Icons.check_box_rounded
            : Icons.check_box_outline_blank_rounded,
        color: todo.isCompleted ? Colors.purple : Colors.grey,
      ),
      onTap: () {
        final controller = context.read<TodosController>();

        controller.updateTodo(
          todo: todo,
          isCompleted: !todo.isCompleted,
        );
      },
    );
  }
}
