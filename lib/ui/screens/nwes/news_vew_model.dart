import 'package:flutter/material.dart';
import 'package:news/data/model/sources.dart';
import 'package:news/data/repositries/news_reposotry.dart';

class NewsVewModel extends ChangeNotifier {
  NewsReposotry newsReposotry;
  NewsVewModel(this.newsReposotry);
  List <Source>sources=[];
  var isloading=false;
  var errorMessage="";

  loadSources(String categoryId)async{
    try{
      isloading=true;
      notifyListeners();
      sources=(await newsReposotry.loadSources(categoryId))!;
      //*this line dont maik the clean arch must isolate the data in single class and maik the online data and ofline   
      //(await ApiManeger.instance.loadSources(categoryId))!;
      isloading=false;
      notifyListeners();
    }
    catch(e){
      errorMessage=e.toString();
      notifyListeners();
    }
  }


}
