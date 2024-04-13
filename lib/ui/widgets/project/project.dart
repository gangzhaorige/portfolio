import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../common/app_colors.dart';
import '../../../common/projects/project.dart';
import '../../../common/ui_helpers.dart';
import '../../../locator.dart';
import '../../../services/url_launcher_services.dart';
import '../skills/home_skills.dart';

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    super.key,
    required this.project
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    Widget box = SizedBox(
      height: getValueForScreenType(
        context: context,
        mobile: 10,
        desktop: 20,
      ),
    );
    String contributorsStr = '';
    List<String> contributors = project.getContributors();
    for(int i = 0; i < contributors.length; i++) {
      contributorsStr += contributors[i];
      if(i != contributors.length - 1) {
        contributorsStr += ',';
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.getProjectName(),
          style: TextStyle(
            color: kcPrimaryColorDark,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 18,
              desktop: 25,
            ),
            fontWeight: FontWeight.bold
          ),
        ),
        box,
        Tags(
          tags: project.getSkills(),
        ),
        box,
        Text(
          project.getProjectType() == ProjectType.solo ? 'Solo Project' : 'Group Project',
          style: TextStyle(
            color: kcPrimaryColorDark,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 18,
              desktop: 20,
            ),
            fontWeight: FontWeight.bold
          ),
        ),
        box,
        Text(
          'Contributors: $contributorsStr',
          style: TextStyle(
            color: kcPrimaryColorDark,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 18,
              desktop: 20,
            ),
            fontWeight: FontWeight.bold
          ),
        ),
        box,
        Text(
          project.getProjectDescription(),
          style: TextStyle(
            color: kcPrimaryColorDark,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 16,
              desktop: 18,
            ),
          ),
        ),
        box,
        IntrinsicWidth(
          child: Row(
            children: [
              if(project.getLiveUrl().host != '') ...[
                MyButton(
                  text: 'See Live',
                  onPressed: ()=> {
                    locator<UrlLauncherService>().launchInBrowser(project.getLiveUrl()),
                  },
                  fontSize: 15,
                ),
              ],
              
              MyButton(
                text: 'Source Code',
                onPressed: ()=> {
                  locator<UrlLauncherService>().launchInBrowser(project.getGithubLink()),
                },
                fontSize: 15,
              )
              
            ],
          ),
        )
        
      ],
    );
  }
}

class Tags extends StatelessWidget {
  const Tags({
    super.key, 
    required this.tags,
  });
  
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      children: [
        for(String tag in tags)... [
          Tag(tagName: tag),
        ]
      ],
    );
  }
}
class Tag extends StatelessWidget {
  const Tag({
    super.key,
    required this.tagName,
  });

  final String tagName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: kDefaultIconDarkColor,
        ),
        color: Colors.grey,
      ),
      child: Text(
        tagName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProjectImage extends StatefulWidget {
  const ProjectImage({
    super.key,
    this.path = ''
  });

  final String? path;

  @override
  State<ProjectImage> createState() => _ProjectImageState();
}

class _ProjectImageState extends State<ProjectImage> {

  late AssetImage assetImage;

  @override
  void initState() {
    super.initState();
    assetImage = AssetImage(widget.path == null ? '' : widget.path!);
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
    if(widget.path != null) {
      return Image(image: assetImage);
    }
    return const Text(
      'Coming Soon',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 160,
        color: Colors.blue
      ),
    );
  }
}

class ProjectView extends StatelessWidget {
  const ProjectView({
    super.key,
    required this.projectInfo,
  });

  final Project projectInfo;
  
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop:(p0) {
        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: ProjectDescription(
                  project: projectInfo,
                ),
              ),
              horizontalSpaceLarge,
              Expanded(
                flex: 8,
                child: ProjectImage(path: projectInfo.imgPath()),
              ),
            ],
          ),
        );
      }, 
      tablet: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectDescription(
            project: projectInfo
          ),
          verticalSpaceMedium,
          ProjectImage(path: projectInfo.imgPath()),
        ],
      ),
      mobile: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectDescription(
            project: projectInfo,
          ),
          verticalSpaceMedium,
          ProjectImage(path: projectInfo.imgPath()
          ),
        ],
      ),
    );
  }
}