import 'package:flutter/material.dart';
import 'package:flutter_tools/widgets/content_title.dart';

class BasePageContent extends StatelessWidget {
  const BasePageContent({Key key, this.child, this.icon, this.title})
      : super(key: key);
  final Widget child, icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 50,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          ContentTitle(
            title: title,
            icon: icon
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
