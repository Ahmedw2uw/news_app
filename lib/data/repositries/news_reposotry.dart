import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news/data/model/sources.dart';
import 'package:news/data/repositries/data_source/local_datasource.dart';
import 'package:news/data/repositries/data_source/remot_datasource.dart';

class NewsReposotry {
  LocalDatasource localDatasource;
  RemotDatasource remotDatasource;
  Connectivity connectivity;
  NewsReposotry(this.localDatasource, this.remotDatasource, this.connectivity);

  Future<List<Source>?> loadSources(String categoryID) async {
    var result = await connectivity.checkConnectivity(); //* this object is carry the conection status 
    if (result.contains(ConnectivityResult.mobile) ||  //* hear chick if has dataor wifi
        result.contains(ConnectivityResult.wifi)) {
      var sources = await remotDatasource.loadSources(categoryID);
      localDatasource.savesources(categoryID,sources??[]);//* if null put empty list 
      return sources;
    } else {
      return localDatasource.loadSources(categoryID);
    }
  }
}
