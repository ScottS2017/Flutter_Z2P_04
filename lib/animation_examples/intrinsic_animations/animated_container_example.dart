import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_colors.dart';

/// This was only broken out into its own class to make it easier to understand
/// Normally, you would just have the AnimatedContainer placed in the UI, instead
/// of creating a custom Widget and calling it in like this.
///
/// This particular application of AnimatedContainer is much more
/// complicated than most uses in an app, because here we're going
/// over many of its capabilities for demonstration purposes. Normally,
/// you'd only use one or two of its capabilities

class TheContainerBeingAnimated extends StatelessWidget {
  /// Create a variable for each property being animated (here it's a lot)
  final double currentHeight;
  final double currentWidth;
  final double currentVerticalPadding;
  final double currentHorizontalPadding;
  final Color currentColor;
  final Color currentBorderColor;
  final double currentBorderWidth;
  final double currentBorderRadius;

  const TheContainerBeingAnimated({
    Key key,
    @required this.currentHeight,
    @required this.currentWidth,
    @required this.currentVerticalPadding,
    @required this.currentHorizontalPadding,
    @required this.currentColor,
    @required this.currentBorderColor,
    @required this.currentBorderWidth,
    @required this.currentBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      /// You can set the duration in days, hours, minutes, seconds,
      /// milliseconds or even microseconds.
      duration: const Duration(
        seconds: 1,
      ),

      /// All of our functions that change a value will call setState as their last act.
      /// On rebuilding, the AnimatedContainer recognized something changed and figures out
      /// how fast it needs to animate in order to finish the change in exactly the
      /// amount of time you specified in the duration. Just change the value,
      /// call setState and let the AnimatedContainer do the work
      height: currentHeight,
      width: currentWidth,
      padding: EdgeInsets.symmetric(
        vertical: currentVerticalPadding,
        horizontal: currentHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: currentColor,
        border: Border.all(
          color: currentBorderColor,
          width: currentBorderWidth,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(currentBorderRadius)),
      ),
      child: theChild,
    );
  }
}

/// The rest of this shows how to set up the functions that change values, as well
/// as use the AnimatedContainer in a UI

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color currentColor;
  double currentHeight;
  double currentWidth;
  double currentHorizontalPadding;
  double currentVerticalPadding;
  double currentBorderWidth;
  Color currentBorderColor;
  double currentBorderRadius;

  /// With Stateless Widgets, always initialize your variables in initState
  @override
  void initState() {
    /// Don't forget to call the State's initState function first
    /// You don't always *have to* make it first but if you put it first
    /// then its dispose() will be the last one called. This could be important
    /// if something else here is dependent on something in the superclass and then
    /// that dependency is disposed of while it's still needed.
    super.initState();
    currentColor = Colors.blue;
    currentHeight = 300;
    currentWidth = 300;
    currentHorizontalPadding = 50;
    currentVerticalPadding = 50;
    currentBorderWidth = 3;
    currentBorderColor = Colors.red;
    currentBorderRadius = 20;
  }

  /// This series of functions changes attributes based on their current value
  void changeColor() {
    if (currentColor == Colors.blue) {
      currentColor = Colors.green;
    } else if (currentColor == Colors.green) {
      currentColor = Colors.red;
    } else if (currentColor == Colors.red) {
      currentColor = Colors.yellow;
    } else {
      currentColor = Colors.blue;
    }
    setState(() {});
  }

  void changeBorderColor() {
    if (currentBorderColor == Colors.blue) {
      currentBorderColor = Colors.green;
    } else if (currentBorderColor == Colors.green) {
      currentBorderColor = Colors.red;
    } else if (currentBorderColor == Colors.red) {
      currentBorderColor = Colors.yellow;
    } else {
      currentBorderColor = Colors.blue;
    }
    setState(() {});
  }

  void changeHeight() {
    if (currentHeight == 300) {
      currentHeight = 250;
    } else if (currentHeight == 250) {
      currentHeight = 200;
    } else if (currentHeight == 200) {
      currentHeight = 150;
    } else {
      currentHeight = 300;
    }
    setState(() {});
  }

  void changeWidth() {
    if (currentWidth == 300) {
      currentWidth = 250;
    } else if (currentWidth == 250) {
      currentWidth = 200;
    } else if (currentWidth == 200) {
      currentWidth = 150;
    } else {
      currentWidth = 300;
    }
    setState(() {});
  }

  void changeHorizontalPadding() {
    if (currentHorizontalPadding == 50) {
      currentHorizontalPadding = 25;
    } else if (currentHorizontalPadding == 25) {
      currentHorizontalPadding = 10;
    } else {
      currentHorizontalPadding = 50;
    }
    setState(() {});
  }

  void changeVerticalPadding() {
    if (currentVerticalPadding == 50) {
      currentVerticalPadding = 25;
    } else if (currentVerticalPadding == 25) {
      currentVerticalPadding = 10;
    } else {
      currentVerticalPadding = 50;
    }
    setState(() {});
  }

  void changeBorderWidth() {
    if (currentBorderWidth == 3) {
      currentBorderWidth = 10;
    } else if (currentBorderWidth == 10) {
      currentBorderWidth = 20;
    } else {
      currentBorderWidth = 3;
    }
    setState(() {});
  }

  void changeBorderRadius() {
    if (currentBorderRadius == 20) {
      currentBorderRadius = 50;
    } else if (currentBorderRadius == 50) {
      currentBorderRadius = 100;
    } else {
      currentBorderRadius = 20;
    }
    setState(() {});
  }

  /// Create the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
        backgroundColor: AppColors.darkThemeTealVariant,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 350,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,

              /// Call the custom AnimatedContainer from above
              child: TheContainerBeingAnimated(
                currentHeight: currentHeight,
                currentWidth: currentWidth,
                currentVerticalPadding: currentVerticalPadding,
                currentHorizontalPadding: currentHorizontalPadding,
                currentColor: currentColor,
                currentBorderColor: currentBorderColor,
                currentBorderWidth: currentBorderWidth,
                currentBorderRadius: currentBorderRadius,
              ),
            ),

            /// The rest of the UI is all of the buttons
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeColor,
                    text: 'Color',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeBorderColor,
                    text: 'Border Color',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeHeight,
                    text: 'Height',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeWidth,
                    text: 'Width',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeVerticalPadding,
                    text: 'Vertical Padding',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeHorizontalPadding,
                    text: 'Horizontal Padding',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeBorderRadius,
                    text: 'Border Radius',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    callback: changeBorderWidth,
                    text: 'Border Width',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/// This is the black child Container
Widget theChild = Container(
  height: double.infinity,
  width: double.infinity,
  alignment: Alignment.center,
  color: Colors.black,
  child: const Text(
    'Child',
    style: TextStyle(
      color: Colors.white,
    ),
  ),
);

/// The custom Button
class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({
    Key key,
    @required this.callback,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: callback,
      child: Container(
        height: 40,
        width: 100,
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
