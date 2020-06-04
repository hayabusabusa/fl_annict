import 'package:rxdart/rxdart.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/model/network/api_client.dart';

class WorkDetailModel {
  // NOTE: この Model は main で生成していないので DI できていない
  final APIClient _apiClient = APIClient();
  final int _workId;

  WorkDetailModel(this._workId);

  // MARK: Properteis

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get isLoading => _isLoadingSubject.stream;

  final BehaviorSubject<EpisodesResponse> _episodesResponseSubject = BehaviorSubject<EpisodesResponse>.seeded(EpisodesResponse(episodes: []));
  Stream<List<Episode>> get episodes => _episodesResponseSubject.stream.map((event) => event.episodes);

  /// 次のページを読み込み中かどうか.
  bool _isFetching = false;

  // MARK: Public

  void fetch() async {
    final response = await _apiClient.getEpisodes(workId: _workId);
    _episodesResponseSubject.add(response);
    _isLoadingSubject.add(false);
  }

  void fetchNextIfNeeded() async {
    final next = _episodesResponseSubject.value.next;

    if (_isFetching || next == null) return;
    _isFetching = true;
    
    final response = await _apiClient.getEpisodes(workId: _workId, page: next);
    final newEpisodes = _episodesResponseSubject.value.episodes;
    newEpisodes.addAll(response.episodes);

    _isFetching = false;
    _episodesResponseSubject.add(EpisodesResponse(episodes: newEpisodes, next: response.next, total: response.total, prev: response.prev));
  }

  void dispose() {
    _isLoadingSubject.close();
    _episodesResponseSubject.close();
  }
}