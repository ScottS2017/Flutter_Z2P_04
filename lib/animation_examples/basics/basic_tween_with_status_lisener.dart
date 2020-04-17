import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BasicTweenWithStatusListener extends StatefulWidget {

  const BasicTweenWithStatusListener({
    Key key,
  }) : super(key: key);


  @override
  _BasicTweenWithStatusListenerState createState() => _BasicTweenWithStatusListenerState();
}

class _BasicTweenWithStatusListenerState extends State<BasicTweenWithStatusListener>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 400.0).animate(controller)

      /// It’s often helpful to know when an animation changes state,
      /// such as finishing, moving forward, or reversing. You can get
      /// notifications for this with addStatusListener(). These are the
      /// different status you will see:
      ///
      /// Start = "dismissed"
      /// "forward"
      /// end = "completed"
      /// "reverse"
      /// Once we arrive at the beginning again, the status goes
      /// back to dismissed
      ///
      /// The following code listens for a state change and prints an update.

      ..addStatusListener((state) => print("$state"))

      /// And this uses the StatusListener to trigger the animation forward or in reversed.
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  /// This is the easy part... using the animation value for both height
  /// and width makes the Container square and the Flutter logo will
  /// be resized to fit each frame the Container is rendered.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
