import 'package:provider/provider.dart';
import 'package:provider_sample/src/core/services/client_http.dart';
import 'package:provider_sample/src/modules/todos/providers/todos_provider.dart';

class Providers {
  static final providers = [
    // Global providers
    Provider<ClientHttp>(
      create: (_) => ClientHttp(),
    ),
    // Module providers
    ...TodosProvider.providers,
  ];
}
