import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';

class About extends StatelessWidget {
  static const routeName = '/about';

  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        title: Text('Notes App'),
        
      ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('This App is Created by SUSHAN BANIYA'),
        SizedBox(height: 20),
        FaIcon(FontAwesomeIcons.addressBook),

      ]))
    );
  }
}