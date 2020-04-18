import 'package:flutter/material.dart';

class BasicAnimationsWelcome extends StatefulWidget {
  const BasicAnimationsWelcome({
    Key key,
  }) : super(key: key);
  @override
  _BasicAnimationsWelcomeState createState() => _BasicAnimationsWelcomeState();
}

class _BasicAnimationsWelcomeState extends State<BasicAnimationsWelcome>{

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 16 - MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width - 16,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFDDDDDD),
            border: Border.all(
              style: BorderStyle.solid,
              width: 5,
              color: const Color(0xFF888888),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Basic\nAnimations',
                semanticsLabel: 'Basic Animations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              const Expanded(
                child:  Text(
                  '\n      Here we\'ll take a look at some of the more simple '
                    'approaches to animation including simple Tweens and '
                    'using a StatusListener to know when a Tween is at the '
                    'beginning, end, or is running forwards or backwards.\n\n'
                    '     We\'ll cover simple Physics animations, several animation '
                    'Curves and then take a look at how to stagger a sequence '
                    'of animations all along the duration of a single, shared controller.',
                  semanticsLabel: "Here we'll take a look at some of the more simpleapproaches to animation including simple Tweens andusing a StatusListener to know if a Tween is at the beginning, end, or is running forwards or backwards. We'll cover simple Physics animations, several animation Curves and then take a look at how to stagger a sequence of animations all along the duration of a single, shared controller.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              const Text(
                '\nSwipe Left for Intrinsic Animations\n\nSwipe Up for Examples\n',
                semanticsLabel: 'Swipe  Left for Intrinsic Animations, Swipe Up for Examples',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
