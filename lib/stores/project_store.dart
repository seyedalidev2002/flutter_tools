import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter_tools/models/project_model.dart';
import 'package:flutter_tools/utils/asset_exception.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
part 'project_store.g.dart';

class ProjectStore = _ProjectStore with _$ProjectStore;

abstract class _ProjectStore with Store {
  @observable
  ProjectModel projectModel;

  _ProjectStore(this.projectModel);
  @observable
  bool isLoading = false;

  @action
  addAsset() async {
    // remeber to check font types
    try {
      if (isLoading) return;
        isLoading = true;

      final file = OpenFilePicker()
        ..filterSpecification = {}
        ..defaultFilterIndex = 0
        ..defaultExtension = 'assets'
        ..title = "Select your project's yaml file";

      final result = file.getFile();

      if (result == null) _copyasset(result);
    } on AssetException catch (e) {
      // showError()
    } finally {
      isLoading = false;
    }
  }

  _copyasset(File result) async {
    File file = File(projectModel.path);
    print(file.parent.path);
    Directory directory = Directory(
        file.parent.path + (Platform.isWindows ? r'\' : '/') + "assets");
    directory.create(recursive: true);
    print(directory.path);
    String copyPath = p.join(directory.path, p.basename(result.path));
    // File testFile = File(copyPath);
    // if (testFile.existsSync()) testFile.deleteSync();
    if (!isTypeValid(file)) throw AssetException("File type not supported");
    if (isDuplicatedFile(copyPath))
      throw AssetException("In the project folder there's a duplicated file");
    if (isYamlDuplicated(file))
      throw AssetException("In the yaml file there's a duplicated asset");

    File coppiedFile = await result.copy(copyPath);

    projectModel.yamlMap['flutter']['assets'].add(coppiedFile);
    isLoading = false;
  }

  bool isTypeValid(File file) {
    return true;
  }

  bool isDuplicatedFile(String copyPath) {
    // check if there's a duplicated file in the project folder
    return File(copyPath).existsSync();
  }

  bool isYamlDuplicated(File file) {
    String name = p.basenameWithoutExtension(file.path);
    var testVal = projectModel.yamlMap['flutter']['assets'][name];
    print("test val is " + testVal);
    return testVal != null;
  }

  @action
  deleteAsset() {}

  @action
  refresh() {}
  @action
  loadAssets() {}
}
