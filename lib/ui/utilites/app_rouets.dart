import 'package:flutter/material.dart';
import 'package:news/ui/model/category_dm.dart';
import 'package:news/ui/screens/home/home.dart';
import 'package:news/ui/screens/nwes/news.dart';
import 'package:news/ui/screens/splash/splash.dart';

abstract final class AppRouets {
  static Route get splash => MaterialPageRoute(builder: (_) => Splash());
  static Route get home => MaterialPageRoute(builder: (_) => Home());
  static Route news(CategoryDm category) =>
      MaterialPageRoute(builder: (_) => News(categoryDm: category));
}
