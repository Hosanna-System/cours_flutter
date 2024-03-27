import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _counter = 0;
  int _customIncrement = 1;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + _customIncrement;
    });
  }

  void udpateCustomIncrement(String value) {
    setState(() {
      _customIncrement = int.tryParse(value) ?? 1;
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                constraints: BoxConstraints(maxWidth: 200),
                border: OutlineInputBorder(),
                labelText: 'Saissisez un incrément',
              ),
              textAlign: TextAlign.center,
              onChanged: udpateCustomIncrement,
            ),
            Text(
              ' $_counter + $_customIncrement = ${_counter + _customIncrement}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              _counter > 0
                  ? (_counter == _customIncrement
                      ? 'Vous avez cliqué 1 fois !'
                      : (_counter > _customIncrement
                          ? 'Vous avez cliqué ${_counter / _customIncrement} fois !'
                          : 'Vous avez cliqué 2 fois !'))
                  : 'Cliquez pour commencer !',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Row(
          children: [
            const Spacer(),
            const Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
            Text(
              '${_customIncrement}',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
