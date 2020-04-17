import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BasicTween extends StatefulWidget {

  const BasicTween({
    Key key,
  }) : super(key: key);


  @override
  _BasicTweenState createState() => _BasicTweenState();
}

class _BasicTweenState extends State<BasicTween> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 400.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Tween'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    height: animation.value,
                    width: animation.value,
                    child: const FlutterLogo(),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 50),
                child: /// White RaisedButton with elevation set to 10
                RaisedButton(
                  onPressed: ()=> controller.forward(from: 0),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black38, width: 3),
                  ),
                  elevation: 4,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Replay',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
