import 'package:flutter/material.dart';

import 'view.dart';

class AppearanceSettingsPage extends StatelessWidget {
  const AppearanceSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingsView(
      title: 'Appearance',
      page: 'appearance',
      child: Center(
        child: Text('Appearance'),
      ),
    );
  }
}
