import 'package:flutter/material.dart';
import 'package:my_portfolio/ui/widgets/skills/switcher.dart';
import 'package:responsive_builder/responsive_builder.dart';


class SkillMenuView extends StatelessWidget {

  const SkillMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: getValueForScreenType(
              context: context,
              mobile: 50,
              desktop: 100,
            )
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.blue,
              width: 0,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Skills',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 30,
                    desktop: 40,
                  ),
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),
              ),
              const Switcher()
            ],
          ),
        ),
        ScreenTypeLayout.builder(
          desktop: (_) => ClipPath(
            clipper: MyClip(complete: false),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.blue,
                  width: 0,
                )
              ),
            ),
          ),
          mobile: (_) => Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.blue,
                width: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyClip extends CustomClipper<Path> {

  final bool complete;

  MyClip({super.reclip, required this.complete});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double customWidth = complete ? 0 : size.width / 4;
    path.lineTo(customWidth, size.height);
    path.lineTo(size.width, size.height - 150);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}

class MyClipTop extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 150);
    path.lineTo(size.width, size.height);
     path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}