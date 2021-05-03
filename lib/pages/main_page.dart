import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tools/consts/colors.dart';
import 'package:flutter_tools/stores/main_store.dart';
import 'package:flutter_tools/stores/project_store.dart';
import 'package:flutter_tools/widgets/base_left_side.dart';
import 'package:provider/provider.dart';

import 'base_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);
  static const ROUTE_NAME = "/MainPage";
  @override
  Widget build(BuildContext context) {
    MainStore store = Provider.of<MainStore>(context);
    return Scaffold(
      body: BasePage(
          leftWidget: getLeftSide(store), rightWidget: getRightSide(store)),
    );
  }

  Widget getRightSide(MainStore store) {
    return Center(
      child: Text("drop your files here"),
    );
  }

  Widget getLeftSide(MainStore store) {
    Widget child = Observer(
      builder: (context) {
        var assets = store.projectStore.projectModel.assets ?? [];
        if (assets.length == 0)
          return Column(
            children: [
              Spacer(),
              Text("no assets detected"),
              Spacer(),
              MaterialButton(
                minWidth: 150,
                height: 38,
                child: Text(
                  "add new asset",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                textColor: AppColors.deepGreen,
                color: AppColors.yellow,
              ),
            ],
          );
        return ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(assets[index].path),
          ),
          itemCount: assets.length,
        );
      },
    );
    return BaseLeftSide(
      title: "${store.projectStore.projectModel.title}'s assets",
      content: Expanded(child: child),
    );
  }
}

class MainPageButtom extends StatelessWidget {
  const MainPageButtom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
