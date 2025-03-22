import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp1/core/assetsmang.dart';
import 'package:newsapp1/data/model/categorymodel.dart';
import 'package:newsapp1/ui/categories/screen/categorieswidget.dart';
import 'package:newsapp1/ui/home/widget/homedrawer.dart';
import 'package:newsapp1/ui/newslist/screen/newslistwidget.dart';

class Homescreen extends StatefulWidget {
  static const String routename = "Homescreen";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isshownewslist = false;
  Categorymodel? selectedcategory;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Homedrawer(
        backhome: () {
          selectedcategory = null;
          isshownewslist = false;
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text(selectedcategory != null ? selectedcategory!.name : "Home"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assetsmang.search, height: 24.h, width: 24.w),
          ),
        ],
      ),
      body:
          isshownewslist
              ? Newslistwidget(selectedcategory!)
              : Categorieswidget(oncategorytap: oncategoryselected),
    );
  }

  oncategoryselected(Categorymodel category) {
    setState(() {
      isshownewslist = true;
      selectedcategory = category;
    });
  }
}
