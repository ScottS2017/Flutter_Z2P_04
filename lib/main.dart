import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/pages/welcome.dart';

void main() => runApp(WidgetsYouCanSee());

/// Github URL:  https://tinyurl.com/Z2P-Widgets-You-Can-See

class WidgetsYouCanSee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Z2P Widgets You Can See',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Welcome(),
    );
  }
}
