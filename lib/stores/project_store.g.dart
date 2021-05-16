// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectStore on _ProjectStore, Store {
  final _$projectModelAtom = Atom(name: '_ProjectStore.projectModel');

  @override
  ProjectModel get projectModel {
    _$projectModelAtom.reportRead();
    return super.projectModel;
  }

  @override
  set projectModel(ProjectModel value) {
    _$projectModelAtom.reportWrite(value, super.projectModel, () {
      super.projectModel = value;
    });
  }

  final _$addAssetAsyncAction = AsyncAction('_ProjectStore.addAsset');

  @override
  Future addAsset() {
    return _$addAssetAsyncAction.run(() => super.addAsset());
  }

  final _$_ProjectStoreActionController =
      ActionController(name: '_ProjectStore');

  @override
  dynamic deleteAsset() {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.deleteAsset');
    try {
      return super.deleteAsset();
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic refresh() {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.refresh');
    try {
      return super.refresh();
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loadAssets() {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.loadAssets');
    try {
      return super.loadAssets();
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projectModel: ${projectModel}
    ''';
  }
}
