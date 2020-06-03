import 'package:rxdart/rxdart.dart';

import 'package:fl_annict/entity/entity.dart';
import 'package:fl_annict/model/network/api_client.dart';

class WorksModel {
  final APIClient _apiClient;

  WorksModel(this._apiClient);
  
  // MARK: Properteis

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get isLoading => _isLoadingSubject.stream;

  final BehaviorSubject<WorksResponse> _worksSubject = BehaviorSubject<WorksResponse>.seeded(WorksResponse(works: []));
  Stream<List<Work>> get works => _worksSubject.stream.map((event) => event.works);

  /// 次のページを読み込み中かどうか.
  bool _isFetching = false;

  // MARK: Public

  void fetch() async {
    final response = await _apiClient.getWorks(time: DateTime.now());
    _worksSubject.add(response);
    _isLoadingSubject.add(false);
  }

  void fetchNextIfNeeded() async {
    final next = _worksSubject.value.next;

    if (_isFetching || next == null) return;
    _isFetching = true;
    
    final response = await _apiClient.getWorks(time: DateTime.now(), page: next);
    final newWorks = _worksSubject.value.works;
    newWorks.addAll(response.works);

    _isFetching = false;
    _worksSubject.add(WorksResponse(works: newWorks, next: response.next, total: response.total, prev: response.prev));
  }

  void dispose() {
    _isLoadingSubject.close();
    _worksSubject.close();
  }
}