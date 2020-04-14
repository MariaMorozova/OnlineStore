import 'dart:async';
import 'package:http/http.dart' as http;

class BaseApi{
  static const String baseApiUrl = 'http://ostest.whitetigersoft.ru/api/';
  static const String apiKey = 'appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF';

  static Future<String> loadJson(http.Client client, String additionalUrl ) async {
    final response = await client.get(BaseApi.baseApiUrl + additionalUrl + BaseApi.apiKey);
    return response.body;
  }
}