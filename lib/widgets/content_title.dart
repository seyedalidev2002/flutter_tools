import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';

class ContentTitle extends StatelessWidget {
  const ContentTitle({Key key, this.icon, this.title}) : super(key: key);
  final Widget icon;
  final String title;
  final double padding = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: EdgeInsets.only(left: padding),
            child: Row(children: [
            icon,
              SizedBox(width: 16),
              Text(title , style: TextStyle(color: AppColors.white , fontWeight: FontWeight.w600 , fontSize: 18),)
            ])),
          SizedBox(height: 8,),
          Container(width: double.infinity , height: 1.5 ,color: AppColors.deepGreen,)
      ],
    ));
  }
}
