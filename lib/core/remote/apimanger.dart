import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp1/core/remote/apiconst.dart';
import 'package:newsapp1/model/artresponce/artresponce.dart';
import 'package:newsapp1/model/sorcesresponse/sorcesresponse.dart';

class Apimanger {
  static Future<SourceResponse?> getsource(String category) async {
    // everything?q=keyword&=&=
    Uri uri = Uri.https(baseurl, "/v2/top-headlines/sources", {
      "apiKey": apikey,
      "category": category,
    });

    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourceResponse sorcesresponse = SourceResponse.fromJson(json);

    return sorcesresponse;
    json["sources"][0]["id"];
  }

  static Future<ArticleResponse?> getarticels(String source) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=b6cfb7d8842241dfba2ba14304768048
    // everything?q=keyword&=&=
    Uri uri = Uri.https(baseurl, "/v2/everything", {
      "apiKey": apikey,
      "sources": source,
    });

    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    ArticleResponse artcileresponse = ArticleResponse.fromJson(json);

    return artcileresponse;
   
  }
}
