
import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';
import 'package:flutter_tools/stores/main_store.dart';
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
    return BaseLeftSide(
      title: "Assets",
      content: Expanded(
        child: Center(
          child: MaterialButton(
            minWidth: 150,
            height: 38,
            child: Text(
              "add new asset",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
             
            },
            textColor: AppColors.deepGreen,
            color: AppColors.yellow,
          ),
        ),
      ),
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
