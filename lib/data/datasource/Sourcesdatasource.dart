import 'package:newsapp1/data/model/sorcesresponse/sorcesresponse.dart';

abstract class Sourcesdatasource {
 Future< SourceResponse> getsource(String categoryid);
}