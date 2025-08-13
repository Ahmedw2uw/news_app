import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news/data/model/artecle_response.dart';
import 'package:news/data/model/artecles.dart';
import 'package:news/data/model/sources.dart';
import 'package:news/data/model/sources_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManeger {
  final String baseUrl = "https://newsapi.org/v2";
  final String apiKey = "ca5cfda49cb5405383b81622ca653ddc";
  late Dio dio;
  ApiManeger() {
    dio = Dio(
      BaseOptions(queryParameters: {"apiKey": apiKey}, baseUrl: baseUrl),
    );
    dio.interceptors.add(PrettyDioLogger( requestHeader: true)); //* this is same of the interseptor to print the headders
  } //* obgect from interseptor

  Future<List<Source>?> loadSources(String category) async {
    try {
      Response response = await dio.get(
        "/top-headlines/sources",
        queryParameters: {"category": category},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        SourcesResponse myResponce = SourcesResponse.fromJson(response.data);
        return myResponce.sources;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<Article>?> loadArtecles(String sourceId) async {
    if (sourceId.isEmpty) return null;

    try {
      Response response = await dio.get(
        "/everything",
        queryParameters: {"sources": sourceId},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        ArticleResponse myResponce = ArticleResponse.fromJson(response.data);
        return myResponce.articles;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

// class AppInteseptor extends Interceptor{//* its must be extends of the interseptor class 
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     log("Reqyest || ${options.method} -> ${options.path}");//* this to control of the interseptor prints 
//     super.onRequest(options, handler);
     
//   }//* this to control of the request to can add eny actions
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // TODO: implement onResponse
//     super.onResponse(response, handler);
//   }//* this to control of the respons to can add eny actions
  

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // TODO: implement onError
//     super.onError(err, handler);
//   }//* this to control of the error to can add eny actions
   
// }

