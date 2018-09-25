import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpApi {
  Future<String> getUrl(String dataURL) async {
    try {
      http.Response response = await http.get(dataURL);
      if (response.statusCode == 200) {
        return utf8.decode(response.bodyBytes); //response.body;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String> getHomeList(String dataURL) async {
    return await this.getUrl(dataURL);
  }

  Future<String> getCategoryList() async {
    String dataURL = "https://chocolatetan.github.io/Collector/collection.html";
    return await this.getUrl(dataURL);
  }

  Future<String> getApiList() async {
    String dataURL = "https://chocolatetan.github.io/Collector/api.html";
    return await this.getUrl(dataURL);
  }
}
