import 'dart:io';

import 'package:flutter_tools/models/asstes_model.dart';
import 'package:yaml/yaml.dart';

class ProjectModel {
  final String title, path;
  final Map<String, dynamic> yamlMap;
  bool isValid = false;
  final List<AssetModel> assets;
  ProjectModel({this.title, this.path, this.assets, this.yamlMap});

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
    // List<String> folders = file.path.split(Platform.isWindows ? r"\" : "/");
    // String folderStr = "";
    // for (int i = 0; i < folders.length - 1; i++) {
    //   if (i != 0)
    //     folderStr = folderStr + (Platform.isWindows ? r"\" : "/") + folders[i];
    //   else
    //     folderStr += folders[i];
    // }

    // print(folderStr);
    // String title = folders[folders.length - 2];

    Map<String, dynamic> myMap = Map();
    YamlMap yamlMap = loadYaml(await file.readAsString());

    _yamlToMap(yamlMap, myMap);
    List assets = myMap['flutter']['assets'];
    
    List<AssetModel> assetModelsList = [];

    assets.forEach((element) {
      assetModelsList
          .add(AssetModel(element.toString().split("/").last, element));
    });
    return ProjectModel(
        title: myMap['name'],
        assets: assetModelsList,
        path: file.path,
        yamlMap: myMap);
  }

  static ProjectModel fromMap(Map<String , dynamic> map){
    // return ProjectModel.fromPubspec(File(map['path']))
  }
}
