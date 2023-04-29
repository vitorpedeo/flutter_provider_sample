import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/providers.dart';
import 'package:provider_sample/src/modules/todos/pages/todos_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        title: 'Provider Sample',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const TodosPage(),
      ),
    );
  }
}
