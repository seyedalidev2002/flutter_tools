import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key key, this.child, this.title, this.trailing, this.backButton = false}) : super(key: key);
  final Widget child , trailing;
  final String title;
  final bool backButton;
  @override
  Widget build(BuildContext context) {
    return WindowBorder(
      color: AppColors.deepGreen,
      child: Scaffold(
        backgroundColor: AppColors.lightGreen,
        body: Column(
          children: [
            
            Row(children: [
              SizedBox(width: 24),
              if (backButton)
                IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=>Navigator.of(context).pop()),
              if (!backButton)
                SizedBox(width: 24),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),

              if(trailing!=null)
                trailing,
              Expanded(child: Container(height: 20, child: MoveWindow())),
              GestureDetector(
                onTap: ()=>appWindow.close(),
                child: Icon(Icons.close )),
                SizedBox(width: 8),
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
