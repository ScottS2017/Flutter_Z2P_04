import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/an_icon_fwd_and_rev.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/animated_container_example.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/animated_size_opacity.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/animated_switcher_example.dart';
import 'package:o4_navigation_and_animation/animation_examples/intrinsic_animations/intrinsic_animations_welcome.dart';


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
    const IntrinsicAnimationsWelcome(),
    const AnimatedIconAndForwardReverseExamples(),
    const AnimatedSizeExample(),
    const AnimatedSwitcherExample(),
    const AnimatedContainerExample(),

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
