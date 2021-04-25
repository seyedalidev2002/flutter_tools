import 'dart:io';

import 'package:flutter_tools/models/asstes_model.dart';
import 'package:yaml/yaml.dart';

class ProjectModel {
  final String title, path;
  bool isValid = false;
  final List<AssetModel> assets;
  ProjectModel({this.title, this.path, this.assets});

  static _yamlToMap(YamlMap map, Map<String, dynamic> myMap) {
    map.forEach((key, value) {
      if (value.runtimeType.toString() == "YamlMap") {
        Map<String, dynamic> map = Map();
        _yamlToMap(value, map);
        myMap[key] = map;
      } else {
        myMap[key] = value;
      }
    });
  }

  static Future<ProjectModel> fromPubspec(File file) async {
    List<String> folders = file.path.split('/');
    // String title = folders[folders.length - 2];

    Map<String, dynamic> myMap = Map();
    YamlMap yamlMap = loadYaml(await file.readAsString());

    _yamlToMap(yamlMap, myMap);
    List assets = myMap['flutter']['assets'];
    List<AssetModel> assetModelsList = [];
    assets.forEach((element) {
      assetModelsList.add(AssetModel("aa", element));
    });
    return ProjectModel(title: "title", assets: assetModelsList, path: file.path);
  }
}
