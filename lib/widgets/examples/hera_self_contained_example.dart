import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This can be called anything. It's just your object, *but it's not a Model*
class HeraObject {

  /// The ValueNotifier is what does the job you would normally
  /// associate with a model. It holds the value that we actually
  /// use. Here, "firstColor" is not the variable we use, it's an
  /// object that contains a "value", and this value is what we use.
  ///
  /// Normally we might just create a Color variable. Here, we
  /// create a ValueNotifier Object and have its value type
  /// set to Color, and its value initialized to white. To ensure
  /// one-way flow of data, we make it private and use a getter.
  final ValueNotifier<Color> _ourColor = ValueNotifier<Color>(Colors.white);
  ValueNotifier<Color> get ourColor => _ourColor;

  /// This is the method you call if you want to change the color. It
  /// will change the ValueNotifier's value, which triggers the correct
  /// ValueListenableBuilders to rebuild their child Widgets.
  void reactByChangingTheColor() {
    final colors = [Colors.white, Colors.yellow, Colors.orange, Colors.purple];
    _ourColor.value = colors[(colors.indexOf(_ourColor.value) + 1) % colors.length];
  }
}

/// This is where the app begins.
class TheHeraExampleAppStartsHere extends StatelessWidget {
  const TheHeraExampleAppStartsHere({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Many would put the Provider here but it's a good practice to
    /// place it as low as you can, while making sure a new BuildContext
    /// is created before you try to use it. Since we don't need to use the
    /// value until the PageWhereWeUseTheValues, we can put the
    /// Provider in the very last constructor we call before we
    /// call PageWhereWeUseTheValues (). Here, that's the State
    /// object of our HomePage.
    return MaterialApp(
      title: 'HERA Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    /// We're going to need to use our value right after this, so there
    /// will be only one more BuildContext created between here
    /// and there. This is now the time to create our Provider:
    return Provider<HeraObject>(
      create: (context) => HeraObject(),
      child: const MaterialApp(
        home: PageWhereWeUseTheValues(title: 'HERA Example'),
      ),
    );
  }
}

class PageWhereWeUseTheValues extends StatelessWidget {
  const PageWhereWeUseTheValues({Key key, this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    /// The build method above just created a new BuildContext,
    /// one that contains the Provider we just made above. By waiting
    /// until the last moment to create the Provider and this context,
    /// we make sure we don't "pollute the scope". After all,
    /// if we were going to pass the value from Widget to Widget,
    /// down the tree, then what would be the benefit of using
    /// any of this?
    ///
    /// Our very first action after creating the new context is putting
    /// it to work:
    final instanceOfOurHeraObject = Provider.of<HeraObject>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            /// Our listener is specifically listening to only one value,
            /// the _ourColor in the HeraObject. Unlike using a
            /// Consumer, there is zero chance we might
            /// rebuild this FAB unnecessarily because something
            /// else inside of our HeraObject changed.
            ///
            /// Remember, unnecessary rebuilds are possible
            /// if you aren't mindful with your Consumers
            ValueListenableBuilder<Color>(
              valueListenable: instanceOfOurHeraObject.ourColor,
              builder: (BuildContext context, Color color, _) {
                return FloatingActionButton(

                  /// Look closely. We use the *value* of ourColor... not ourColor
                  backgroundColor: instanceOfOurHeraObject.ourColor.value,
                  onPressed: () => instanceOfOurHeraObject.reactByChangingTheColor(),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: Colors.black54,
                  ),
                );
              },
            ),

            /// This is how you call the method. Notice that with this approach
            /// we don't have to worry about using  "listen: false" like when
            /// using Provider.of to call the function in the Provider example.
            FloatingActionButton(
              onPressed: () => instanceOfOurHeraObject.reactByChangingTheColor(),
              child: Icon(
                Icons.settings_power,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
