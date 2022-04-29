// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({required this.title, required this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'Bicycle', icon: Icons.directions_bike),
  Choice(title: 'Boat', icon: Icons.directions_boat),
  Choice(title: 'Bus', icon: Icons.directions_bus),
  Choice(title: 'Train', icon: Icons.directions_railway),
  Choice(title: 'Walk', icon: Icons.directions_walk)
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final appTitle = "AppBar";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: appTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Choice _selectChoice = choices[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.school),
        title: Text(widget.title),
        actions: [
          _buildActionButton(choices[0]),
          _buildActionButton(choices[1]),
          _buildPopupMenu(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _selectChoice.icon,
              size: 120,
            ),
            Text(_selectChoice.title)
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(Choice item) {
    return IconButton(
      icon: Icon(item.icon),
      tooltip: item.title,
      onPressed: () {
        _select(item);
      },
    );
  }

  void _select(Choice choice) {
    setState(() {
      _selectChoice = choice;
    });
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<Choice>(
      itemBuilder: (context) {
        return choices.skip(2).map((Choice choice) {
          return PopupMenuItem<Choice>(
              value: choice, child: Text(choice.title));
        }).toList();
      },
      onSelected: _select,
      icon: Icon(Icons.menu),
      tooltip: "Menu",
      onCanceled: () {
        print("onCanceled");
      },
    );
  }
}
