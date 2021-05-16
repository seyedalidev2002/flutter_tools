import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key, this.onPressed, this.title, this.icon}) : super(key: key);
  final Function onPressed;
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      minWidth: 200,
      child: Text(title),
      color: AppColors.yellow,
      textColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
