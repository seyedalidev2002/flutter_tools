import 'dart:io';

import 'package:flutter_tools/models/project_model.dart';
import 'package:hive/hive.dart';

class DBService {
  static const mainBox = "mainBox";
  static const _projects = "projects";
  static Future<List<ProjectModel>> getProjects() async {
    List projectList = Hive.box(mainBox).get(_projects, defaultValue: []);
    List<ProjectModel> result = [];
    for (Map<String, dynamic> map in projectList)
      result.add(await ProjectModel.fromPubspec(File(map['path'])));
    return result;
  }
  static saveProject(ProjectModel) async{
    // Hive.box(_projects).add(value)
  }
}
