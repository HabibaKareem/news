import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp1/core/colormang.dart';
import 'package:newsapp1/model/artresponce/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class Articleitem extends StatelessWidget {
 final Article article;
  const Articleitem({super.key, required this.article});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                contentPadding: REdgeInsets.all(0),
                insetPadding: REdgeInsets.all(16),
                alignment: Alignment.bottomCenter,
                backgroundColor: Colormang.textcolor,
                content: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),

                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage??"",
                          height: 220.h,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          placeholder:
                              (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                          errorWidget:
                              (context, url, error) =>
                                  Icon(Icons.error, size: 40.sp),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        article.description??"",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "view full article",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Colormang.textcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colormang.textcolor),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),

              child: CachedNetworkImage(
                imageUrl: article.urlToImage??"",
                height: 220.h,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) => Icon(Icons.error, size: 40.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              article.title??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: Colormang.textcolor,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "By : ${article.author}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colormang.textcolor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    DateTime.now().difference(DateTime.parse(article.publishedAt??"")).inDays<2?
                    timeago.format(
                      DateTime.parse(article.publishedAt??"")
                     /* DateTime.now().subtract(Duration(minutes: 30)),*/
                    ):
                    article.publishedAt??"",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colormang.textcolor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
