import 'package:flutter/material.dart';

class ProviderExercise extends StatelessWidget {
  const ProviderExercise({
    Key key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Provider Exercise'),
      ),
      body: const Placeholder(
        fallbackHeight: double.infinity,
        color: Colors.purple,
      ),
    );
  }
}

// TODO 1) Delete EVERYTHING above here. Yes, everything, even the imports.
// TODO 2) Create a class called ProviderExerciseModel that extends ChangeNotifier.
// TODO 3) In it, create a bool called _isPurple and give it getter called isPurple
// TODO 4) In it create a void function called toggleProviderModelColor that toggles _isPurple and notifies listeners.
// TODO 5) Use the stlss command to create a class called ProviderAppExercise that extends StatelessWidget. Make sure to give it a constructor is constant, takes a Key called key, calls the super and the super's key parameter is our key
// TODO 6) The build method returns a ChangeNotifierProvider of type ProviderExerciseModel, its create calls our ProviderExerciseModel constructor.
// TODO 7) The child of the ChangeNotifierProvider should be a MaterialApp with it's home set to ProviderExerciseHome (create that next)
// TODO 8) Use stlss again to create a class called ProviderExerciseHome
// TODO 9) Constant constructor with a Key and use that key in a call to super. (This approach should be you default for any Widget)
// TODO 10) The build method returns a Scaffold with a purple Appbar and the title text is "Provider Exercise"
// TODO 11) The body is a container wdi, hdi, align center
// TODO 12) Child is a Consumer of type ProviderExerciseModel. Just to help you understand, use "myMadeUpObjectInstanceName" for the second parameter of the builder.  (in place of the default of "value")
// TODO 13) The builder should return a container with height and width of 300 and use the following ternary for the color: "myMadeUpObjectInstanceName.isPurple == true ? Colors.purple : Colors.grey,"
// TODO 14) Add a purple FAB that returns a Provider.of with type ProviderExerciseModel, has listen set to false and calls toggleProviderModelColor
// TODO 15) Use autoRenew for the icon and make it red, too
