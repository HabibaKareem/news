import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/colormang.dart';
import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/data/datasource_imp/sourcesapi()datasourceimp.dart';
import 'package:newsapp1/data/model/categorymodel.dart';
import 'package:newsapp1/data/repo_imp/SourcesRepoimp.dart';
import 'package:newsapp1/ui/newslist/screen/newslistviewmodel.dart';
import 'package:newsapp1/ui/newslist/widget/articlelist.dart';
import 'package:provider/provider.dart';

class Newslistwidget extends StatefulWidget {
  Categorymodel category;
  Newslistwidget(this.category, {super.key});


  @override
  State<Newslistwidget> createState() => _NewslistwidgetState();
}

class _NewslistwidgetState extends State<Newslistwidget> {
  int curr=0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext  context) 
  {
  //print(widget.category.id);
    return  BlocProvider(create: (context) => Newslistviewmodel(SourcesRepoimp(
      Sourcesapidatasourceimp
      (Apimanger())
    ))..getsource(widget.category.id),
    child: BlocBuilder<Newslistviewmodel,Newsstate>
    (builder: (context, state) {
      if(state is newsloading){
        return Center(child: CircularProgressIndicator());
      }
      else if(state is newserror){
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.error),
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
        var sources = (state as newssuccess).sources;
        return  
        
         DefaultTabController(
          length: sources.length,
          child: Container(width: double.infinity,
            child: Column(
              children: [    
               
                
                TabBar(  onTap: (value) {
            
              setState(() {
                
              });
            },
                  isScrollable: true,
                  indicatorColor: Colormang.textcolor,
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colormang.textcolor,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colormang.textcolor,
                  ),
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  tabs: sources.map((source) => Tab(text: source.name)).toList(),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  
                  child: Padding(
                    padding: REdgeInsets.all(8.0),
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: sources.map((source) => Articlelist(source))
                      .toList()
                      
                      ,
                    ),
                  ),
                ),
            
             
              ],
            ),
          ),
        );
      }

    },),)
    ;  }
}
    /* 
    FutureBuilder(
      future: Apimanger.getsource(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
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
        var responce = snapshot.data;

        if (responce?.status == "error") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(responce?.message ?? ""),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("cancel"),
              ),
            ],
          );
        }

        var source = responce?.sources ?? [];
        return DefaultTabController(
          length: source.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: Colormang.textcolor,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colormang.textcolor,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colormang.textcolor,
                ),
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                tabs: source.map((source) => Tab(text: source.name)).toList(),
              ),
              SizedBox(height: 15.h),
              TabBarView(
                children: source.map((source) => Articlelist(source)).toList(),
              ),
            ],
          ),
        );
      },
    )*/
    
    
    /*
    DefaultTabController(
      length: source.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colormang.textcolor,
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colormang.textcolor,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colormang.textcolor,
            ),
            tabAlignment: TabAlignment.start,
            dividerHeight: 0,
            tabs: source.map((source) => Tab(text: source)).toList(),
          ),
          SizedBox(height: 15.h),
          TabBarView(children: source.map((source) => Articlelist()).toList()),
        ],
      ),
    );
  */

