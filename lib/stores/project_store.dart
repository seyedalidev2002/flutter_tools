import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter_tools/models/project_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:io' ;
part 'project_store.g.dart';

class ProjectStore = _ProjectStore with _$ProjectStore;

abstract class _ProjectStore with Store{
  @observable
  ProjectModel projectModel;

  _ProjectStore(this.projectModel);

  @action
  addAsset() async {
    // remeber to check font types 
    final file = OpenFilePicker()
      ..filterSpecification = {
       
      }
      ..defaultFilterIndex = 0
      ..defaultExtension = 'assets'
      ..title = "Select your project's yaml file";

    final result = file.getFile();
    if (result != null) {
      File coppiedFile = await result.copy(projectModel.path+(Platform.isWindows?r'\':'/')+"assets");
      projectModel.yamlMap['flutter']['assets'].add();
    }
  }

  @action
  deleteAsset(){

  }

  @action
  refresh(){

  }
  @action
  loadAssets(){

  }
}