import 'package:flutter/material.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/model/model.dart';

class WorkDetailNotifier with ChangeNotifier {
  final WorkDetailModel _model;
  
  // MARK: Properties

  final Work work;

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

  List<Episode> _episodes = [];
  List<Episode> get episode => _episodes;

  void _setEpisodes(List<Episode> episodes) {
    _episodes = episodes;
    notifyListeners();
  }

  // MARK: Lifecycle

  WorkDetailNotifier(this._model, {@required this.work}) {
    _model.isLoading.listen((event) => _setIsLoading(event));
    _model.episodes.listen((event) => _setEpisodes(event));
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