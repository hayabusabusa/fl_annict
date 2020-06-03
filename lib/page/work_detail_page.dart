import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/notifier/notifier.dart';

class WorkDetailPage extends StatelessWidget {
  const WorkDetailPage._({Key key}): super(key: key);

  static Widget wrapped(Work work) {
    return ChangeNotifierProvider(
      create: (_) => WorkDetailNotifier(work),
      child: const WorkDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}