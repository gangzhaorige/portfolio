import 'package:flutter/material.dart';
import 'package:my_portfolio/locator.dart';
import 'package:my_portfolio/services/url_launcher_services.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../common/projects/project.dart';
import '../../../common/ui_helpers.dart';
import '../../common/slide_fade.dart';
import '../skills/home_skills.dart';

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.blue,
          width: 0,
        )
      ),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                mobile: 30,
                desktop: 40,
              ),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceLarge,
          SizedBox(
            width: 1000,
            child: ScreenTypeLayout.builder(
              desktop: (context) => const IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: AboutImage(),
                    ),
                    horizontalSpaceMedium,
                    Expanded(
                      flex: 6,
                      child: AboutDescription(),
                    ),
                  ],
                ),
              ),
              tablet: (context) => const Column(
                children: [
                  AboutImage(),
                  verticalSpaceMedium,
                  AboutDescription()
                ],
              ),
              mobile: (context) => const Column(
                children: [
                  AboutImage(),
                  verticalSpaceMedium,
                  AboutDescription()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AboutImage extends StatefulWidget {
  const AboutImage({super.key});

  @override
  State<AboutImage> createState() => _AboutImageState();
}

class _AboutImageState extends State<AboutImage> {
  late AssetImage assetImage;

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage(
      'assets/images/standing2.png',
      
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies(); 
    precacheImage(assetImage, context);   
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: assetImage,
      height: 350,
    );
  }
}

class AboutDescription extends StatelessWidget {
  const AboutDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return MySlideTransition(
      offset: const Offset(1, 0),
      duration: const Duration(seconds: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A dedicated software engineer with a passion for innovation and a diverse linguistic background. I am proficient in four languages: Mongolian, Russian, English, and Mandarin",
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                desktop: 18,
                mobile: 16,
              ),
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          Text(
            "In 2018, I graduated from San Francisco State University with a bachelor's degree in Computer Science. Currently pursuing master's degree at San Francisco Bay University.",
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                desktop: 18,
                mobile: 16,
              ),
              color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          Text(
            "As a lifelong learner and chess enthusiast. I'm drawn to the interplay of strategy, problem-solving, and creativity, essential for my journey as a software engineer. I thrive on intricate challenges and pushing technology's boundaries.",
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                desktop: 18,
                mobile: 16,
              ),
              color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          Align(
            alignment: Alignment.center,
            child: MyButton(
              text: 'Resume',
              onPressed: ()=> {
                locator<UrlLauncherService>().launchInBrowser(
                  const Link(
                    host: 'drive.google.com',
                    path: '/file/d/1vn7fv79aMD6MF8ckPWi_VHj6RzC6VnXW/view'
                  ),
                ),
              },
              width: 250,
              fontSize: 25,
              isReverse: true,
            ),
          ),
        ],
      ),
    );
  }
}


              