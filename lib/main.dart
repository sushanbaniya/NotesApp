import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './screens/about.dart';
import './widgets/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),
    routes: {
      About.routeName: (ctx) => About(),
    }
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subjectController = TextEditingController();
  var _noteController = TextEditingController();
  List<Map<dynamic, dynamic>> collection = [];

  void openBottomSheet() {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 5),),
                    // height: 700,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        TextField(
                            decoration: InputDecoration(
                              label: Text('Subject'),
                            ),
                            controller: _subjectController),
                        TextField(
                          decoration: InputDecoration(
                            label: Text('Note'),
                          ),
                          controller: _noteController,
                          keyboardType: TextInputType.multiline ,
                          // expands: true,
                        ),
                        // IconButton(icon: Icon(Icons.date_range), onPressed: () {
                        //   showDatePicker(context: context,firstDate: DateTime(2010), lastDate: DateTime(2099), initialDate: DateTime.now()).;

                        // } ),
                         
                        SizedBox(height: 50),
                        ElevatedButton(
                          child: Text('Create Note'),
                          onPressed: () {
                            submit();
                            _subjectController.clear();
                            _noteController.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }

  void submit() {
    var subject = _subjectController.text;
    var note = _noteController.text;
    // print(subject);
    // print(note);
    setState(() {
      collection.add({'subject': subject, 'note': note});
    });

    // print(collection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
          drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        title: Text('Notes App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              openBottomSheet();
            },
          ),
        ],
      ),
      body: Center(
        child: collection.isEmpty
            ? Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('START ADDING SOME NOTES...'),
                SizedBox(height: 20),
                FaIcon(FontAwesomeIcons.penToSquare),
                
              ],
            )
            : ListView.builder(
                itemCount: collection.length,
                itemBuilder: (context, index) {
                  // return SizedBox(
                  //   child: Container(decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle,border: Border.all(width: 3)) ,child: SizedBox(
                  //     child: Column(children: [
                  //       Text(collection[index]['subject']),
                  //         Text(collection[index]['note']),
                  //     ],),
                  //   )),
                  // );
                  // return Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)) ,
                  //   child: Column(children: [
                  //     Text(collection[index]['subject']),
                  //     Text(collection[index]['note']),
                  //     FaIcon(FontAwesomeIcons.cloud, color: Colors.blue, size: 50,)

                  //   ])
                  // );
                  return CircleAvatar(
                      radius: 170,
                      backgroundColor: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 70),
                            Text(
                                'SUBJECT: ${(collection[index]['subject'] as String).toUpperCase()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(height: 20),
                            Text(
                                'NOTE: ${(collection[index]['note'] as String).toUpperCase()}',
                                softWrap: true),
                          ]));
                }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: FaIcon(FontAwesomeIcons.penClip, color: Colors.black),
          onPressed: () {
            openBottomSheet();
          }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
