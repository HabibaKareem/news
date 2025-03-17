import 'package:flutter/material.dart';
import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/model/artresponce/article.dart';


class Articlelistviewmodel extends ChangeNotifier {

List<Article>articles=[];
String? errormess;
bool showloading=false;
  getarticle(String sourceid)async{
    


   try{
      showloading=true;

   var response= await  Apimanger.getarticels(sourceid);
    if(response?.status=="error"){
errormess =response?.message;
    }
    else{
      articles = response?.articles
  
     ??[];
}
   showloading=false;

    }
    
    catch(e){
errormess=e.toString();
showloading=false;
}
notifyListeners();
}

  }
