import 'package:news_app/models/sources.dart';
class SourcesResponse {
  String? status;
  List<Sources>? sources;

  SourcesResponse({this.status, this.sources});

  SourcesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['status'] = status;
  //   if (sources != null) {
  //     data['sources'] = sources!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}