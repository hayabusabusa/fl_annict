import 'package:meta/meta.dart';

class Episode {
  final int id;
  final int number;
  final String numberText;
  final String title;
  final int recordsCount;

  const Episode({
    @required this.id,
    this.number,
    this.numberText,
    this.title,
    this.recordsCount,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      number: json['number'],
      numberText: json['number_text'],
      title: json['title'],
      recordsCount: json['records_count'],
    );
  }
}