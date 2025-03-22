import 'package:newsapp1/data/model/artresponce/artresponce.dart';

abstract class Articlesdatasource {
 Future< ArticleResponse> getarticles(String sourceid);
}