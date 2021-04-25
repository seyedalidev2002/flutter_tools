import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/models/project_model.dart';
import 'package:flutter_tools/pages/main_page.dart';
import 'package:flutter_tools/stores/project_store.dart';
import 'package:mobx/mobx.dart';
import 'db_store.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

enum Pages { firstPage, mainPage, aboutUs }

abstract class _MainStore with Store {
  @observable
  Pages onPage = Pages.firstPage;

  DbStore dbStore;
  ProjectStore projectStore;
  _MainStore() {
    dbStore = DbStore();
  }

  List<ProjectModel> projectsList = [];

  getProjects() {}
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
      projectStore = ProjectStore(await ProjectModel.fromPubspec(result));
      Navigator.of(context).pushReplacementNamed(MainPage.ROUTE_NAME);
    }
  }
}
