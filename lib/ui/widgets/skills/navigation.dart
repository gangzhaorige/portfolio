import 'package:flutter/material.dart';
import 'package:my_portfolio/ui/widgets/skills/home_skills.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key, required this.animateToIndex});

  final Future<void> Function(int index, {
    required Duration duration,
    required Curve curve,
    double offset,
    bool offsetBasedOnBottom,
  }) animateToIndex;

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'Skills', 'Projects', 'About', 'Contact',
    ];
    return ScreenTypeLayout.builder(
      mobile: (_) => IntrinsicWidth(
        child: Column(
          children: [
            for (int i = 0; i < list.length; i++) ...[
              MyButton(
                text: list[i],
                onPressed:() => animateToIndex(
                  i + 2,
                  curve: Curves.linear,
                  duration: const Duration(
                    milliseconds: 500
                  ),
                ),
                fontSize: 25,
                width: 250,
              ),
            ],
          ],
        ),
      ),
      desktop: (_) => Row(
        mainAxisAlignment: getValueForScreenType(
          context: context,
          mobile: MainAxisAlignment.center,
          tablet: MainAxisAlignment.center,
          desktop: MainAxisAlignment.start,
        ),
        children: [
          for (int i = 0; i < list.length; i++) ...[
            MyButton(
              text: list[i],
              onPressed:() => animateToIndex(
                i + 2,
                curve: Curves.linear,
                duration: const Duration(
                  milliseconds: 500
                ),
              ),
              fontSize: 25,
              width: 250,
            ),
          ],
        ],
      ),
    );
  }
}