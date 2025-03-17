import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/model/artresponce/article.dart';
import 'package:newsapp1/model/sorcesresponse/sourse.dart';

import 'package:newsapp1/ui/newslist/widget/articleitem.dart';
import 'package:newsapp1/ui/newslist/widget/articlelistviewmodel.dart';
import 'package:provider/provider.dart';

class Articlelist extends StatefulWidget {
  Source source;
  Articlelist(this.source, {super.key});

  @override
  State<Articlelist> createState() => _ArticlelistState();
}

class _ArticlelistState extends State<Articlelist> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Articlelistviewmodel()..getarticle(widget.source.id!),
      child: Consumer<Articlelistviewmodel>(builder: (context,viewmodel, child) {
         if(viewmodel.showloading){
        return Center(child: CircularProgressIndicator());

       }
       else if(viewmodel.errormess!=null){
return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewmodel.errormess.toString()),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("cancel"),
              ),
            ],
          );
       }


       else{
        
       List<Article> articles =viewmodel.articles??[];
       if(articles.isEmpty){
        return Center(
          child: Text("No articles found",
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600
          ),),
        );
       }
        
       return
        ListView.separated(
      itemBuilder: (context, index) => Articleitem(article: articles[index],),
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: articles.length,
    );
       }

      },),);
    
    
    /*
    
    
     FutureBuilder(future: Apimanger.getarticels(widget.source.id!),
     builder: (context, snapshot) {
       if(snapshot.connectionState== ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());

       }
       else if(snapshot.hasError){
return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("cancel"),
              ),
            ],
          );
       }
       var response=snapshot.data;
       if(response?.status=="error")
       {
        
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(response?.message ?? ""),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("cancel"),
              ),
            ],
          );
       }
       List<Article> articles =response?.articles??[];
       if(articles.isEmpty){
        return Center(
          child: Text("No articles found",
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600
          ),),
        );
       }
       return
        ListView.separated(
      itemBuilder: (context, index) => Articleitem(article: articles[index],),
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: articles.length,
    );
     },)
   
    ;*/
  }
}
