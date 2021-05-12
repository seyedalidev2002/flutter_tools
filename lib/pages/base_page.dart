import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key key, this.child, this.title}) : super(key: key);
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return WindowBorder(
      color: AppColors.deepGreen,
      child: Scaffold(
        backgroundColor: AppColors.lightGreen,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(children: [
              SizedBox(width: 24),
              Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 18),
              ),
              Expanded(child: Container(height: 20, child: MoveWindow()))
            ]),
            SizedBox(
              height: 50,
            ),
            Expanded(child: child)
          ],
        ),
      ),
    );
  }
}
