import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp1/core/remote/apimanger.dart';

import 'package:newsapp1/data/model/sorcesresponse/sourse.dart';
import 'package:newsapp1/repo/sourcesrepo.dart';

class Newslistviewmodel extends Cubit<Newsstate>  {
  SourcesRepo sourcesRepo;
Newslistviewmodel(this.sourcesRepo):super(newsloading());

  getsource(String categoryid)async{
    
//print(sourceid);

   try{
    emit(newsloading());

   var response= await  sourcesRepo.getsource(categoryid);
  // print(response?.sources.toList().map((source) => print(source.name)));
  
    if(response?.status=="error"){
      emit(newserror(response!.message!));
    }
    else{
     emit(newssuccess(response?.sources??[]));
}
  

    }
    
    catch(e){
  emit(newserror(e.toString()+" cache"));
}

}
}
 abstract class Newsstate{}
 class newsloading extends Newsstate{}
  class newserror extends Newsstate{

    String error;
    newserror(this.error);
  }
   class newssuccess extends Newsstate{
    List<Source> sources;
    newssuccess(this.sources);
   }