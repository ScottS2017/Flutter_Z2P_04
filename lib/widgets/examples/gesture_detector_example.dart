import 'package:flutter/material.dart';

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({
    Key key,
  }) : super(key: key);

  @override
  _GestureDetectorExampleState createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  final Widget _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx = const SizedBox(height: 16);

  void gestureActivated(String gesture) {
    setState(() {
      gestureStates[gesture] = !gestureStates[gesture];
    });
  }

  Map<String, bool> gestureStates;

  @override
  void initState() {
    super.initState();
    gestureStates = {
      'onTapActivated': false,
      'onDoubleTapActivated': false,
      'onLongPressActivated': false,
      'onHorizontalDragStartActivated': false,
      'onHorizontalDragEndActivated': false,
      'onVerticalDragStartActivated': false,
      'onVerticalDragEndActivated': false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Detector Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              GestureDetector(
                onTap: () => gestureActivated('onTapActivated'),
                onDoubleTap: () => gestureActivated('onDoubleTapActivated'),
                onLongPress: () => gestureActivated('onLongPressActivated'),
                onHorizontalDragStart: (_) => gestureActivated('onHorizontalDragStartActivated'),
                onHorizontalDragEnd: (_) => gestureActivated('onHorizontalDragEndActivated'),
                onVerticalDragStart: (_) => gestureActivated('onVerticalDragStartActivated'),
                onVerticalDragEnd: (_) => gestureActivated('onVerticalDragEndActivated'),
                child: Container(
                  height: 100,
                  width: 325,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    gradient: const SweepGradient(
                      colors: [
                        Color(0xFFFB7EE4),
                        Color(0xFFB7459C),
                        Color(0xFF01D9FE),
                        Color(0xFF0185D0),
                        Color(0xFFFB7EE4),
                      ],
                      stops: [0.0, 0.25, 0.5, 0.75, 1],
                    ),
                  ),
                  child: const Text(
                    'The Super-Duper Combo Gesture Detector',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 3,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              Text(
                'onTap',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gestureStates['onTapActivated'] ? Colors.green : Colors.black,
                ),
              ),
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              Text(
                'onDoubleTap',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gestureStates['onDoubleTapActivated'] ? Colors.green : Colors.black,
                ),
              ),
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              Text(
                'onLongPressActivated',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gestureStates['onLongPressActivated'] ? Colors.green : Colors.black,
                ),
              ),
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              Text(
                'onHorizontalDragStartActivated',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gestureStates['onHorizontalDragStartActivated'] ? Colors.green : Colors.black,
                ),
              ),
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              Text(
                'onHorizontalDragEndActivated',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gestureStates['onHorizontalDragEndActivated'] ? Colors.green : Colors.black,
                ),
              ),
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              Text(
                'onVerticalDragStartActivated',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gestureStates['onVerticalDragStartActivated'] ? Colors.green : Colors.black,
                ),
              ),
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              _dividerXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              Text(
                'onVerticalDragEndActivated',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: gestureStates['onVerticalDragEndActivated'] ? Colors.green : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
