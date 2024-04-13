import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/common/app_colors.dart';
import 'package:my_portfolio/common/nav.dart';
import 'package:my_portfolio/common/ui_helpers.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../common/projects/project.dart';
import '../locator.dart';
import '../services/url_launcher_services.dart';

class Footer extends StatelessWidget {
  const Footer(this.animateToIndex, {super.key});

  final Future<void> Function(int index, {
    required Duration duration,
    required Curve curve,
    double offset,
    bool offsetBasedOnBottom,
  }) animateToIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getValueForScreenType(
        context: context,
        mobile: 160,
        desktop: 235,
      ),
      color: kcPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => animateToIndex(
              0,
              curve: Curves.linear,
              duration: const Duration(
                milliseconds: 500
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.chevronUp,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i < icons.length; i++) ...[
                GestureDetector(
                  child: FaIcon(
                    icons[i].icon,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 30,
                      desktop: 40
                    ),
                    color: Colors.white,
                  ),
                  onTap: () async => locator<UrlLauncherService>().launchInBrowser(
                    Link(host: icons[i].host, path: icons[i].path),
                  ),
                ),
                if(i != icons.length - 1) ...[
                  SizedBox(width: getValueForScreenType(
                    context: context,
                      desktop: 40,
                      mobile: 30,
                    ),
                  ),
                ],
              ],
            ],
          ),
          ScreenTypeLayout.builder(
            mobile: (p0) {
              return const Column(
                children: [
                  Text(
                    'Email: ganzorig.li@yahoo.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Phone: (+1) 6504362846',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
            desktop:(p0) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email: ganzorig.li@yahoo.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  horizontalSpaceMedium,
                  Text(
                    'Phone: (+1) 6504362846',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}