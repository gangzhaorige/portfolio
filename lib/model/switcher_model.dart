import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/common/ui_helpers.dart';

class SwitchNavigation extends ChangeNotifier {
  int _index = 0;
  final int _maxSize = 4;

  int getIndex() {
    return _index;
  }

  int getSize() {
    return _maxSize;
  }

  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }
}

class IconText {
  final String name;
  final String path;

  IconText(this.name, this.path);
}

class SkillExample extends StatelessWidget {
  const SkillExample({
    super.key,
    required this.text,
    required this.data,
  });

  final String text;
  final List<IconText> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
        verticalSpaceLarge,
        Wrap(
          spacing: 40,
          runSpacing: 40,
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < data.length; i++) ...[
              Column(
                children: [
                  Text(
                    data[i].name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  verticalSpaceMedium,
                  SvgPicture.asset(
                    data[i].path,
                    height: 60.0,
                    width: 60.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                ],
              ),
            ]
          ],
        ),
      ],
    );
  }
}
