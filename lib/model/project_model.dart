import 'package:flutter/material.dart';
import 'package:my_portfolio/ui/widgets/project/project.dart';

import '../common/projects/project.dart';

class ProjectModel extends ChangeNotifier {
  final List<Widget> data = [
    ProjectView(
      projectInfo: project_1,
    ),
    ProjectView(
      projectInfo: project_2,
    ),
  ];
}