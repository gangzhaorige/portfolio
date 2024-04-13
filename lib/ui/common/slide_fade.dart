import 'package:flutter/material.dart';

class MySlideTransition extends StatefulWidget {
  const MySlideTransition({
    super.key, 
    required this.child,
    required this.offset,
    required this.duration,
  });

  final Widget child;
  final Offset offset;
  final Duration duration;

  @override
  State<MySlideTransition> createState() => _MySlideTransition();
}

class _MySlideTransition extends State<MySlideTransition> with TickerProviderStateMixin{

  late final AnimationController _textAnimationController;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _textAnimationController.forward();
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.offset,
        end: Offset.zero,
      ).animate(_textAnimationController),
      child: FadeTransition(
        opacity: _textAnimationController,
        child: widget.child,
      ),
    );
  }
}

class MySlideTransitionUpdate extends StatefulWidget {
  const MySlideTransitionUpdate({
    super.key, 
    required this.child,
    required this.offset,
    required this.duration,
  });

  final Widget child;
  final Offset offset;
  final Duration duration;

  @override
  State<MySlideTransitionUpdate> createState() => _MySlideTransitionUpdate();
}

class _MySlideTransitionUpdate extends State<MySlideTransitionUpdate> with TickerProviderStateMixin{

  late final AnimationController _textAnimationController;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _textAnimationController.forward();
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MySlideTransitionUpdate oldWidget) {
    super.didUpdateWidget(oldWidget);
    _textAnimationController.reset();
    _textAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.offset,
        end: Offset.zero,
      ).animate(_textAnimationController),
      child: FadeTransition(
        opacity: _textAnimationController,
        child: widget.child,
      ),
    );
  }
}