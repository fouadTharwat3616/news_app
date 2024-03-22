import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/sources_response.dart';

class APIService{

 static Future<SourcesResponse> getSources(String CategoryId)async{
  try{
    final uri = Uri.https(
        'newsapi.org',
        '/v2/top-headlines/sources',
        {
          'apiKey' : '4d638ccff71a4cb88ad14ebabede249d',
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
}