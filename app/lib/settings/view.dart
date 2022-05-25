import 'package:flutter/material.dart';
import 'package:fornaxer/settings/sidebar.dart';

class SettingsView extends StatelessWidget {
  final Widget child;
  final String page;
  final String title;

  const SettingsView(
      {Key? key, required this.child, required this.title, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: isMobile ? _SettingsSidebarDrawer(page: page) : null,
        body: isMobile
            ? child
            : Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                SizedBox(width: 300, child: SettingsSidebar(page: page)),
                Flexible(child: child)
              ]),
      );
    });
  }
}

class _SettingsSidebarDrawer extends StatelessWidget {
  final String page;
  const _SettingsSidebarDrawer({Key? key, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: SettingsSidebar(page: page));
  }
}
