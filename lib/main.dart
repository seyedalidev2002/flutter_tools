import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tools/pages/aboutus_page.dart';
import 'package:flutter_tools/pages/first_page.dart';
import 'package:flutter_tools/pages/main_page.dart';
import 'package:flutter_tools/services/db_serivce.dart';
import 'package:flutter_tools/stores/main_store.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';



void main() async {
  await Hive.initFlutter();
  await Hive.openBox(DBService.projects);
  runApp(MyApp());
  doWhenWindowReady(() {
    final initialSize = Size(850, 500);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => MainStore())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routes: {
          '/': (_) => FirstPage(),
          MainPage.ROUTE_NAME: (_) => MainPage(),
          AboutusPage.ROUTE_NAME: (_) => AboutusPage()
        },
      ),
    );
  }
}
