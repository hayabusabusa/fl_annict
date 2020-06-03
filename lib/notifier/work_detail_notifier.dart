import 'package:flutter/material.dart';

import 'package:fl_annict/entity/entity.dart';

class WorkDetailNotifier with ChangeNotifier {
  final Work work;

  WorkDetailNotifier(this.work);
}