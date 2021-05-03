import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';

class BaseLeftSide extends StatelessWidget {
  const BaseLeftSide({Key key, this.content, this.title, this.trailing})
      : super(key: key);
  final Widget content, trailing;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Row(
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              Expanded(child: Container(height: 20, child: MoveWindow())),
              trailing ??
                  Container(
                    height: 0,
                    width: 0,
                  )
            ],
          ),
        ),
        content
      ],
    );
  }
}
