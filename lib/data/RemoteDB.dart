import 'dart:async';
import 'dart:convert';

import 'package:rsscollector/ArticlesEntity.dart';
import 'package:rsscollector/CategoryEntity.dart';

import '../http/HttpApi.dart';

class RemoteDB {
  final HttpApi api = new HttpApi();
  
  Future<List<ArticlesEntity>> getHomeList(String dataURL) async {
    String result = await api.getHomeList(dataURL);
    List<dynamic> listDynamic = json.decode(result);
    List<ArticlesEntity> list = listDynamic.map((i) => ArticlesEntity.fromJson(i)).toList();
    return list;
  }

  Future<List<CategoryEntity>> getCategoryList()async {
    String result = await api.getCategoryList();
    List<dynamic> listDynamic = json.decode(result);
    List<CategoryEntity> list = listDynamic.map((i) => CategoryEntity.fromJson(i)).toList();
    return list;
  }

  Future<dynamic> getApiList()async {
    String result = await api.getApiList();
    return json.decode(result);
  }

  Future<String> getRSS(String dataURL)async {
    String result = await api.getUrl(dataURL);
    return result;
  }
}
