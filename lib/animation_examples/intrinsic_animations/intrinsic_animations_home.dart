import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/basic_tween_with_status_lisener.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/examples_of_curves.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/staggered_animations.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/an_icon_fwd_and_rev.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/animated_container_example.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/animated_size_opacity.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/animated_switcher_example.dart';

class IntrinsicAnimationsHome extends StatefulWidget {
  const IntrinsicAnimationsHome({Key key})
      : super(
          key: key,
        );

  @override
  _IntrinsicAnimationsHomeState createState() => _IntrinsicAnimationsHomeState();
}

class _IntrinsicAnimationsHomeState extends State<IntrinsicAnimationsHome> {
  List<Widget> pages = [
    AnimatedContainerExample(),
    AnimatedIconAndForwardReverseExamples(),
    AnimatedSizeExample(),
    AnimatedSwitcherExample(),
    BasicTweenWithStatusListener(),
    ExamplesOfCurves(),
    StaggerDemo(),
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
          )),
    );
  }
}
