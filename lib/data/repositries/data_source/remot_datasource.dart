import 'package:news/data/model/api_maneger.dart';
import 'package:news/data/model/sources.dart';

class RemotDatasource {
  ApiManeger apiManeger;//* when your ned to add the paramitter send it in the constructor 
  RemotDatasource({required this .apiManeger});
  Future <List <Source>?> loadSources(String categoryID){
  return apiManeger.loadSources(categoryID);

  }
} 