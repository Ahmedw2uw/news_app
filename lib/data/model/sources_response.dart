import 'package:news/data/model/sources.dart';

class SourcesResponse {
  final String status;
  final List<Source> sources;

  SourcesResponse({required this.status, required this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    var sourcesList = json['sources'] as List;
    List<Source> sources = sourcesList.map((i) => Source.fromJson(i)).toList();

    return SourcesResponse(status: json['status'] as String, sources: sources);
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'sources': sources.map((source) => source.toJson()).toList(),
    };
  }
}
