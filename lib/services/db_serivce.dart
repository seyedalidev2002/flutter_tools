import 'dart:io';

import 'package:flutter_tools/models/project_model.dart';
import 'package:hive/hive.dart';

class DBService {
  static const mainBox = "mainBox";
  static const projects = "projects";
  static List<ProjectModel> getProjects()  {
    var map = Hive.box(projects).toMap();
    List<ProjectModel> list = [];
    map.forEach((key, value) {
      print(key);
      list.add(ProjectModel.fromJson(value));
    });
    return list;
  }

  static saveProject(ProjectModel model) async {
    await Hive.box(projects).add(model.toJson());
  }
}
