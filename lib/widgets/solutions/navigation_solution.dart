import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/widgets/examples/hera_self_contained_example.dart';

class NavigationSolution extends StatefulWidget {
  const NavigationSolution({
    Key key,
  }) : super(key: key);

  @override
  _NavigationSolutionState createState() => _NavigationSolutionState();
}

class _NavigationSolutionState extends State<NavigationSolution> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Navigation Solution'),
        ),
        body: Column(
          children: <Widget>[
            /// MaterialPageRoute
            RaisedButton(
              onPressed: () {
        // ignore: strict_raw_type
        Navigator.of(context).push<void>(
        MaterialPageRoute(
          builder: (context) => const TheHeraExampleAppStartsHere(),
        ),
      );
    },
              padding: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Ink(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.orange,
                      Colors.yellow,
                      Colors.lightBlueAccent,
                    ],
                    stops: [.1, .3, .7],
                  ),
                ),
                child: const Center(
                  child:  Text('Material\nPage\nRoute',
                  style: TextStyle(

                  ),),
                ),
              ),
            ),

            /// Named Route
            RaisedButton(
              padding: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed:() => Navigator.of(context).pushNamed(
                '/routes_two',
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.orange,
                      Colors.yellow,
                      Colors.lightBlueAccent,
                    ],
                    stops: [.1, .3, .7],
                  ),
                ),
              ),
            ),

            /// Pop
            RaisedButton(
              padding: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed:  () {
                Navigator.of(context).pop();
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.orange,
                      Colors.yellow,
                      Colors.lightBlueAccent,
                    ],
                    stops: [.1, .3, .7],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
