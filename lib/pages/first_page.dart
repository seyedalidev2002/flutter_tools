import 'package:bitsdojo_window/bitsdojo_window.dart';
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
    return WindowBorder(
      color: Colors.green,
      child: Scaffold(
        body: BasePage(
            leftWidget: getLeftSide(store, context),
            rightWidget: getRightSide(store)),
      ),
    );
  }

  Widget getRightSide(MainStore store) {
    return Center(
      child: Text("sjdkaldsj"),
    );
  }

  Widget getLeftSide(MainStore store, BuildContext context) {
    return BaseLeftSide(
      title: "Proejcts",
      trailing: InkWell(
        radius: 10,
        onTap: () => store.addNewProject(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      content: Expanded(
        child: Column(
          children: [Spacer(), Text('No projects added'), Spacer()],
        ),
      ),
    );
  }
}
