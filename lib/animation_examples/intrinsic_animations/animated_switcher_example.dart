import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  Widget _child;

  /// If you're changing to another widget of the same type but didn't use a key, it won't work.
  /// This is because the framework is checking for changes in the element layer, and the element layer
  /// is a listing of types and keys. If the Widget type didn't change, and there is no key to tell
  /// the framework that the new item is a different instance than the old one, then it's not going
  /// to animate. It needs a key to tell it there was a change
  final Widget _blueBox = Container(key: const Key('blueKey'), color: Colors.blue);
  final Widget _yellowBox = Container(key: const Key('yellowKey'), color: Colors.yellow);
  final Icon _addIcon = const Icon(Icons.add) ;
  final Text _anyText = const Text('This can be ANYTHING!') ;

  @override
  void initState() {
    super.initState();
    _child = _blueBox;
  }

  void _changeFirstBox() {
    setState(() {
      _child == _blueBox ?
      _child = _addIcon :
      _child == _addIcon ?
      _child = _anyText :
      _child == _anyText ?
        _child = _yellowBox :
        _child = _blueBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(50),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _changeFirstBox,

        /// The default animation is a fade but you could change that,
        /// as well as add curves.
        child: AnimatedSwitcher(
          duration: const Duration(
            seconds: 1,
          ),
          child: _child,
        ),
      ),
    );
  }
}
