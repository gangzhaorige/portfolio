import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/services/url_launcher_services.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../common/app_colors.dart';
import '../common/nav.dart';
import '../common/projects/project.dart';
import '../locator.dart';

class NavObject {
  final IconData icon;
  final String host;
  final String path;

  const NavObject(this.icon, this.host, this.path);
}

class NavView extends StatelessWidget {
  const NavView({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType<double>(
          context: context,
          mobile: 35,
          desktop: 30,
        ),
        vertical: getValueForScreenType<double>(
          context: context,
          mobile: 35,
          desktop: 30,
        ),
      ),
      child: Row(
        mainAxisAlignment: getValueForScreenType<MainAxisAlignment>(
          context: context,
          mobile: MainAxisAlignment.spaceEvenly,
          desktop: MainAxisAlignment.end
        ),
        children: [
          for(int i = 0; i < icons.length; i++) ...[
            GestureDetector(
              child: FaIcon(
                icons[i].icon,
                size: 40,
                color: color,
              ),
              onTap: () async => locator<UrlLauncherService>().launchInBrowser(
                Link(host: icons[i].host, path: icons[i].path)),
            ),
            if(i != icons.length - 1) ...[
              SizedBox(width: getValueForScreenType(
                context: context,
                  desktop: 40,
                  mobile: 0,
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}