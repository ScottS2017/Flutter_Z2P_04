import 'package:flutter/material.dart';

class AnimatedIconAndForwardReverseExamples extends StatefulWidget {
  @override
  _AnimatedIconAndForwardReverseExamplesState createState() => _AnimatedIconAndForwardReverseExamplesState();
}

class _AnimatedIconAndForwardReverseExamplesState extends State<AnimatedIconAndForwardReverseExamples>
    with SingleTickerProviderStateMixin {

  /// Create your animation controller... make it private if you can
  AnimationController _animationController;

  /// With Stateful Widgets, always initialize your variables in initState
  @override
  void initState() {

    /// Don't forget to call the State's initState function first
    /// You don't always *have to* make it first but if you put it first
    /// then its dispose() will be the last one called. This could be important
    /// if something else here is dependent on something in the superclass and then
    /// that dependency is disposed of while it's still needed.
    super.initState();


    _animationController = AnimationController(

      /// You can set the duration in days, hours, minutes, seconds,
      /// milliseconds or even microseconds.
      duration: const Duration(seconds: 2),

      /// Always set vsync to this. It means to lock the framerate of the
      /// animation to the framerate of the device. It makes no sense
      /// to have a framerate for your app that is faster than the framerate
      /// actually being displayed on the screen
      vsync: this,
    )

    /// We need to monitor the status of the animation so we know whether to
    /// go forward or backward each time the animation is triggered.
    ///
    /// There are four statuses.
    ///  1) "dismissed" means the animation is at the beginning and not running.
    ///  2) "forward" means  the animation is running from the beginning, moving towards the end
    ///  3) "completed" means the animation is at the end and not running
    ///  4) "reverse" means  the animation is running from the end, moving towards the beginning
    ///
    /// When the reverse animation is completed, the status returns to "dismissed"
      ..addListener(
        () {
          this.setState(() {});
        },
      )
      ..addStatusListener((state) => print('$state'));
  }

  void _startAnimation() {
    /// If the animation is sitting at the end ("completed"), run backward
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else  if  (_animationController.status == AnimationStatus.dismissed) {
      /// If the animation is sitting at the beginning ("dismissed"), run forward
      _animationController.forward();
    }
    /// Otherwise, we're in the middle of another animation, so do nothing.
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FractionallySizedBox(
          heightFactor: 0.2,
          widthFactor: 0.2,
          alignment: const Alignment(0.0, 0.0),
          child: GestureDetector(
            onTap: _startAnimation,

            /// The AnimatedIcon already includes both the beginning and end icons,
            /// as well as all of the information about the visual animation in between.
            /// The current controller value will determine what part of the animation
            /// (or which icon) is shown during the current frame.
            child: AnimatedIcon(
              icon: AnimatedIcons.add_event,
              progress: _animationController,
              semanticLabel: 'Add Event',
              size: 80.0,
            ),
          ),
        ),
      ],
    );
  }
}
