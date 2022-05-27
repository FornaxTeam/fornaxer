import 'package:flutter/material.dart';

class LogConsoleView extends StatelessWidget {
  const LogConsoleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Text('Hello'),
      ...List.generate(50, (index) => Text('World $index')),
    ]);
  }
}
