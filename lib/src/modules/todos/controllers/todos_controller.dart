import 'package:flutter/material.dart';
import 'package:provider_sample/src/modules/todos/models/todo_model.dart';
import 'package:provider_sample/src/modules/todos/repositories/todos_repository.dart';

enum TodosStatus { idle, loading, success, error }

class TodosController extends ChangeNotifier {
  final TodosRepository repository;

  List<Todo> _todos = [];
  TodosStatus _status = TodosStatus.idle;

  TodosController({required this.repository});

  List<Todo> get todos => _todos;
  TodosStatus get status => _status;

  Future<void> getAllTodos() async {
    try {
      _status = TodosStatus.loading;

      _todos = await repository.getAll();
      _status = TodosStatus.success;
    } catch (e) {
      _status = TodosStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> updateTodo({
    required Todo todo,
    required bool isCompleted,
  }) async {
    try {
      _todos = _todos.map((e) {
        if (e.id == todo.id) {
          return e.copyWith(
            isCompleted: isCompleted,
          );
        }

        return e;
      }).toList();

      await repository.update(
        todo.copyWith(
          isCompleted: isCompleted,
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
}
