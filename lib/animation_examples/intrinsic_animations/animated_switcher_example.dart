import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_colors.dart';
import 'package:o4_navigation_and_animation/app/app_images.dart';
import 'package:o4_navigation_and_animation/app/app_textstyles.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({
    Key key,
  }) : super(key: key);
  @override
  _AnimatedSwitcherExampleState createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  /// If you're changing to another widget of the same type but didn't use a key, it won't work.
  /// This is because the framework is checking for changes in the element layer, and the element layer
  /// is a listing of types and keys. If the Widget type didn't change, and there is no key to tell
  /// the framework that the new item is a different instance than the old one, then it's not going
  /// to animate. It needs a key to tell it there was a change
  Widget _child;
  final Widget _phoneBackground = const PhoneBackground();
  final Widget _sweepGradientDisc = const SweepGradientDisc();
  final Widget _flutterImage = Image.asset(AppImages.flutterLogo);
  final Widget _houseIcon = Icon(
    Icons.home,
    color: AppColors.darkThemeTealVariant,
    size: 160,
  );
  final Text _anyText = Text(
    'This can be ANYTHING!',
    semanticsLabel: 'This can be ANYTHING!',
    textAlign: TextAlign.center,
    style: AppTextStyles.boldItalic36.copyWith(
      color: const Color(0xFFFF3780),
    ),
  );

  @override
  void initState() {
    super.initState();
    _child = _phoneBackground;
  }

  void _changeFirstBox() {
    setState(() {
      _child == _phoneBackground
          ? _child = _flutterImage
          : _child == _flutterImage
              ? _child = _anyText
              : _child == _anyText
                  ? _child = _sweepGradientDisc
                  : _child == _sweepGradientDisc ? _child = _houseIcon : _child = _phoneBackground;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
        backgroundColor: AppColors.darkThemeTealVariant,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
      ),
    );
  }
}

class PhoneBackground extends StatelessWidget {
  const PhoneBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 200,
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color(0xFFBBBBBB),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          const BoxShadow(
            color: Colors.black87,
            blurRadius: 12,
            offset: Offset(4, 6),
          ),
        ],
        gradient: const SweepGradient(
          colors: [
            Color(0xFF0185D0),
            Color(0xFFB7459C),
            Color(0xFFFF3780),
          ],
          stops: [
            0.5,
            0.75,
            1,
          ],
          center: Alignment(0.0, 1.0),
        ),
      ),
    );
  }
}

class SweepGradientDisc extends StatelessWidget {
  const SweepGradientDisc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color(0xFFBBBBBB),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          const BoxShadow(
            color: Colors.black87,
            blurRadius: 12,
            offset: Offset(4, 6),
          ),
        ],
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
    );
  }
}
