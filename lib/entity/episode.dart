import 'package:meta/meta.dart';

class Episode {
  final int id;
  final String numberText;
  final String title;
  final int recordsCount;

  const Episode({
    @required this.id,
    this.numberText,
    this.title,
    this.recordsCount,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      numberText: json['number_text'],
      title: json['title'],
      recordsCount: json['records_count'],
    );
  }
}