import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/animation_examples/basics/basic_animations_home.dart';
import 'package:o4_navigation_and_animation/widgets/examples/navigation_and_routes_example.dart';

class HomeTeal extends StatefulWidget {
  const HomeTeal({Key key}) : super(key: key);

  @override
  _HomeTealState createState() => _HomeTealState();
}

class _HomeTealState extends State<HomeTeal> {
  /// Create a page controller and set the first page to whatever is in the
  /// [0] element of the list of children
  PageController controller = PageController(
    initialPage: 0,
  );

  List<Widget> pages = [
    /// As the PageView is scrolled right or left, the page content shown
    /// is determined by this list. Each page number, from 0 to whatever,
    /// has a corresponding element in this List (think of it as an array element)

    const NavigationAndRoutes(),
    const BasicAnimationsHome(),
  ];

  /// This is where the UI is laid out. It's the "Blueprint", if you will.
  /// This just creates a Scaffold with an AppBar and the rest of the
  /// screen area is used for content. The content is determined
  /// by which element has been chosen in the "pages" list
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: pages,
    );
  }
}

