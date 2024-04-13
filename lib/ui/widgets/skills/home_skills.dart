import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../common/app_colors.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = kcPrimaryColor,
    this.width,
    required this.fontSize,
    this.isReverse,
  });

  final String text;
  final Function onPressed;
  final Color color;
  final double? width;
  final double fontSize;
  final bool? isReverse;
  
  @override
  State<MyButton> createState() => _SkillState();
}

class _SkillState extends State<MyButton> with SingleTickerProviderStateMixin {
  double? slideBegin;
  double? slideEnd;
  late AnimationController _controller;
  late Animation<double> slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    slideBegin = 0.0;
    slideEnd = 1.0;
    slideAnimation = Tween(
      begin: slideBegin,
      end: slideEnd
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic)
    );
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  onHover(bool enter) {
    enter ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var body = Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          width: widget.width != null ? getValueForScreenType(
            context: context,
            mobile: widget.width,
            desktop: widget.width! * 0.54
          ) : null,
          height: getValueForScreenType(
            context: context,
            mobile: 35,
            desktop: 45
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isReverse == null ? widget.color : widget.isReverse! ? Colors.white : widget.color,
              width: 1.5
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                mobile: widget.fontSize,
                desktop: widget.fontSize + 5,
              ),
              color: widget.isReverse == null ? widget.color : widget.isReverse! ? Colors.white : widget.color,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              width: widget.width != null ? getValueForScreenType(
                context: context,
                mobile: widget.width,
                desktop: widget.width! * 0.54
              ) : null,
              height: getValueForScreenType(
                context: context,
                mobile: 35,
                desktop: 45
              ),
              decoration: BoxDecoration(
                color: widget.isReverse == null ? widget.color : widget.isReverse! ? Colors.white : widget.color,
                border: Border.all(
                  color: widget.isReverse == null ? widget.color : widget.isReverse! ? Colors.white : widget.color,
                  width: 1.5,
                ),
              ),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: widget.fontSize,
                    desktop: widget.fontSize + 5,
                  ),
                  color: widget.isReverse == null ? Colors.white : widget.isReverse! ? widget.color :Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            builder: (context, child) {
              return ClipPath(
                clipper: RectClipper(slideAnimation.value, TransitionType.LEFT_TO_RIGHT),
                child: child,
              );
            },
          ),
        ),
      ],
    );
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: InkWell(
        onTap: () => widget.onPressed(),
        child: body,
      )
    );
  }
}

