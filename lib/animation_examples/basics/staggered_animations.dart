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
    /// 1.0 timeDilation is normal speed, but this can be set to
    /// something else to speed the animation up or slow it down
    timeDilation = 1.0;
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: StaggeredAnimation(controller: _controller.view),
          ),

          /// This Container is for the play button
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 100),
              color: Colors.white,
              child: RaisedButton(
                onPressed: () {
                  _playAnimation(directionIsForward);
                  directionIsForward = !directionIsForward;
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black38, width: 3),
                ),
                elevation: 4,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Play',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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

  /// Each of these sections is a separate animation
  /// We'll walk though the first one (opacity) but the points
  /// covered here apply to all the other parameters being
  /// animated, as well.
  StaggeredAnimation({Key key, this.controller})
      : opacity = Tween<double>(
          /// Begin animating this at 0.0% and end at 100%.
          /// Things that range from 0 to 1 are usually percentages
          /// but we can animate between two numbers, as well. The
          /// begin number will be considered 0% of the duration and
          /// the end number will be reached when the ticker
          /// reaches 100% of whatever duration you specify.
          begin: 0.0,
          end: 1.0,
        ).animate(
          /// We're going to use a curve
          CurvedAnimation(
            /// Set our controller as the parent of our curve. The curve
            /// knows where it starts and ends, but the curve tells it
            /// where to be in that range at any given time.
            parent: controller,
            curve: const Interval(
              /// Our interval tells Flutter when *in the total duration of the
              /// overall animation* you want to start and end this section.
              ///
              /// The below code will cause the opacity to start animating immediately
              /// at 0.0% and it will complete our opacity animation when the total
              /// duration reaches 20%.
              ///
              /// What happens with intervals is you can specify that one animation
              /// (opacity, size, location, color) is going to play during only *part*
              /// of the overall duration of the entire animation. That's what
              /// we're doing here, animating various properties at different
              /// parts of the overall duration, to create a sequence of
              /// animations.
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

  /// build() is called each time the controller "ticks" and the
  /// controller's value is updated. When build runs, the controller's
  /// updated value will be used to recalculate each parameter's
  /// new value for the frame being rendered.
  Widget _buildAnimation(BuildContext context, Widget child) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Staggered Animations'),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          color: Colors.white,
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
