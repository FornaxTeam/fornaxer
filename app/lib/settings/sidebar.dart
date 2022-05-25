import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsSidebar extends StatelessWidget {
  final String page;

  const SettingsSidebar({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _SettingsSidebarItem(
          title: 'General',
          page: '',
          icon: const Icon(Icons.settings),
          currentPage: page,
        ),
        _SettingsSidebarItem(
          title: 'Appearance',
          page: 'appearance',
          icon: const Icon(Icons.color_lens),
          currentPage: page,
        ),
      ],
    );
  }
}

class _SettingsSidebarItem extends StatelessWidget {
  final String title;
  final Icon? icon;
  final String page;
  final String? currentPage;
  const _SettingsSidebarItem(
      {Key? key,
      required this.title,
      required this.page,
      this.icon,
      this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      selected: page == currentPage,
      leading: icon,
      onTap: () {
        GoRouter.of(context).go('/settings/$page');
      },
    );
  }
}
