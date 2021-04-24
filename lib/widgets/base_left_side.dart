import 'package:flutter/material.dart';

class BaseLeftSide extends StatelessWidget {
  const BaseLeftSide({Key key, this.content, this.title}) : super(key: key);
  final Widget content;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top:8 , left: 24),
          child: Text(title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        content
      ],
    );
  }
}
