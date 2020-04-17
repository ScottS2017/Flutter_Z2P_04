import 'package:flutter/material.dart';

class ButtonsExercises extends StatefulWidget {
  const ButtonsExercises({
    Key key,
  }) : super(key: key);

  @override
  _ButtonsExercisesState createState() => _ButtonsExercisesState();
}

class _ButtonsExercisesState extends State<ButtonsExercises> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Button Exercises'),
        ),
        body: const Placeholder(
          fallbackHeight: double.infinity,
          color: Colors.teal,
        ),
      ),
    );
  }
}
