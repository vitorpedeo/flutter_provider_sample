import 'package:provider_sample/src/core/services/client_http.dart';
import 'package:provider_sample/src/modules/todos/models/todo_model.dart';

class TodosRepository {
  final ClientHttp clientHttp;

  TodosRepository({required this.clientHttp});

  Future<List<Todo>> getAll() async {
    final data = await clientHttp.get('/todos');
    final List<Todo> todos = (data as List)
        .map(
          (e) => Todo.fromJson(e),
        )
        .toList();

    return todos;
  }

  Future<void> update(Todo todo) async {
    await clientHttp.put(
      '/todos/${todo.id}',
      body: todo.toJson(),
    );
  }
}
