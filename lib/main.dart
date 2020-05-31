import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_annict/model/network/api_client.dart';
import 'package:fl_annict/model/model.dart';
import 'package:fl_annict/notifier/notifier.dart';
import 'package:fl_annict/page/page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final _apiClient = APIClient();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WorksNotifier(WorksModel(_apiClient)),
        )
      ],
      child: MaterialApp(
        title: 'fl annict',
        home: WorksPage(),
      ),
    );
  }
}