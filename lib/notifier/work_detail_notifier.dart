import 'package:flutter/material.dart';

import 'package:fl_annict/entity/entity.dart';

class WorkDetailNotifier with ChangeNotifier {
  
  // MARK: Properties

  final Work work;

  // MARK: Lifecycle

  WorkDetailNotifier(this.work);

  @override
  void dispose() {
    super.dispose();
  }
}