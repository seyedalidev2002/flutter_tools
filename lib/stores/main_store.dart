import 'package:flutter_tools/models/project_model.dart';
import 'package:mobx/mobx.dart';
import 'db_store.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

enum Pages { firstPage, mainPage, aboutUs }

abstract class _MainStore with Store {
  @observable
  Pages onPage = Pages.firstPage;

  DbStore dbStore;

  _MainStore() {
    dbStore = DbStore();
  }

  List<ProjectModel> projectsList = [];

  getProjects(){
    
  }
  @action
  addNewProject(){

  }
}
