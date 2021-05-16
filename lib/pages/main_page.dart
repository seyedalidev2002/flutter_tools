import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tools/consts/colors.dart';
import 'package:flutter_tools/models/project_model.dart';
import 'package:flutter_tools/stores/main_store.dart';
import 'package:flutter_tools/stores/project_store.dart';
import 'package:flutter_tools/widgets/base_left_side.dart';
import 'package:flutter_tools/widgets/base_page_content.dart';
import 'package:flutter_tools/widgets/custome_button.dart';
import 'package:provider/provider.dart';

import 'base_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);
  static const ROUTE_NAME = "/MainPage";
  @override
  Widget build(BuildContext context) {
    ProjectStore store = Provider.of<MainStore>(context).projectStore;
    return Scaffold(
      body: BasePage(
        backButton: true,
        title: store.projectModel.title,
        child: BasePageContent(
            title: "Assets",
            icon: Icon(
              Icons.account_balance_rounded,
              size: 70,
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Expanded(child: _getAssets(store)),
                CustomButton(
                  onPressed: () {
                    Provider.of<MainStore>(context, listen: false)
                        .addNewProject(context);
                  },
                  title: "Add new project",
                ),
                SizedBox(
                  height: 32,
                )
              ],
            )),
      ),
    );
  }

  Widget _getAssets(ProjectStore projectStore) {
    Widget child = Observer(
      builder: (context) {
        var assets = projectStore.projectModel.assets ?? [];
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
                onPressed: () => projectStore.addAsset(),
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
    return child;
  }
}

class MainPageButtom extends StatelessWidget {
  const MainPageButtom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
