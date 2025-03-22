import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/data/datasource/Sourcesdatasource.dart';
import 'package:newsapp1/data/model/sorcesresponse/sorcesresponse.dart';

class Sourcesapidatasourceimp extends Sourcesdatasource {
Apimanger apimanger;
Sourcesapidatasourceimp(this.apimanger);
  @override
  Future<SourceResponse> getsource(String categoryid) {
  return apimanger.getsource(categoryid);
  }
}