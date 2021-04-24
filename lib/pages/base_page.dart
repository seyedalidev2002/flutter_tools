import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key key, this.rightWidget, this.leftWidget})
      : super(key: key);
  final Widget rightWidget, leftWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex:3,
            child: Container(
              height: double.infinity,
              color: AppColors.deepGreen, child: leftWidget),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: double.infinity,
              color: AppColors.lightGreen, child: rightWidget),
          )
        ],
      ),
    );
  }
}
