// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$onPageAtom = Atom(name: '_MainStore.onPage');

  @override
  Pages get onPage {
    _$onPageAtom.reportRead();
    return super.onPage;
  }

  @override
  set onPage(Pages value) {
    _$onPageAtom.reportWrite(value, super.onPage, () {
      super.onPage = value;
    });
  }

  final _$stateAtom = Atom(name: '_MainStore.state');

  @override
  MainState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(MainState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$openProjectAsyncAction = AsyncAction('_MainStore.openProject');

  @override
  Future openProject(BuildContext context, ProjectModel projectModel) {
    return _$openProjectAsyncAction
        .run(() => super.openProject(context, projectModel));
  }

  final _$addNewProjectAsyncAction = AsyncAction('_MainStore.addNewProject');

  @override
  Future addNewProject(BuildContext context) {
    return _$addNewProjectAsyncAction.run(() => super.addNewProject(context));
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  dynamic getProjects() {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore.getProjects');
    try {
      return super.getProjects();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteProject(int id) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore.deleteProject');
    try {
      return super.deleteProject(id);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onPage: ${onPage},
state: ${state}
    ''';
  }
}
