import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_experiment/providers.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Simply Riverpod'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.only(top: 80.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  // Question Widget
                  Text("Question"),
                  SizedBox(height: 10.0),
                  Consumer(
                    builder: (BuildContext context,
                        T Function<T>(ProviderBase<Object, T>) watch,
                        Widget child) {
                      return watch(questionProvider).when(
                        data: (String value) {
                          return Text(value,
                              style: Theme.of(context).textTheme.headline4);
                        },
                        error: (Object error, StackTrace stackTrace) {
                          return Text("Error",
                              style: Theme.of(context).textTheme.headline4);
                        },
                        loading: () {
                          return CircularProgressIndicator();
                        },
                      );
                    },
                  ),
                  // Space 1
                  SizedBox(height: 80.0),
                  // Answer Widget
                  Text("Answer"),
                  SizedBox(height: 10.0),
                  Consumer(builder: (BuildContext context,
                      T Function<T>(ProviderBase<Object, T>) watch,
                      Widget child) {
                    // final count = context.read(counterController);
                    return Text(watch(counterController).toString(),
                        style: Theme.of(context).textTheme.headline4);
                  }),
                  // Space 2
                  SizedBox(height: 80.0),
                  // Buttons
                  ElevatedButton(
                    child: Text("="),
                    onPressed: () {
                      context.read(counterController.notifier).equal();
                    },
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    child: Icon(Icons.plus_one),
                    onPressed: () {
                      context.read(counterController.notifier).increment();
                    },
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    child: Icon(Icons.exposure_minus_1),
                    onPressed: () {
                      context.read(counterController.notifier).decrement();
                    },
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    child: Icon(Icons.replay_rounded),
                    onPressed: () {
                      context.refresh(questionProvider);
                    },
                  ),
                ],
              ),
            )));
  }
}
