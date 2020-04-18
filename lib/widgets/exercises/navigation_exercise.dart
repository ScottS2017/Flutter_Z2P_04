import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/pages/home_teal.dart';

class NavigationExercise extends StatefulWidget {
  const NavigationExercise({
    Key key,
  }) : super(key: key);

  @override
  _NavigationExerciseState createState() => _NavigationExerciseState();
}

class _NavigationExerciseState extends State<NavigationExercise> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Navigation Exercise'),
        ),

        // By now you shouldn't need much handholding at all. So...
        // The client wants 3 raised buttons, 150 high each, evenly spaced
        // vertically on the page. The first one needs to use a Material
        // Page Route to navigate to the teal routes examples page. The
        // second one needs to use a named route to navigate to the
        // orange routes example page. The third needs to cause the
        // route stack to pop back to whatever the previous route was.
        //
        // Also, they want you to use gradients to make the first one
        // look like a shining sun in the sky, the second to look like the
        // Italian flag and the third needs to use a gradient and offsets
        // to look like the flag of the Czech Republic.
        //
        // Last, they need to have the words "Material Page Route",
        // "Named Route" and "Pop" on the respective buttons, in big,
        // white letters with a drop shadow to provide contrast.
        //
        // Oh, and this client is notorious for not paying until it's exactly
        //what they want. If you use anything other than gradients to do
        // this, you don't get paid.

        body: const Placeholder(
          fallbackHeight: double.infinity,
          color: Colors.teal,
        ),
      ),
    );
  }
}
