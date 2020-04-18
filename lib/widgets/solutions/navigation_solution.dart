import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/pages/home_teal.dart';

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

        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 88,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              /// MaterialPageRoute
              RaisedButton(
                onPressed: () {
                  // ignore: strict_raw_type
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => const HomeTeal(),
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
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.orange,
                        Colors.yellow,
                        Colors.lightBlueAccent,
                      ],
                      stops: [.1, .5, .9],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Material\nPage\nRoute',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        shadows: [
                          BoxShadow(
                            offset: Offset(2,2)
                            , color: Colors.black87,
                            spreadRadius: 6,
                          )
                        ]
                      ),
                    ),
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
                onPressed: () => Navigator.of(context).pushNamed(
                  '/routes_two',
                ),
                child: Ink(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.green,
                        Colors.white,
                        Colors.white,
                        Colors.red,
                      ],
                      stops: [.33, .33, .66, .66 ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Named\nRoute',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        shadows: [
                          BoxShadow(
                            offset: Offset(2,2)
                            , color: Colors.black87,
                            spreadRadius: 6,
                          )
                        ]
                      ),
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Ink(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: SweepGradient(
                      center: const Alignment(-.10, 0),
                      colors: [
                        Colors.red,
                        Colors.blue,
                        Colors.blue,
                        Colors.white,
                      ],
                      stops: [.39, .39, .60, .60 ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Pop',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        shadows: [
                          BoxShadow(
                            offset: Offset(2,2)
                            , color: Colors.black87,
                            spreadRadius: 6,
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
