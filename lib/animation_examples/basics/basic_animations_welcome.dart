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
              const Expanded(
                flex: 10,
                child:  Text(
                  'Basic\nAnimations',
                  semanticsLabel: 'Basic Animations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
              const Expanded(
                flex: 80,
                child:  Text(
                  '\n      EDIT THIS',
                  semanticsLabel: 'EDIT THIS',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              const Expanded(
                flex: 10,
                child: Text(
                  '\nSwipe Up to Continue\n',
                  semanticsLabel: 'Press And Hold Anywhere to Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
