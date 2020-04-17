import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderSolutionModel extends ChangeNotifier {
  bool _isPurple = true;
  bool get isPurple => _isPurple;

  void toggleProviderModelColor() {
    _isPurple = !_isPurple;
    notifyListeners();
  }
}

class ProviderAppSolution extends StatelessWidget {
  const ProviderAppSolution({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderSolutionModel>(
      create: (context) => ProviderSolutionModel(),
      child: const MaterialApp(
        home: ProviderSolutionHome(),
      ),
    );
  }
}

class ProviderSolutionHome extends StatelessWidget {
  const ProviderSolutionHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Provider Solution'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Consumer<ProviderSolutionModel>(
          builder: (context, myMadeUpObjectInstanceName, child) {
            return Container(
              height: 300,
              width: 300,
              color: myMadeUpObjectInstanceName.isPurple == true ? Colors.purple : Colors.grey,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Provider.of<ProviderSolutionModel>(context, listen: false).toggleProviderModelColor(),
        backgroundColor: Colors.purple,
        child: Icon(Icons.autorenew,
        ),
      ),
    );
  }
}
