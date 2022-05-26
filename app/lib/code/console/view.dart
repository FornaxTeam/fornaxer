import 'package:flutter/material.dart';

class ConsoleView extends StatefulWidget {
  const ConsoleView({Key? key}) : super(key: key);

  @override
  State<ConsoleView> createState() => _ConsoleViewState();
}

class _ConsoleViewState extends State<ConsoleView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 225,
        child: Card(
          child: constraints.maxHeight < 75
              ? const Center(child: Text('Console'))
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Column(children: [
                    Expanded(
                        child: ListView(children: [
                      const Text('Hello'),
                      ...List.generate(50, (index) => Text('World $index')),
                    ])),
                    TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Command',
                        fillColor: Colors.transparent,
                      ),
                      controller: _controller,
                      onSubmitted: (value) {
                        print(value);
                        _controller.text = "";
                      },
                    ),
                  ]),
                ),
        ),
      );
    });
  }
}
