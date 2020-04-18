import 'package:flutter/material.dart';

class IntrinsicAnimationsWelcome extends StatefulWidget {
  const IntrinsicAnimationsWelcome({
    Key key,
  }) : super(key: key);
  @override
  _IntrinsicAnimationsWelcomeState createState() => _IntrinsicAnimationsWelcomeState();
}

class _IntrinsicAnimationsWelcomeState extends State<IntrinsicAnimationsWelcome>{

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
                'Intrinsic\nAnimations',
                semanticsLabel: 'Intrinsic Animations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              const Expanded(
                child:  Text(
                  '\n      "Intrinsic" animations are animations built into the Flutter framework in order to make our lives easier. They handle the more routine things you might want to animate, from the opacity of your Widget to its size (in either dimension), padding, rotation, scale or color. \n\n     One of the most powerful of these is the AnimatedContainer, which has more than enough capability to handle almost anything you might need, or want.',
                  semanticsLabel: '"Intrinsic" animations are animations built into the Flutter framework in order to make our lives easier. They handle the more routine things you might want to animate, from the opacity of your Widget to its size (in either dimension), padding, rotation, scale or color. One of the most powerful of these is the AnimatedContainer, which has more than enough capability to handle almost anything you might need, or want.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              const Text(
                '\nSwipe Right for Basic Animations\n\nSwipe Up for Examples\n',
                semanticsLabel: 'Swipe Right for Basic Animations, Swipe Up for Examples',
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
