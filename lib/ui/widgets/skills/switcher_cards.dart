import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:math' as math;
import '../../../model/switcher_model.dart';

class SwitcherCards extends StatelessWidget {
  const SwitcherCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 500,
      child: Consumer<SwitchNavigation>(
      builder: (context, model, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            for(int i = 1; i < model.getSize(); i++) ...[
              Transform.translate(
                offset: Offset(i == 3 ? 90 : i == 2 ? 0 : -90, i == 2 ? 0 : 20),
                child: Transform.rotate(
                  angle: i == 3 ? math.pi / 8 : i == 2 ? 0 / 8 : -math.pi / 8,
                  child: MouseRegion(
                    child: InkWell(
                      onTap: () {
                        model.changeIndex(i);
                      },
                      child: AnimatedContainer(
                        height: getValueForScreenType<double>(
                          context: context,
                          mobile: 200,
                          tablet: 250,
                          desktop: 300
                        ),
                        width: getValueForScreenType<double>(
                          context: context,
                          mobile: 130,
                          tablet: 162.5,
                          desktop: 195,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: model.getIndex() == i ? Colors.white : Colors.white.withOpacity(0.9),
                          border: Border.all(
                            width: 1.0,
                            color: model.getIndex() == i ? const Color.fromARGB(255, 0, 38, 255) : Colors.white
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        duration: const Duration(milliseconds: 250),
                        child: FaIcon(
                          i == 1 ? FontAwesomeIcons.computer : i == 2 ? FontAwesomeIcons.server : FontAwesomeIcons.toolbox,
                          size: getValueForScreenType<double>(
                            context: context,
                            mobile: 50,
                            tablet: 50,
                            desktop: 60,
                          ),
                          color: Colors.blue,
                        )
                      ),
                    ),
                    onEnter: (event) {
                      model.changeIndex(i);
                    },
                    onExit: (event) {
                      model.changeIndex(0);
                    },
                  ),
                ),
              ),
            ]
          ],
        );
      },
      ),
    );
  }
}