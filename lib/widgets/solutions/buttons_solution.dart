import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_textstyles.dart';

class ButtonsSolution extends StatefulWidget {
  const ButtonsSolution({
    Key key,
  }) : super(key: key);

  @override
  _ButtonsSolutionState createState() => _ButtonsSolutionState();
}

class _ButtonsSolutionState extends State<ButtonsSolution> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Butons Solution'),
          ),
          body: Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),

                  ///  Flat Buttons
                  ///
                  /// 1-1
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            onPressed: () => print('Row 1, Slot 1'),
                            color: Colors.blue,
                            clipBehavior: Clip.antiAlias,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const SizedBox(
                              height: double.infinity,
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 160,
                                  color: Colors.white,
                                  shadows: [
                                    BoxShadow(
                                      offset: Offset(3, 3),
                                      color: Colors.black54,
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// 1-2
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              width: 50,
                              child: FlatButton(
                                onPressed: () => print('Row 1, Slot 2'),
                                clipBehavior: Clip.antiAlias,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.red,
                                        Colors.amber,
                                        Colors.green,
                                      ],
                                      stops: [.1, .3, .7],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// 1-3
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () => print('Row 1, Slot 3'),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  ///  Raised Buttons
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        /// 2-1
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: RaisedButton(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () => print('Row 2, Slot 1'),
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
                          ),
                        ),

                        /// 2-1
                        Expanded(
                          child: Center(
                            child: Container(
                              width: 50,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: RaisedButton(
                                onPressed: () => print('Row 2, Slot 2'),
                                color: Colors.blue,
                                clipBehavior: Clip.antiAlias,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 64,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                          offset: Offset(2, 2),
                                          color: Colors.black54,
                                          blurRadius: 3,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// 2-3
                        Expanded(
                          child: FlatButton(
                            onPressed: () => print('Row 1, Slot 2'),
                            clipBehavior: Clip.antiAlias,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.amber,
                                    Colors.red,
                                  ],
                                  stops: [.3, .7, .9],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///  Icon Buttons

                  ///3-1
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.pink, width: 5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () => print('Row 3, Slot 1'),
                                icon: Icon(
                                  Icons.add_comment,
                                ),
                                iconSize: 50,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),

                        /// 3-2
                        IconButton(
                          onPressed: () => print('Row 3, Slot 2'),
                          icon: Icon(
                            Icons.home,
                          ),
                          iconSize: 100,
                          color: Colors.blueGrey,
                        ),

                        /// 3-3
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                const Spacer(),
                                const Text('This uses a\nRotatedBox'),
                                const SizedBox(height: 4),
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    border: Border.all(color: Colors.blue, width: 5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: IconButton(
                                    onPressed: () => print('Row 3, Slot 3'),
                                    icon: RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        Icons.airplanemode_active,
                                      ),
                                    ),
                                    iconSize: 100,
                                    color: Colors.blue,
                                  ),
                                ),
                                const Spacer(),
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
