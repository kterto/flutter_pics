// To create a stateless widget we need to follow these following steps:
// 1 - import flutter helper library
// 2 - create a class that will be our costum widget
// this class must extend the "StatelessWidget" base class
// 3 - must define the build() method wish returns the widgets
// that the *this* widget will show
//////////////////////////////////////////////////////////////////////
// To create a sateful widget:
// 1 - break the widget into two separate classes, the Widget e the Widget State
// 2 - add a 'createState()' method to the widget class that return an instance of Widget State
// 3 - add a build to the widget state class
// 4 - add instance variables of interest in the widget state class
// 5 - any time the widget state's data change call the 'setState()' method

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';


class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}


class AppState extends State<App> {
  int counter = 50;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response = await get('http://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    
    setState(() {
      images.add(imageModel);    
    });
  }

  Widget build(context) {
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
      appBar: AppBar(
        title: Text('Lets see some images!'),
      ),
    ),
  );
  }
}


