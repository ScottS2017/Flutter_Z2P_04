import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StaggerDemo extends StatefulWidget {
  const StaggerDemo({
    Key key,
  }) : super(key: key);

  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin {
  AnimationController _controller;
  bool directionIsForward = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 4000), vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _playAnimation(bool forward) async {
    try {
      if (forward) {
        await _controller.forward().orCancel;
      } else if (!forward) {
        await _controller.reverse().orCancel;
      }
    } on TickerCanceled {
      // The animation got canceled, it might have been disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 1.0 timeDilation is normal animation speed
    timeDilation = 1.0;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation(directionIsForward);
        directionIsForward = !directionIsForward;
      },
      child: Center(
        child: StaggeredAnimation(controller: _controller.view),
      ),
    );
  }
}

class StaggeredAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> movement;
  final Animation<BorderRadius> radius;
  final Animation<Color> color;
  final Animation<double> rotate;

  /// This is the juicy stuff!
  /// Each of these sections is a separate animation
  StaggeredAnimation({Key key, this.controller})

      /// The property we're animating is opacity
      : opacity = Tween<double>(
          /// Begin animating this at 0.0% alpha and end at 100% alpha
          begin: 0.0,
          end: 1.0,
        ).animate(
          /// We're going to use a curve
          CurvedAnimation(
            /// Set our controller as the parent
            parent: controller,
            curve: const Interval(
              /// Our interval tells Flutter when in the total duration of the
              /// overall animation you want to start and end this section
              /// (opacity) at.
              ///
              /// The below code will cause the opacity to start animating immediately
              /// (at 0 AKA 0.0%) and it will complete its transition when the overall animation
              /// is at 20% (0.2) of completion
              0.0,
              0.2,

              /// This is the curve to use
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        rotate = Tween<double>(
          begin: 0.0,
          end: 3.141 * 4,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.1,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        movement = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 10.0, left: 0.0),
          end: const EdgeInsets.only(bottom: 100.0, left: 75.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.4,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 50.0,
          end: 300.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        height = Tween<double>(
          begin: 50.0,
          end: 300.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        radius = BorderRadiusTween(
          begin: BorderRadius.circular(0.0),
          end: BorderRadius.circular(150.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.5,
              0.75,
              curve: Curves.ease,
            ),
          ),
        ),
        color = ColorTween(
          begin: Colors.red[200],
          end: Colors.deepPurple[900],
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.75,
              curve: Curves.linear,
            ),
          ),
        ),
        super(key: key);

  /// This function is called each time the controller "ticks" a new frame.
  /// When it runs, the controller's new value will be used to calculate the
  /// new animation values for the next frame
  Widget _buildAnimation(BuildContext context, Widget child) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Staggered Animations'),
        ),

        body: Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.lightBlue[200],
              width: 3.0,
            ),
            borderRadius: radius.value,
          ),
          child: const FlutterLogo(
            size: 200.0,
          ),
        ),
      ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
