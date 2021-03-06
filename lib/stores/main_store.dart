import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/models/project_model.dart';
import 'package:flutter_tools/pages/main_page.dart';
import 'package:flutter_tools/services/db_serivce.dart';
import 'package:flutter_tools/stores/project_store.dart';
import 'package:mobx/mobx.dart';
import 'db_store.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

enum Pages { firstPage, mainPage, aboutUs }
enum MainState { init, loading, finished }

abstract class _MainStore with Store {
  @observable
  Pages onPage = Pages.firstPage;

  
  @observable
  MainState state = MainState.init;

  DbStore dbStore;
  ProjectStore projectStore;
  _MainStore() {
    dbStore = DbStore();
  }

  List<ProjectModel> projectsList = [];
  @action
  getProjects() async{
   // state = MainState.loading;
    // projectsList.add(ProjectModel(
    //     title: "Test project", path: "c:/users/user/dev/flutter/pubspec.yaml"));
    // projectsList.add(ProjectModel(
    //     title: "Test project", path: "c:/users/user/dev/flutter/pubspec.yaml"));
    projectsList = DBService.getProjects();
    print("finish");
    state = MainState.finished;
  }

  @action
  openProject(BuildContext context, ProjectModel projectModel) async {
    File file = File(projectModel.path);
    if (await file.exists()) {
      projectStore =
          ProjectStore(await ProjectModel.fromPubspec(file));
          print(projectStore.projectModel.yamlMap.toString());
      Navigator.of(context).pushReplacementNamed(MainPage.ROUTE_NAME);
    }else
      print("error");
  }

  @action
  deleteProject(int id) {}

  @action
  addNewProject(BuildContext context) async {
    final file = OpenFilePicker()
      ..filterSpecification = {
        'yaml files (*.yaml)': '*.yaml',
      }
      ..defaultFilterIndex = 0
      ..defaultExtension = 'yaml'
      ..title = "Select your project's yaml file";

    final result = file.getFile();
    if (result != null) {
      try {
        var _project = await ProjectModel.fromPubspec(result);
        projectStore = ProjectStore(_project);
        await DBService.saveProject(_project);
        Navigator.of(context).pushReplacementNamed(MainPage.ROUTE_NAME);
      } catch (e) {
        print("File has some problems");
      }
    }
  }
}
