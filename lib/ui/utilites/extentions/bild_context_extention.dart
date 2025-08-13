import 'package:flutter/material.dart';
import 'package:news/ui/provider/theme_provider.dart';
import 'package:provider/provider.dart';

extension  BildContextExtention on BuildContext{

  Color get primaryColor=>Theme.of(this).primaryColor;
  Color get secondaryColor=>Theme.of(this).secondaryHeaderColor;
  TextTheme get textTheme=> Theme.of(this).textTheme;
  ThemeData get themeData=> Theme.of(this);

  ThemeProvider get themeProvider=> Provider.of(this);

  double get width=> MediaQuery.of(this).size.width;
  double get height=> MediaQuery.of(this).size.height;

} 