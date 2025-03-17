import 'package:newsapp1/model/sorcesresponse/sourse.dart';

class SourceResponse {
  String status;
  String code;
  String message;
  List<Source> sources;

  SourceResponse({
    required this.status,
    this.code = "",
    this.message = "",
    required this.sources,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'],
      code: json['code'] ?? "",
      message: json['message'] ?? "",
      sources: List<Source>.from(json['sources'].map((x) => Source.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'code': code,
      'message': message,
      'sources': List<dynamic>.from(sources.map((x) => x.toJson())),
    };
  }
}

