import 'package:hive_flutter/adapters.dart';
import 'package:news/data/model/sources.dart';

class LocalDatasource {

  Future <List <Source>?> loadSources(String categoryID)async{
        var box =await Hive.openBox("news");
      var sources=  box.get(categoryID);

    return sources;
  }
  Future <void> savesources(String category, List <Source> sources)async{
    var box =await Hive.openBox("news");
    box.put(category, sources);//* to each category add sources

  }
}