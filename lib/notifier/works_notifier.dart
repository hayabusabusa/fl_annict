import 'package:flutter/material.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/model/model.dart';

class WorksNotifier with ChangeNotifier {
  final WorksModel _model;

  // MARK: Properties

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  void _onScroll() {
    double position = scrollController.offset / scrollController.position.maxScrollExtent;
      if (position >= 1) {
        _model.fetchNextIfNeeded();
      }
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void _setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  List<Work> _works = [];
  List<Work> get works => _works;

  void _setWorks(List<Work> works) {
    _works = works;
    notifyListeners();
  }

  // MARK: Lifecycle

  WorksNotifier(this._model) {
    _model.isLoading.listen((event) => _setIsLoading(event));
    _model.works.listen((event) => _setWorks(event));
    _scrollController.addListener(() => _onScroll());

    _model.fetch();
  }

  @override
  void dispose() {
    _model.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}