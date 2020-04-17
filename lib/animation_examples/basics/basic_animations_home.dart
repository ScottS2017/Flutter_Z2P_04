import 'package:flutter/material.dart';
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

  String titleString = 'Basic Animations';

  void setTitle(int page) {
    if (page == 0) {
      setState(() {
        titleString = 'Basic Animations';
      });
    } else if (page == 1) {
      setState(() {
        titleString = 'AnimatedContainer';
      });
    } else if (page == 2) {
      setState(() {
        titleString = 'AnimatedIcon';
      });
    } else if (page == 3) {
      setState(() {
        titleString = 'AnimatedSize';
      });
    } else if (page == 4) {
      setState(() {
        titleString = 'AnimatedSwitcher';
      });
    } else if (page == 5) {
      setState(() {
        titleString = 'Status Listener';
      });
    } else if (page == 6) {
      setState(() {
        titleString = 'Curve Examples';
      });
    } else if (page == 7) {
      setState(() {
        titleString = 'Staggered Animations';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(titleString),
        ),
        body: PageView(
          onPageChanged: setTitle,
          children: pages,
        ),
      ),
    );
  }
}
