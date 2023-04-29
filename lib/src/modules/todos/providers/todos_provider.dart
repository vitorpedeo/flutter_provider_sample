import 'package:provider/provider.dart';
import 'package:provider_sample/src/core/services/client_http.dart';
import 'package:provider_sample/src/modules/todos/controllers/todos_controller.dart';
import 'package:provider_sample/src/modules/todos/repositories/todos_repository.dart';

class TodosProvider {
  static final providers = [
    Provider<TodosRepository>(
      create: (context) => TodosRepository(
        clientHttp: context.read<ClientHttp>(),
      ),
    ),
    ChangeNotifierProvider<TodosController>(
      create: (context) => TodosController(
        repository: context.read<TodosRepository>(),
      ),
    ),
  ];
}
