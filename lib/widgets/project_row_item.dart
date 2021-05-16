import 'package:flutter/material.dart';
import 'package:flutter_tools/models/project_model.dart';
import 'package:flutter_tools/stores/main_store.dart';
import 'package:provider/provider.dart';

class ProjectRowItem extends StatelessWidget {
  const ProjectRowItem({Key key, this.id, this.projectModel}) : super(key: key);
  final int id;
  final ProjectModel projectModel;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Provider.of<MainStore>(context , listen: false).openProject(context, projectModel);
      },

      child: Container(
        child: Row(
          children: [
            Text(id.toString()),
            SizedBox(
              width: 16,
            ),
            Text(projectModel.title),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                projectModel.path,
                //overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 16),
           
            IconButton(icon: Icon(Icons.remove , color: Colors.red,), onPressed: () { Provider.of<MainStore>(context , listen: false).deleteProject(id-1);})
          ],
        ),
      ),
    );
  }
}
