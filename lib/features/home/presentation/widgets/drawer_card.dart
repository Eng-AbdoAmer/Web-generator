import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String name;
  const DrawerCard({super.key, this.onTap, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(name),
    );
  }
}
