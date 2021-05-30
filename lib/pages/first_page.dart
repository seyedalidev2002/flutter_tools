import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tools/consts/colors.dart';
import 'package:flutter_tools/pages/aboutus_page.dart';
import 'package:flutter_tools/pages/base_page.dart';
import 'package:flutter_tools/stores/main_store.dart';
import 'package:flutter_tools/widgets/base_left_side.dart';
import 'package:flutter_tools/widgets/base_page_content.dart';
import 'package:flutter_tools/widgets/custome_button.dart';
import 'package:flutter_tools/widgets/project_row_item.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  static const ROUTE_NAME = "FirstPage";
  @override
  Widget build(BuildContext context) {
    
    return BasePage(
      trailing:IconButton(icon: Icon(Icons.info) , onPressed: ()=>Navigator.of(context).pushNamed(AboutusPage.ROUTE_NAME),),
      title: "Flutter Tools",
      child: BasePageContent(
          title: "Projecstssss",
          icon: Icon(
            Icons.account_balance_rounded,
            size: 70,
            color: AppColors.white,
          ),
          child: Column(
            children: [
              Expanded(child: ProjectList()),
              CustomButton(
                onPressed: () {Provider.of<MainStore>(context , listen: false).addNewProject(context);},
                title: "Add new project",
              ),
              SizedBox(height: 32,)
            ],
          )),
    );
  }

}

class ProjectList extends StatelessWidget {
  const ProjectList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (ctx) {
      MainStore store = Provider.of<MainStore>(ctx);
      print(store.projectsList);
      print(store.state);
      switch (store.state) {
        case MainState.init:
          store.getProjects();
          return Center(
            child: CircularProgressIndicator()
          );
          break;
        case MainState.loading:
          return Center(
            child: CircularProgressIndicator()
          );
          break;
        case MainState.finished:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: store.projectsList.length,
              itemBuilder: (context, index) => ProjectRowItem(
                id: index + 1,
                projectModel: store.projectsList[index],
              ),
            ),
          );
          break;
      }
    });
  }
}
