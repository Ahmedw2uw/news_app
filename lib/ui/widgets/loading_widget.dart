import 'package:flutter/material.dart';
import 'package:news/ui/utilites/extentions/bild_context_extention.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: context.secondaryColor),
    );
  }
}
