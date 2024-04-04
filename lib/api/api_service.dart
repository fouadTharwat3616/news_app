import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/sources_response.dart';

class APIService{

 static Future<SourcesResponse> getSources(String CategoryId)async{
  try{
    final uri = Uri.https(
        ApiConstants.baseUrl,
        ApiConstants.sourceEndpoint,
        {
          'apiKey' : ApiConstants.apiKey,
          'category' : CategoryId
        }
    );
    final response= await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }catch(error){
    print(error);
    rethrow;
  }
  }

  static Future<NewsResponse> getNews(String sourceId)async{
   try{
     final uri = Uri.https(
         ApiConstants.baseUrl,
         ApiConstants.newsEndpoint,
       {
         'apiKey' : ApiConstants.apiKey,
         'sources':sourceId
       }
     );
     final Response = await http.get(uri);
     final json = jsonDecode(Response.body);
     return NewsResponse.fromJson(json);
   }catch(error){
     print(error);
     rethrow;
   }
  }
 static Future<NewsResponse> searchNews(String q)async{
   try{
     final uri = Uri.https(
         ApiConstants.baseUrl,
         ApiConstants.newsEndpoint,
         {
           'apiKey' : ApiConstants.apiKey,
           'q': q
         }
     );
     final Response = await http.get(uri);
     final json = jsonDecode(Response.body);
     return NewsResponse.fromJson(json);
   }catch(error){
     print(error);
     rethrow;
   }
 }
  // static Future<News> fetchAllDataAboutNews(String sourceId)async{
  //  try{
  //   final uri= Uri.https(
  //      ApiConstants.baseUrl,
  //      ApiConstants.newsDetailsEndpoint,
  //      {
  //        'apiKey' : ApiConstants.apiKey,
  //        'sources':sourceId,
  //      }
  //
  //    );
  //   final Response =await http.get(uri);
  //   final json = jsonDecode(Response.body);
  //   return News.fromJson(json);
  //  }catch(error){
  //    print(error);
  //    rethrow;
  //  }
}