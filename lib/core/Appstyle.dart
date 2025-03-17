import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/colormang.dart';

//size sp
// hiegh h
// width w
//redus r
class Appstyle {
  static ThemeData lighttheme = ThemeData(
    dividerTheme: DividerThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black12,
        fontSize: 20.sp,
      ),
    ),
  );
  static ThemeData darktheme = ThemeData(
    dividerTheme: DividerThemeData(color: Colors.blue),
    scaffoldBackgroundColor: Colormang.bg,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colormang.bg,
      type: BottomNavigationBarType.fixed,
    ),
    fontFamily: "Inter",
    colorScheme: ColorScheme.dark(
      primary: Colormang.primary,
      secondary: Colormang.scdark,
      tertiary: Colormang.tre,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colormang.primary,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: Colors.amber),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colormang.primary,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colormang.tre,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colormang.scdark,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.white,
      ),
    ),
  );
}
