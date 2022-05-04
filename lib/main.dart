import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ValueNotifier("Some Fancy data"),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ChildWidget1(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final _textNotifier = context.read<ValueNotifier<String>>();
          _textNotifier.value = "Some new fancy data";
        },
      ),
    );
  }
}

class ChildWidget1 extends StatelessWidget {
  const ChildWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChildWidget2();
  }
}

class ChildWidget2 extends StatelessWidget {
  const ChildWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChildWidget3();
  }
}

class ChildWidget3 extends StatelessWidget {
  const ChildWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textNotifier = context.watch<ValueNotifier<String>>();
    return Text(_textNotifier.value);
  }
}
