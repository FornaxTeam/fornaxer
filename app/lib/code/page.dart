import 'package:flutter/material.dart';
import 'package:fornaxer/code/command.dart';
import 'package:fornaxer/code/menu.dart';

class CodePage extends StatelessWidget {
  const CodePage({Key? key}) : super(key: key);

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
          ),
          const CodeMenu()
        ],
      ),
      body: const Center(
        child: Text('Code'),
      ),
    );
  }
}
