import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/widgets/examples/gesture_detector_example.dart';
import 'package:o4_navigation_and_animation/widgets/examples/hera_self_contained_example.dart';
import 'package:o4_navigation_and_animation/widgets/examples/provider_example.dart';
import 'package:o4_navigation_and_animation/widgets/examples/regular_button_examples.dart';
import 'package:o4_navigation_and_animation/widgets/exercises/buttons_exercises.dart';
import 'package:o4_navigation_and_animation/widgets/exercises/provider_exercise.dart';
import 'package:o4_navigation_and_animation/widgets/solutions/buttons_solution.dart';
import 'package:o4_navigation_and_animation/widgets/solutions/provider_solution.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Create a page controller and set the first page to whatever is in the
  /// [0] element of the list of children
  PageController controller = PageController(
    initialPage: 0,
  );

  List<Widget> pages = [
    /// As the PageView is scrolled right or left, the page content shown
    /// is determined by this list. Each page number, from 0 to whatever,
    /// has a corresponding element in this List (think of it as an array element)

    const RegularButtonExamples(),
    const ButtonsExercises(),
    const ButtonsSolution(),
    const GestureDetectorExample(),
    const ProviderAppExample(),
    const ProviderExercise(),
    const ProviderAppSolution(),
    const TheHeraExampleAppStartsHere(),

  ];

  /// This is where the UI is laid out. It's the "Blueprint", if you will.
  /// This just creates a Scaffold with an AppBar and the rest of the
  /// screen area is used for content. The content is determined
  /// by which element has been chosen in the "pages" list
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: pages,
    );
  }
}

