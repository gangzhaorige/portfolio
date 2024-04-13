import 'package:flutter/material.dart';
import 'package:my_portfolio/common/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../model/project_model.dart';
import 'common/slide_fade.dart';

class ProjectViewPage extends StatelessWidget {

  const ProjectViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: getValueForScreenType(
                      context: context,
                      mobile: 30,
                      desktop: 40,
                    ),
                    fontWeight: FontWeight.w900,
                    color: kcPrimaryColorDark
                  ),
                ),
              ],
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ProjectModel(),
          child: Selector<ProjectModel, List<Widget>>(
            selector: (_, foo) => foo.data,
            builder: (_, data, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for(int i = 0; i < data.length; i++) ... [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: SizedBox(
                        width: 1200,
                        child: MySlideTransition(
                          offset: Offset(i % 2 == 0 ? 0.10 : -0.10,0),
                          duration: const Duration(milliseconds: 1000),
                          child: data[i],
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
            shouldRebuild: (previous, next) {
              return false;
            },
          ),
        ),
      ],
    );
  }
}
