import 'package:newsapp1/data/model/artresponce/artresponce.dart';

abstract class Articelsrepo {
   Future<ArticleResponse> getarticles(String sourceid);
}
