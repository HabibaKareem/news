import 'package:newsapp1/data/datasource/Sourcesdatasource.dart';
import 'package:newsapp1/data/model/sorcesresponse/sorcesresponse.dart';
import 'package:newsapp1/repo/sourcesrepo.dart';

class SourcesRepoimp extends SourcesRepo{
  Sourcesdatasource sourcesdatasource;
  SourcesRepoimp(this.sourcesdatasource);
  @override
  Future<SourceResponse> getsource(String categoryid) {
    // TODO: implement getsource
   return sourcesdatasource.getsource(categoryid);
  }
}