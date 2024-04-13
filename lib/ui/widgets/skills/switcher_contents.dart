import 'package:flutter/material.dart';
import 'package:my_portfolio/common/ui_helpers.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../model/switcher_model.dart';
import '../../common/slide_fade.dart';

class SwitcherContents extends StatelessWidget {
  const SwitcherContents({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [
      const DefaultContent(),
      SkillExample(
        text: 'Front End',
        data: [
          IconText('React', 'assets/svg/react.svg'),
          IconText('Redux', 'assets/svg/redux.svg'),
          IconText('JavaScript', 'assets/svg/js.svg'),
          IconText('Flutter', 'assets/svg/flutter.svg'),
          IconText('Dart', 'assets/svg/dart.svg'),
          IconText('HTML', 'assets/svg/html.svg'),
          IconText('CSS', 'assets/svg/css.svg'),
        ],
      ),
      SkillExample(
        text: 'Back End',
        data: [
          IconText('Django', 'assets/svg/django.svg'),
          IconText('Python', 'assets/svg/python.svg'),
          IconText('Java', 'assets/svg/java.svg'),
          IconText('Spring Boot', 'assets/svg/springboot.svg'),
          IconText('JPA Hibernate', 'assets/svg/hibernate.svg'),
          IconText('Restful API', 'assets/svg/api.svg'),
        ],
      ),
      SkillExample(
        text: 'Others',
        data: [
          IconText('Amazon Web Service', 'assets/svg/aws.svg'),
          IconText('VS Code', 'assets/svg/vscode.svg'),
          IconText('MySQL', 'assets/svg/mysql.svg'),
          IconText('Postgres', 'assets/svg/postgres.svg'),
        ],
      ),
    ];
    return SizedBox(
      width: 700,
      child: Selector<SwitchNavigation, int>(
        selector: (_, foo) => foo.getIndex(),
        builder: (_, index, __) {
          return MySlideTransitionUpdate(
            offset: const Offset(0.10,0),
            duration: const Duration(milliseconds: 750),
            child: data[index],
          );
        },
        shouldRebuild: (previous, next) {
          if(previous != next) {
            return true;
          }
          return false;
        },
      ),
    );
  }
}


class DefaultContent extends StatelessWidget {
  const DefaultContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Building application is important.',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              desktop: 30,
              mobile: 18,
            ),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpaceMedium,
        Text(
          'It requires proper tech stacks.',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              desktop: 25,
              mobile: 16,
            ),
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpaceMedium,
        Text(
          'Hover over the cards to show stack skills.',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              desktop: 25,
              mobile: 16,
            ),
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

}