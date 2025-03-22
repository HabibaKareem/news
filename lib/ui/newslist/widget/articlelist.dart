import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/data/model/artresponce/article.dart';
import 'package:newsapp1/data/model/sorcesresponse/sourse.dart';

import 'package:newsapp1/ui/newslist/widget/articleitem.dart';
import 'package:newsapp1/ui/newslist/widget/articlelistviewmodel.dart';
import 'package:provider/provider.dart';

class Articlelist extends StatefulWidget {
  Source source;
  Articlelist(this.source);

  @override
  State<Articlelist> createState() => _ArticlelistState();
}

class _ArticlelistState extends State<Articlelist> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   print(widget. source.id);
    return  BlocProvider(
      
      create: (context) =>Articlelistviewmodel()..getarticle(widget.source.id) ,
      child: BlocBuilder<Articlelistviewmodel,Articlestate>
      (builder: (context, state) {
        if(state is Articleloading){
     return Center(child: CircularProgressIndicator());
        }
        else if(state is Articleerror){
return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.error),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("cance"),
              ),
            ],
          );
        }
        else if(state is Articleempty){
return Center(
          child: Text("No articles found",
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600
          ),),
        );
        }
        else {
          var articles =(state as Articlesuccess).articles;
           return
        Expanded(
          child: ListView.separated(
                itemBuilder: (context, index) =>//Text("data")
                Articleitem(article: articles[index],)
                
                ,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: articles.length,
              ),
        );
        }
      },),
    );
    
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
