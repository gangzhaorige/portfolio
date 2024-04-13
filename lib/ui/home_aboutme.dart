import 'package:flutter/material.dart';
import 'package:my_portfolio/ui/widgets/about/about.dart';

import 'home_skills.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with TickerProviderStateMixin {

  late final AnimationController _textAnimationController;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _textAnimationController.forward();
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  void dosomething(){

  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: MyClipTop(),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.blue,
                width: 0,
              )
            ),
          ),
        ),
        const AboutMeContent(),
        ClipPath(
          clipper: MyClip(complete: true),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.blue,
                width: 0,
              )
            ),
          ),
        ),
      ],
    );
  }
}