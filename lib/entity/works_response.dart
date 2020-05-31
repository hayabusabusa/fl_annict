import './work.dart';

class WorksResponse {
  final List<Work> works;
  final int total;
  final int next;
  final int prev;

  const WorksResponse({
    this.works,
    this.total,
    this.next,
    this.prev,
  });

  factory WorksResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawWorks = json['works'];
    return WorksResponse(
      works: rawWorks.map((i) => Work.fromJson(i)).toList(),
      total: json['total_count'],
      next: json['next_page'],
      prev: json['prev_page'],
    );
  }
}