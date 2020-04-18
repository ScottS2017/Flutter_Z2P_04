import 'package:flutter/material.dart';

class PhysicsAnimation extends StatefulWidget {
  const PhysicsAnimation({
    Key key,
  }) : super(key: key);

  @override
  PhysicsAnimationState createState() {
    return PhysicsAnimationState();
  }
}

class PhysicsAnimationState extends State<PhysicsAnimation> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  OurCustomClassThatReplacesTicker _instanceOfOurCustomTickerReplacement;

  @override
  void initState() {
    /// Remember to always make the super first in Widget's initState().
    /// Any class with a SuperClass will depend on things in the
    /// super, so we need to create those first.
    ///
    /// Even more importantly, this also determines the order in which
    /// things are destroyed. If the super is disposed of before
    /// other things, it may "cut the legs out from under them"
    /// even if they haven't yet had a chance to close themselves
    /// properly.
    super.initState();

    /// We declared the instance above but here we run the constructor to
    /// initialize it.
    _instanceOfOurCustomTickerReplacement = OurCustomClassThatReplacesTicker();


    _animationController = AnimationController.unbounded(vsync: this);

    /// To make a physics animation we want to replace the standard
    /// ticker with something else we can control. This is why we
    /// tell our controller to "animateWith" our custom ticker replacement.
    _animationController.animateWith(_instanceOfOurCustomTickerReplacement);
  }

  @override
  void dispose() {
    /// Always clean up after your animations... and dispose of
    /// the animation's super last.
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Physics Animation'),
        ),
        body: Center(
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) {

                /// Transform.scale will scale whatever you put in it.
                /// By linking the value to our controller, we can manipulate
                /// the size of the Flutter Logo with our controller function.
                return Transform.scale(
                  scale: _animationController.value,
                  child: child,
                );
              },
              child: const FlutterLogo(
                size: 400.0,
              ),
          ),
        ),
      ),
    );
  }
}

class OurCustomClassThatReplacesTicker extends Simulation {

  /// It's important to remember that not all devices are going to
  /// be running at the same, or even close to the same, frame rates.
  /// If you lock you animation to the frame rate then you risk your
  /// animation playing faster on newer hardware, and slower on
  /// older things or if there are a lot of things happening at once.
  ///
  /// To get around this, lock your animation to the time. Now,
  /// no matter how fast or slow your user's frame rate is, the
  /// animation will always play at the same speed, for everyone.
  @override
  double x(double time) {
    if ((time % 2.0) > 1.0) {
      return 1.0 - (time % 1.0);
    } else {
      return time % 1.0;
    }
  }

  @override
  double dx(double time) => 1.0;

  /// If you want to stop the animation instantly at any point, even in the
  /// middle, just have your function set isDone to true when it reaches
  /// the point you want to stop at. Here we want this animation to go
  /// on forever, so we lock it to false.
  ///
  /// Set it to true and hot reload to see the animation
  /// freeze. (You need to hot restart to get it going again).
  @override
  bool isDone(double time) => false;
}
