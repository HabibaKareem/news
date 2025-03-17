import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/colormang.dart';
import 'package:newsapp1/model/categorymodel.dart';

class Categoryitem extends StatelessWidget {
  final Categorymodel category;
  final void Function(Categorymodel) oncategorytap;
  const Categoryitem({
    super.key,
    required this.category,
    required this.oncategorytap,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: category.trun,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 198.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colormang.textcolor,
        ),
        child: Row(
          children: [
            Image.asset(
              category.pic,
              height: 198.h,
              width: 170.w,
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30.sp,
                        color: Colors.white,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        oncategorytap(category);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.zero,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Padding(
                            padding: REdgeInsetsDirectional.only(start: 16),
                            child: Text(
                              "View all",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24.sp,
                                color: Colormang.textcolor,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colormang.textcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
