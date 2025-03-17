import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Homedrawer extends StatefulWidget {
  final void Function() backhome;
  const Homedrawer({super.key, required this.backhome});

  @override
  State<Homedrawer> createState() => _HomedrawerState();
}

class _HomedrawerState extends State<Homedrawer> {
  String selectedtheme = "light";
  String selectedlang = "En";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 166.h,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              "News app",
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    widget.backhome();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset("assetName", height: 24.h, width: 24.w),
                      SizedBox(width: 8.w),
                      Text(
                        "Go to home ",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    SvgPicture.asset("assetName", height: 24.h, width: 24.w),
                    SizedBox(width: 8.w),
                    Text(
                      "Theme",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedtheme,
                      borderRadius: BorderRadius.circular(16.r),
                      isExpanded: true,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.black,
                      hint: Text(
                        "choose the Theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                      items: [
                        DropdownMenuItem(value: "light", child: Text("Light")),
                        DropdownMenuItem(value: "dark", child: Text("Dark")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedtheme = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    SvgPicture.asset("assetName", height: 24.h, width: 24.w),
                    SizedBox(width: 8.w),
                    Text(
                      "Theme",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedtheme,
                      borderRadius: BorderRadius.circular(16.r),
                      isExpanded: true,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.black,
                      hint: Text(
                        "choose the Theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                      items: [
                        DropdownMenuItem(value: "light", child: Text("Light")),
                        DropdownMenuItem(value: "dark", child: Text("Dark")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedtheme = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
