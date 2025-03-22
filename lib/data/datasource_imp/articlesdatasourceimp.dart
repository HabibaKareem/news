import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/data/datasource/articlesdatasource.dart';
import 'package:newsapp1/data/model/artresponce/artresponce.dart';

class Articlesapidatasourceimp extends Articlesdatasource {
  Apimanger apimanger;
  Articlesapidatasourceimp(this.apimanger);
  @override
  Future<ArticleResponse> getarticles(String sourceid) {
   return apimanger.getarticels(sourceid);
  }
}
