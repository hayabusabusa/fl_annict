import 'package:meta/meta.dart';

class Work {
  final String title;
  final String titleKana;
  final String season;
  final String releasedOn;
  final String officialSiteURL;
  final int episodesCount;
  final String image;

  const Work({
    @required this.title,
    this.titleKana,
    this.season,
    this.releasedOn,
    this.officialSiteURL,
    this.episodesCount,
    this.image,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      title: json['title'],
      titleKana: json['title_kana'],
      season: json['season_name_text'],
      releasedOn: json['released_on'],
      officialSiteURL: json['official_site_url'],
      episodesCount: json['episodes_count'],
      image: json['images']['recommended_url'],
    );
  }
}