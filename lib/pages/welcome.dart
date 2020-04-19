import 'dart:async';

import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_colors.dart';
import 'package:o4_navigation_and_animation/app/app_images.dart';

import 'home_teal.dart';

class Welcome extends StatefulWidget {
  const Welcome({
    Key key,
  }) : super(key: key);
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  bool _splashScreenIsOnstage = true;
  bool _startFade = false;

  @override
  void initState() {
    super.initState();
    fadeTimer();
    offstageTimer();
  }

  Future<Timer> fadeTimer() async {
    return Timer(
      const Duration(milliseconds: 100),
      () => setState(
        () {
          _startFade = true;
        },
      ),
    );
  }

  Future<Timer> offstageTimer() async {
    return Timer(
      const Duration(seconds: 5),
      () => setState(
        () {
          _splashScreenIsOnstage = false;
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onLongPress: () => Navigator.push<Route>(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeTeal(),
                ),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                alignment: Alignment.topLeft,
                child: Container(
                  height: double.infinity,
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
                        'Navigation\nand Animation',
                        semanticsLabel: 'Navigation and Animation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      const  Text(
                        "\n      Here, we'll look at getting from page to page, getting back, and we'll have a look at Flutter's animation capabilities.\n\n     Flutter not only makes it easy to do custom animaitons, it has pre-built solutions for the most common animation problems you might run into. ",
                        semanticsLabel: "Here, we'll look at getting from page to page, getting back, and we'll have a look at Flutter's animation capabilities. Flutter not only makes it easy to do custom animaitons, it has pre-built solutions for the most common animation problems you might run into. ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '\nPress And Hold\nAnywhere to Continue\n',
                        semanticsLabel: 'Press And Hold Anywhere to Continue',
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
            ),
            Positioned(
              top: _splashScreenIsOnstage == true ? 0 : MediaQuery.of(context).size.height,
              child: AnimatedOpacity(
                opacity: _startFade == true ? 0 : 1.0,
                curve: Curves.easeInToLinear,
                duration: const Duration(milliseconds: 4000),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.darkThemeNoElevation,
                  child: Column(
                    children: <Widget>[
                      const Spacer(
                        flex: 35,
                      ),
                      const Text(
                        'Z2P',
                        style: TextStyle(
                          color: Color(0xDDFFFFFF),
                          fontSize: 140,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Image.asset(
                        AppImages.flutterLogo,
                        semanticLabel: 'Flutter, zero to productive',
                      ),
                      const Spacer(
                        flex: 64,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}