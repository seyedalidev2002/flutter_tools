import 'package:flutter_tools/models/asstes_model.dart';

class ProjectModel{
  final String title , path;
  bool isValid = false;
  final List<AssetModel> assets;
  ProjectModel({this.title, this.path, this.assets});
   
}