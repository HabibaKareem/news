import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/colormang.dart';
import 'package:newsapp1/model/categorymodel.dart';
import 'package:newsapp1/ui/categories/widget/categoryitem.dart';

class Categorieswidget extends StatelessWidget {
  final void Function(Categorymodel) oncategorytap;
  const Categorieswidget({super.key, required this.oncategorytap});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            '''Good morning
here is some news for you ''',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              color: Colormang.textcolor,
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              itemBuilder:
                  (context, index) => Categoryitem(
                    category: Categorymodel.categories[index],
                    oncategorytap: oncategorytap,
                  ),

              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: Categorymodel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
