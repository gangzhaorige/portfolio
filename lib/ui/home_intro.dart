import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/ui/widgets/skills/navigation.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../common/app_colors.dart';
import '../common/ui_helpers.dart';

class IntroView extends StatefulWidget {
  const IntroView(this.animateToIndex,{super.key});

  final Future<void> Function(int index, {
    required Duration duration,
    required Curve curve,
    double offset,
    bool offsetBasedOnBottom,
  }) animateToIndex;

  @override
  State<IntroView> createState() => _IntroState();
}

class _IntroState extends State<IntroView> with TickerProviderStateMixin {

  late final AnimationController _textAnimationController;
  late final AnimationController _navigationAnimationController;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _navigationAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _textAnimationController.forward();
    Future<dynamic>.delayed(const Duration(milliseconds: 300)).then((value) => {
      _navigationAnimationController.forward()  
    });
    
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _navigationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          width: 900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: getValueForScreenType(
              context: context,
              mobile: CrossAxisAlignment.center,
              tablet: CrossAxisAlignment.center,
              desktop: CrossAxisAlignment.start
            ),
            children: [
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.1,0),
                  end: Offset.zero,
                ).animate(_textAnimationController),
                child: FadeTransition(
                  opacity: _textAnimationController,
                  child: RichText(
                    textAlign: getValueForScreenType(
                      context: context,
                      mobile: TextAlign.center,
                      tablet: TextAlign.center,
                      desktop: TextAlign.start,
                    ),
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: getValueForScreenType(
                          context: context,
                          mobile: 35,
                          tablet: 40,
                          desktop: 45,
                        ),
                        fontWeight: FontWeight.w900,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: "Hi, I'm ",
                          style: TextStyle(
                            color: kcPrimaryColorDark,
                          ),
                        ),
                        TextSpan(
                          text: "Ganzorig Li.\n",
                          style: TextStyle(
                            color: kcPrimaryColor,
                          )
                        ),
                        TextSpan(
                          text: "I am a Full-Stack Engineer.\n",
                          style: TextStyle(
                            color: kcPrimaryColorDark,
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.1,0),
                  end: Offset.zero,
                ).animate(_navigationAnimationController),
                child: FadeTransition(
                  opacity: _navigationAnimationController,
                  child: Navigation(animateToIndex: widget.animateToIndex),
                ),
              ),
              verticalSpaceMassive,
            ],
          ),
        ),
      ),
    );
  }
}