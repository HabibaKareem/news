import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/colormang.dart';
import 'package:newsapp1/core/remote/apimanger.dart';
import 'package:newsapp1/model/categorymodel.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext  context) {
  
    return  ChangeNotifierProvider(
      create: (context) => Newslistviewmodel()..getsource(widget.category.id),
      child: Consumer<Newslistviewmodel>
      (builder:(context,viewmodel, child) {
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
        else {
          var source = viewmodel.sources;
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
        }
        
      },),
    )
    ;
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
  }
}
