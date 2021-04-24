import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';
import 'package:flutter_tools/pages/base_page.dart';
import 'package:flutter_tools/stores/main_store.dart';
import 'package:flutter_tools/widgets/base_left_side.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainStore store = Provider.of<MainStore>(context);
    return BasePage(
      leftWidget: getLeftSide(store),
      rightWidget: getRightSide(store)
    );
  }
  Widget getRightSide(MainStore store){
    return Center(child: Text("sjdkaldsj"),);
  }
  Widget getLeftSide(MainStore store) {
    return BaseLeftSide(
      title: "Proejcts",
      content: Expanded(
        child: Center(
          child: MaterialButton(
            child: Text("Add new project"),
            onPressed: (){},
            textColor: AppColors.deepGreen,
            color: AppColors.yellow,
          ),
        ),
      ),
    );
  }
}
