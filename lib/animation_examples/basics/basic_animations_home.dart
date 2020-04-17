import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/basic_animations_welcome.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/basic_tween.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/basic_tween_with_status_lisener.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/examples_of_curves.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/physics.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/staggered_animations.dart';

class BasicAnimationsHome extends StatefulWidget {
  const BasicAnimationsHome({Key key})
      : super(
          key: key,
        );

  @override
  _BasicAnimationsHomeState createState() => _BasicAnimationsHomeState();
}

class _BasicAnimationsHomeState extends State<BasicAnimationsHome> {
  List<Widget> pages = [
    const BasicAnimationsWelcome(),
    const BasicTween(),
    const BasicTweenWithStatusListener(),
    const ExamplesOfCurves(),
    const PhysicsAnimation(),
    // const SimultaneousAnimations(),
    const StaggerDemo(),
  ];

  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: pages,
    );
  }
}
