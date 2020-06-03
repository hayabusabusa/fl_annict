import './episode.dart';

class EpisodesResponse {
  final List<Episode> episodes;
  final int total;
  final int next;
  final int prev;

  const EpisodesResponse({
    this.episodes,
    this.total,
    this.next,
    this.prev,
  });

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawEpisodes = json['episodes'];
    return EpisodesResponse(
      episodes: rawEpisodes.map((i) => Episode.fromJson(i)).toList(),
      total: json['total_count'],
      next: json['next_page'],
      prev: json['prev_page'],
    );
  }
}