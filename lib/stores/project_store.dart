import 'package:flutter_tools/models/project_model.dart';
import 'package:mobx/mobx.dart';
part 'project_store.g.dart';
class ProjectStore = _ProjectStore with _$ProjectStore;


abstract class _ProjectStore with Store{
  @observable
  ProjectModel projectModel;

  _ProjectStore(this.projectModel);

  @action
  addAsset(){

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