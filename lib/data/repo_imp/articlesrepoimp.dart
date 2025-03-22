import 'package:newsapp1/data/datasource/articlesdatasource.dart';
import 'package:newsapp1/data/model/artresponce/artresponce.dart';
import 'package:newsapp1/repo/articelsrepo.dart';

class Articlesrepoimp extends Articelsrepo
 {
  Articlesdatasource articlesdatasource;
  Articlesrepoimp(this.articlesdatasource);
  @override
  Future<ArticleResponse> getarticles(String sourceid) {
  return articlesdatasource.getarticles(sourceid);
  }
 }