import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fornaxer/code/console/details.dart';
import 'package:fornaxer/code/console/log.dart';

class ConsoleView extends StatefulWidget {
  const ConsoleView({Key? key}) : super(key: key);

  @override
  State<ConsoleView> createState() => _ConsoleViewState();
}

class _ConsoleViewState extends State<ConsoleView> {
  bool _details = false;
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
                        child: _details
                            ? const DetailsConsoleView()
                            : const LogConsoleView()),
                    SizedBox(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          IconButton(
                            icon: _details
                                ? const Icon(Icons.arrow_drop_down_outlined)
                                : const Icon(Icons.arrow_drop_up_outlined),
                            onPressed: () {
                              setState(() {
                                _details = !_details;
                              });
                            },
                          ),
                          const VerticalDivider(),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Command',
                                fillColor: Colors.transparent,
                              ),
                              controller: _controller,
                              onSubmitted: (value) {
                                if (kDebugMode) {
                                  print(value);
                                }
                                _controller.text = "";
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
        ),
      );
    });
  }
}
