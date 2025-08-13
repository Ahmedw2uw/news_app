import 'package:flutter/material.dart';
import 'package:news/ui/utilites/app_rouets.dart';
import 'package:news/ui/utilites/extentions/bild_context_extention.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) //* if the  screen stil live
      {
        Navigator.push(context, AppRouets.home);
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset(context.themeProvider.splach, fit: BoxFit.fill));
  }
}
