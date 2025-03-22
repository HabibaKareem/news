import 'package:flutter/widgets.dart';
import 'dart:ui';

import 'package:newsapp1/core/assetsmang.dart';

class Categorymodel {
  String pic;
  String name;
  TextDirection trun;
  String id;

  Categorymodel({
    required this.name,
    required this.id,
    required this.pic,
    this.trun = TextDirection.ltr,
  });
  static List<Categorymodel> categories = [
    Categorymodel(name: "General", id: "general", pic: Assetsmang.General),
    Categorymodel(
      name: "Business",
      id: "business",
      pic: Assetsmang.Business,
      trun: TextDirection.rtl,
    ),
    Categorymodel(name: "Sports", id: "sports", pic: Assetsmang.Sports),
    Categorymodel(
      name: "Technology",
      id: "technology",
      pic: Assetsmang.Technology,
      trun: TextDirection.rtl,
    ),
    Categorymodel(name: "Health", id: "health", pic: Assetsmang.Health),
    Categorymodel(
      name: "Science",
      id: "science",
      pic: Assetsmang.Science,
      trun: TextDirection.rtl,
    ),
    Categorymodel(
      name: "Entertainment",
      id: "entertainment",
      pic: Assetsmang.Entertainment,
    ),
  ];
}
