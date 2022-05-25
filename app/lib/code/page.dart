import 'package:flutter/material.dart';
import 'package:fornaxer/code/command.dart';
import 'package:fornaxer/code/console.dart';
import 'package:fornaxer/widgets/split/core.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Code'),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const CommandOverlay());
              },
              icon: const Icon(Icons.terminal_outlined),
            )
          ],
        ),
        body: SplitView(
          axis: Axis.vertical,
          ratio: 0.75,
          first: SplitWindow(
            builder: (context) => Center(child: Text("Code")),
          ),
          second: SplitWindow(
            builder: (context) => const ConsoleView(),
          ),
        ));
  }
}
