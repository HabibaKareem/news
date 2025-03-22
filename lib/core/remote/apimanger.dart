import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp1/core/remote/apiconst.dart';
import 'package:newsapp1/data/model/artresponce/artresponce.dart';
import 'package:newsapp1/data/model/sorcesresponse/sorcesresponse.dart';

class Apimanger {
  Future<SourceResponse> getsource(String category) async {
    // everything?q=keyword&=&=
    Uri uri = Uri.https(baseurl, "/v2/top-headlines/sources", {
      "apiKey": apikey,
      "category": category,
    });

    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourceResponse sorcesresponse = SourceResponse.fromJson(json);

    return sorcesresponse;
    
  }
/*static Future<ArticleResponse?> getarticels(String source) async {
 // print("Searching for articles with keyword: $source"); // طباعة الكلمة المفتاحية

  Uri uri = Uri.https(baseurl, "/v2/everything", {
    "apiKey": apikey,
    "q": source,

    "domains":"techcrunch.com,thenextweb.com"
  });

 {
    var response = await http.get(uri);

    //print("Response status code: ${response.statusCode}"); // طباعة حالة الاستجابة
   // print("Response body: ${response.body}"); // طباعة محتوى الاستجابة

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
     // print("Decoded JSON: $json"); // طباعة البيانات المفككة

      ArticleResponse artcileresponse = ArticleResponse.fromJson(json);
      return artcileresponse;
    } else {
      //print("Error fetching articles: ${response.statusCode}");
      return null;
    }
  } 
}

*/
 Future<ArticleResponse> getarticels(String source) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=b6cfb7d8842241dfba2ba14304768048
    // everything?q=keyword&=&=
    Uri uri = Uri.https(baseurl, "/v2/everything", {
      "apiKey": apikey,
      "q": source,
//"sources": source,
    });

    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    ArticleResponse artcileresponse = ArticleResponse.fromJson(json);

    return artcileresponse;
   
  }
}
