import 'package:flutter/material.dart';
import 'package:news/ui/screens/home/home.dart';
import 'package:news/ui/utilites/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:news/ui/provider/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: Home(),
    );
  }
}
