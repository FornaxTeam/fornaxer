import 'package:flutter/material.dart';
import 'package:fornaxer/settings/view.dart';

class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingsView(
      title: 'General',
      page: '',
      child: Center(
        child: Text('General'),
      ),
    );
  }
}
