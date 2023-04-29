import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/src/modules/todos/controllers/todos_controller.dart';
import 'package:provider_sample/src/modules/todos/widgets/todo_item.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<TodosController>(context, listen: false).getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            32,
          ),
          child: Consumer<TodosController>(
            builder: (context, controller, child) {
              if (controller.status == TodosStatus.idle) {
                return const SizedBox.shrink();
              }

              if (controller.status == TodosStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.status == TodosStatus.error) {
                return const Center(
                  child: Text('Error'),
                );
              }

              return ListView.separated(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    todo: controller.todos[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
