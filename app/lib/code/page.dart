import 'package:flutter/material.dart';
import 'package:fornaxer/code/code.dart';
import 'package:fornaxer/code/console/view.dart';
import 'package:fornaxer/widgets/split/core.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile =
          constraints.maxWidth < 600 || constraints.maxHeight < 600;
      return Scaffold(
          appBar: AppBar(
            title: const Text('Code'),
            actions: [
              if (isMobile)
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const Dialog(
                            backgroundColor: Colors.transparent,
                            child: ConsoleView()));
                  },
                  icon: const Icon(Icons.terminal_outlined),
                )
            ],
          ),
          body: isMobile
              ? const CodeView()
              : const SplitView(
                  axis: Axis.vertical,
                  ratio: 0.75,
                  first: CodeView(),
                  second: ConsoleView(),
                ));
    });
  }
}
