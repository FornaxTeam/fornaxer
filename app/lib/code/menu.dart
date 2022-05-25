import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodeMenu extends StatelessWidget {
  const CodeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: const Text('Settings'),
          onTap: () {
            GoRouter.of(context).push('/settings');
          },
        ),
      ],
    );
  }
}
