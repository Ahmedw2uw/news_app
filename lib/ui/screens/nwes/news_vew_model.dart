import 'package:flutter/material.dart';
import 'package:news/data/model/api_maneger.dart';
import 'package:news/data/model/sources.dart';

class NewsVewModel extends ChangeNotifier {

  List <Source>sources=[];
  var isloading=false;
  var errorMessage="";

  loadSources(String categoryId)async{
    try{
      isloading=true;
      notifyListeners();
      sources=(await ApiManeger.instance.loadSources(categoryId))!;
      isloading=false;
      notifyListeners();
    }
    catch(e){
      errorMessage=e.toString();
      notifyListeners();
    }
  }


}
