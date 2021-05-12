import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';
import 'package:flutter_tools/pages/base_page.dart';
import 'package:flutter_tools/stores/main_store.dart';
import 'package:flutter_tools/widgets/base_left_side.dart';
import 'package:flutter_tools/widgets/base_page_content.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  static const ROUTE_NAME = "FirstPage";
  @override
  Widget build(BuildContext context) {
    MainStore store = Provider.of<MainStore>(context);
    return BasePage(title: "Flutter Tools",child: BasePageContent(),);
  }

}