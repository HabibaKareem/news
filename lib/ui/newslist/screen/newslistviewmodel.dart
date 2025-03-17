import 'package:flutter/material.dart';
import 'package:newsapp1/core/remote/apimanger.dart';

import 'package:newsapp1/model/sorcesresponse/sourse.dart';

class Newslistviewmodel extends ChangeNotifier {
List<Source>sources=[];
String? errormess;
bool showloading=false;
getsource(String categoryid)async{
   try{
      showloading=true;

   var response=await  Apimanger.getsource(categoryid);
    if(response?.status=="error"){
errormess =response?.message;
    }
    else{
      sources = response?.sources??[];
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