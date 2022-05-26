import 'package:flutter/material.dart';

import 'core.dart';

class SplitScaffold extends StatelessWidget {
  final SplitView view;
  final bool expanded;
  final String title;
  final Widget body;
  final Icon? icon;
  final List<Widget> actions;
  final FloatingActionButton? floatingActionButton;

  const SplitScaffold(
      {required this.view,
      this.expanded = false,
      required this.title,
      required this.body,
      this.icon,
      super.key,
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
