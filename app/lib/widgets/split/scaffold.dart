import 'package:flutter/material.dart';

import 'core.dart';

class SplitScaffold extends StatelessWidget {
  final SplitView view;
  final SplitWindow window;
  final bool expanded;
  final String title;
  final Widget body;
  final Icon? icon;
  final List<Widget> actions;
  final FloatingActionButton? floatingActionButton;

  SplitScaffold(
      {required this.view,
      required this.window,
      this.expanded = false,
      required this.title,
      required this.body,
      this.icon,
      this.actions = const [],
      this.floatingActionButton});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: Text(title),
          leading: icon,
          actions: [...actions],
        ),
        floatingActionButton: floatingActionButton,
        body: body);
  }
}
