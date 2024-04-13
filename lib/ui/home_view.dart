import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:my_portfolio/ui/home_aboutme.dart';
import 'package:my_portfolio/ui/home_contact.dart';
import 'package:my_portfolio/ui/home_footer.dart';

import 'home_intro.dart';
import 'home_nav.dart';
import 'home_project.dart';
import 'home_skills.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late FlutterListViewController controller;
  @override
  void initState() {
    super.initState();
    controller = FlutterListViewController();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      const NavView(color: Colors.blue),
      IntroView(controller.sliverController.animateToIndex),
      const SkillMenuView(),
      const ProjectViewPage(),
      const AboutMe(),
      const ContactView(),
      Footer(controller.sliverController.animateToIndex),
    ];
    return Scaffold(
      body: SafeArea(
        child: FlutterListView.builder(
          controller: controller,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }
}