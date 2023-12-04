import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:islami/api/radioModel.dart';

class ApiManager {
  static Future<RadioModel> getApiData() async {
    var url = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
    Response response = await http.get(url);
    var json = jsonDecode(response.body);
    RadioModel radioModel = RadioModel.fromJson(json);
    return radioModel;
  }
}
