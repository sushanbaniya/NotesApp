import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/about.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: ListView(children: [
      SizedBox(height: 50),
      Center(child: FaIcon(FontAwesomeIcons.sliders, size: 70)),
      SizedBox(height: 50),
      ListTile(
          leading: FaIcon(FontAwesomeIcons.pen),
          title: Text('NOTES'),
          onTap: () => Navigator.of(context).pushReplacementNamed('/')),
      ListTile(
          leading: FaIcon(FontAwesomeIcons.book),
          title: Text('ABOUT'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(About.routeName)),
    ]));
  }
}
