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

  // MARK: Public

  void fetch() async {
    final response = await _apiClient.getWorks(DateTime.now());
    _worksSubject.add(response);
    _isLoadingSubject.add(false);
  }

  void dispose() {
    _isLoadingSubject.close();
    _worksSubject.close();
  }
}