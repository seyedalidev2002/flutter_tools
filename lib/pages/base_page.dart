import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key key, this.rightWidget, this.leftWidget})
      : super(key: key);
  final Widget rightWidget, leftWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.lightGreen,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Material(
                    elevation: 16,
                    color: AppColors.deepGreen,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Container(height: double.infinity, child: leftWidget),
                  ),
                ),
                
                Expanded(
                  flex: 5,
                  child: Container(
                      height: double.infinity,
                      color: AppColors.lightGreen,
                      child: rightWidget),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
