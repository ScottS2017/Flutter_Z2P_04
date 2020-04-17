import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/app/app_textstyles.dart';

class RegularButtonExamples extends StatefulWidget {
  const RegularButtonExamples({
    Key key,
  }) : super(key: key);

  @override
  _RegularButtonExamplesState createState() => _RegularButtonExamplesState();
}

class _RegularButtonExamplesState extends State<RegularButtonExamples> {
  final Widget divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx = const SizedBox(
    height: 16,
  );

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Button Examples',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Be sure to expressly set the padding to zero to override any previous settings
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Header Here',
                  style: AppTextStyles.appBarTextStyle.copyWith(color: Colors.white, fontSize: 36),
                ),
              ),
            ),
            ListTile(
              title: const Text('Flat and Outline Buttons'),
              onTap: () {
                Navigator.of(context).pop();
                _controller.animateToPage(0,
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.easeInOut);
              },
            ),
            ListTile(
              title: const Text('Raised Button'),
              onTap: () {
                Navigator.of(context).pop();
                _controller.animateToPage(1,
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.easeInOut);
              },
            ),
            ListTile(
              title: const Text('Icon Button'),
              onTap: () {
                Navigator.of(context).pop();
                _controller.animateToPage(2,
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.easeInOut);
              },
            ),
            ListTile(
              title: const Text('Popup and Dropdown Menu Buttons'),
              onTap: () {
                Navigator.of(context).pop();
                _controller.animateToPage(3,
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.easeInOut);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ----------------------------- Flat Button ---------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          Material(
            color: Colors.white,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,

              /// Plain FlatButton
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    'FlatButton',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _controller.animateToPage(1,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    child: const Text(
                      'Plain FlatButton, it looks like text.\nTap to go to the RaisedButton page.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  /// Added grey FlatButton
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  FlatButton(
                    onLongPress: () => _controller.animateToPage(2,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    color: Colors.grey[300],
                    child: const Text(
                      'Added the color grey[300].\n*LongPress* to go\nto the IconButton page.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  /// Green and transparent gradient FlatButton
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: FlatButton(
                      onPressed: () => _controller.animateToPage(3,
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOut),
                      splashColor: const Color(0x44FF9999),
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black54, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.teal,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            stops: [0, .3],
                          ),
                        ),
                        child: const Text(
                          'You can make a FlatButton with a gradient!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                  /// Sweep Gradient FlatButton
                  FlatButton(
                    onPressed: () => _controller.animateToPage(2,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    onLongPress: () => _controller.animateToPage(3,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    shape:  RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                        gradient: SweepGradient(
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
                        'Multiple Functions in one button:\nTap for the IconButton page.\nLongPress for the MenuButtons page.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                  /// Basic OutlineButton
                  OutlineButton(
                    onPressed: () => _controller.animateToPage(1,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    child: const Text(
                      'A Simple OutlineButton.\nClick Me for the next page...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                ],
              ),
            ),
          ),

          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ----------------------------- Raised Button ---------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  const Text(
                    'RaisedButton',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  /// Disabled RaisedButton
                  const RaisedButton(
                    onPressed: null,
                    child: Text(
                      'The function is null, so this is disabled',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                  /// Bad Example
                  RaisedButton(
                    onPressed: () => _controller.animateToPage(0,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'BAD. Don\'t use a Container for borders, use the shape property in the button and the Ink Widget for a color or gradient. Otherwise, the hit area won\'t match the size of the container and it will will spill over, like this. (The grey is the hit area, try it.)\n\n',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            'Tap to go back to FlatButtons',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                  /// Blue RaisedButton with LongPress
                  RaisedButton(
                    // The RaisedButton requires onPressed, but you can set it to null and use onLongPress
                    onPressed: null,
                    onLongPress: () => _controller.animateToPage(2,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    color: Colors.blue[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Added the color blue[300].\nLongPress for the IconButtons page',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                  /// Red bordered RaisedButton
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: RaisedButton(
                      onPressed: () => _controller.animateToPage(3,
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOut),
                      splashColor: Colors.red[900],
                      color: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.red, width: 3,),
                      ),
                      child: Padding(
                        padding:const  EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'In a RaisedButton, borders are created by using a BorderSide in the "shape", not Border.all\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const Text(
                              'Tap to go to Dropdown\nand Popup Menu Buttons',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                  /// White RaisedButton with elevation set to 10
                  RaisedButton(
                    onPressed: () => _controller.animateToPage(2,
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.easeInOut),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black38, width: 3),
                    ),
                    elevation: 4,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'RasiedButtons have an\nelevation. It changes\nthe drop shadow. People\nare used to seeing it set\nto 4, but you can change it.\n\nClick Me for the next page...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                  divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
                ],
              ),
            ),
          ),

          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------ IconButton - ---------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'IconButton',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),

                /// House IconButton
                IconButton(
                  onPressed: () => _controller.animateToPage(0,
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.easeInOut),
                  icon: Icon(Icons.home),
                  iconSize: 32,
                  tooltip: 'Back to Page 1',
                ),
                divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                /// Teal colored number two IconButton
                Material(
                  color: Colors.white,
                  child: Center(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.teal,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () => _controller.animateToPage(1,
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.easeInOut),
                          icon: Icon(Icons.looks_two),
                          iconSize: 108,
                          tooltip: 'Back to Page 2',
                        ),
                      ),
                    ),
                  ),
                ),
                divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,

                /// Blue minimum hit area demonstration button
                Row(
                  children: <Widget>[
                    const Spacer(
                      flex: 50,
                    ),
                    const Text(
                      'There\'s an icon in the\nblue circle, I swear!\nClick it for the next page...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Material(
                      color: Colors.white,
                      child: Center(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.lightBlue,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () => _controller.animateToPage(3,
                                duration: const Duration(
                                  milliseconds: 750,
                                ),
                                curve: Curves.easeInOut),
                            icon: Icon(Icons.attach_money),
                            iconSize: 6,
                            tooltip: 'Back to Page 4',
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 45,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '     Notice there is a minimum size for the hit region. The IconButton will not allow the hit region to be smaller than the "Touch Target Size" required in the Material Design specification.\n\n     The icon in the blue button is set to be size 6, the blue reveals the actual hit area of the button which, as you can see, is not allowed to be that small.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              ],
            ),
          ),

          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------ MenuButtons ---------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          /// ------------------------------------------------------------------------------
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'Dropdown and Popup\nMenu Buttons',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),

                /// For the sake of learning, the String variable for this
                /// DropdownButton is declared as a global just below here.
                /// Please don't do this in a real app!!
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.purple,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.purple),
                  underline: Container(
                    height: 2,
                    color: Colors.purple,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      if (newValue == 'Flat Buttons') {
                        _controller.animateToPage(0,
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOut);
                      } else if (newValue == 'Raised Buttons') {
                        _controller.animateToPage(1,
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOut);
                      } else if (newValue == 'Icon Buttons') {
                        _controller.animateToPage(2,
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOut);
                      } else {
                        dropdownValue = newValue;
                      }
                    });
                  },
                  items: <String>[
                    'DropdownMenuButton',
                    'Flat Buttons',
                    'Raised Buttons',
                    'Icon Buttons',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                ///
                ///
                ///
                /// PopupMenuButton with a child
                ///
                PopupMenuButton<String>(
                  onSelected: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      if (newValue == 'Flat Buttons') {
                        _controller.animateToPage(0,
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOut);
                      } else if (newValue == 'Raised Buttons') {
                        _controller.animateToPage(1,
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOut);
                      } else if (newValue == 'Icon Buttons') {
                        _controller.animateToPage(2,
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeInOut);
                      }
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Flat Buttons',
                      child: Text('Flat Buttons'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Raised Buttons',
                      child: Text('Raised Buttons'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Icon Buttons',
                      child: Text('Icon Buttons'),
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      gradient: const SweepGradient(
                        colors: [
                          Colors.blue,
                          Colors.white,
                          Colors.red,
                          Colors.white,
                          Colors.blue,
                        ],
                        stops: [0.0, 0.25, 0.5, 0.75, 1],
                      ),
                    ),
                    child: const Text(
                      'PopupMenuButtons can\nhave a child (like this\nContainer) or an Icon,\n\nBut not both',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),

                ///
                ///
                ///
                /// PopupMenuButton with an icon
                ///
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'This is "The Hamburger"',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                      ),
                      const SizedBox(width: 8),
                      PopupMenuButton<String>(
                        onSelected: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            if (newValue == 'Flat Buttons') {
                              _controller.animateToPage(0,
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.easeInOut);
                            } else if (newValue == 'Raised Buttons') {
                              _controller.animateToPage(1,
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.easeInOut);
                            } else if (newValue == 'Icon Buttons') {
                              _controller.animateToPage(2,
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.easeInOut);
                            }
                          });
                        },
                        icon: Icon(Icons.menu),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Flat Buttons',
                            child: Text('Flat Buttons'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Raised Buttons',
                            child: Text('Raised Buttons'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Icon Buttons',
                            child: Text('Icon Buttons'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                divider_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String dropdownValue = 'DropdownMenuButton';
