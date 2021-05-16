import 'package:flutter/material.dart';
import 'package:flutter_tools/consts/colors.dart';
import 'package:flutter_tools/pages/base_page.dart';
import 'package:flutter_tools/widgets/base_page_content.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({Key key}) : super(key: key);
  static const ROUTE_NAME = "AboutusPage";
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "About us",
      backButton: true,
      child: BasePageContent(
        title: "About us",
        icon: Icon(
          Icons.info_outline_rounded,
          size: 70,
          color: AppColors.white,
        ),
        child: Text(
            """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
 no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit"""),
      ),
    );
  }
}
