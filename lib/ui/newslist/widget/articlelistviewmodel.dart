import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/data/datasource/articlesdatasource.dart';
import 'package:newsapp1/data/datasource_imp/articlesdatasourceimp.dart';
import 'package:newsapp1/data/model/artresponce/article.dart';
import 'package:newsapp1/data/model/sorcesresponse/sourse.dart';
import 'package:newsapp1/data/repo_imp/articlesrepoimp.dart';
import 'package:newsapp1/repo/articelsrepo.dart';


class Articlelistviewmodel extends Cubit<Articlestate> {
 late  Articelsrepo repo;

  Articlelistviewmodel():super( Articleloading()){
    Apimanger apimanger= Apimanger();
    Articlesdatasource datasource = Articlesapidatasourceimp(apimanger);

    repo=Articlesrepoimp(datasource);
  }

  getarticle(String sourceid)async{
    


   try{
  emit(Articleloading());
 //
   var response= await  repo.getarticles(sourceid);
  print(response);
    if(response?.status=="error"){
emit(Articleerror(response!.message!));
    }
    else{
      if(response!.articles?.isNotEmpty??false)
{emit(Articlesuccess(response!.articles??[]));}
else{
  emit(Articleempty());
}
}


    }
    
    catch(e){
emit(Articleerror(e.toString()+"cache"));
}

}

  }
  abstract class Articlestate{

  }
   
   class Articleloading extends Articlestate{}
      class Articleerror extends Articlestate{
String error;
        Articleerror(this.error);
      }
         class Articlesuccess extends Articlestate{
List<Article>articles;
Articlesuccess(this.articles);
         }
         class Articleempty extends Articlestate{}
