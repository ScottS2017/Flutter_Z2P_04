import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ExamplesOfCurves extends StatefulWidget {
  const ExamplesOfCurves({
    Key key,
  }) : super(key: key);

  @override
  ExamplesOfCurvesState createState() => ExamplesOfCurvesState();
}

// Take a look at TickerProviderStateMixin as opposed to SingleTickerProviderStateMixin
class ExamplesOfCurvesState extends State<ExamplesOfCurves> with TickerProviderStateMixin {
  //
  AnimationController _controller;
  int _currentCurve = 0;
  Curve _useThisCurve = Curves.ease;
  String _curveType = 'Ease';

  @override
  void initState() {
    super.initState();

    // Duration is the total duration of all transitions, expressed in time.
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),

      // Vsync is a must, it ensures that each frame that is processed corresponds to a frame that is actually rendered on the screen.
      vsync: this,
    );
  }

  /// Take a bag and always clean up after your dog.
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _startAnimation() async {
    try {
      selectCurve();
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('Animation Canceled');
    }
  }

  final List<String> _curveTitles = [
    'Ease',
    'BounceInOut',
    'ElasticInOut',
    'FastOutSlowIn',
    'Decelerate',
  ];

  final List<Curve> _curves = [
    Curves.ease,
    Curves.bounceInOut,
    Curves.elasticInOut,
    Curves.fastOutSlowIn,
    Curves.decelerate,
  ];

  void selectCurve() {
    setState(() {
      _useThisCurve = _curves[_currentCurve % 5];
      _curveType = _curveTitles[_currentCurve % 5];
      _currentCurve++;
    });
  }

  @override
  Widget build(BuildContext context) {
    ///*************************************************************************
    /// timeDilation slows down animations by this factor to help in development.
    timeDilation = 1.0;

    ///*************************************************************************

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Examples of Curves'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                _curveType,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _startAnimation();
                },
                child: Container(
                  width: 350.0,
                  height: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.blueGrey.withOpacity(0.8),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      AnimatedBox(
                        currentCurve: _useThisCurve,
                        controller: _controller,
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            child: const Text(
                              'Start (Dismissed)',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: const Text(
                              'Completed (End)',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 65,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBox extends StatelessWidget {
  final Animation<double> controller;
  final Animation<Alignment> movement;
  final Curve currentCurve;
  static const double movementStart = 0.1;
  static const double movementEnd = 0.9;

  AnimatedBox({Key key, this.controller, this.currentCurve})
      : movement = AlignmentTween(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              movementStart,
              movementEnd,
              curve: currentCurve,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Align(
              alignment: movement.value,
              child: const FlutterLogo(
                size: 100.0,
              ),
            );
          },
        );
      },
    );
  }
}
