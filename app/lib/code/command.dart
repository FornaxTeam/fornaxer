import 'package:flutter/material.dart';

class CommandOverlay extends StatefulWidget {
  const CommandOverlay({Key? key}) : super(key: key);

  @override
  State<CommandOverlay> createState() => _CommandOverlayState();
}

class _CommandOverlayState extends State<CommandOverlay> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: ListView(
              shrinkWrap: true,
              children: const [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Command',
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Run'),
                )
              ],
            ),
          ),
        ));
  }
}
