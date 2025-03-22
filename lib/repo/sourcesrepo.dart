import 'package:newsapp1/data/model/sorcesresponse/sorcesresponse.dart';

abstract class SourcesRepo {
   Future<SourceResponse> getsource(String categoryid);
}