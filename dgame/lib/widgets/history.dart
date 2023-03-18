import 'package:flutter/material.dart';
class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: List.generate(choices.length, (index) {
            return Center(
              child: SelectCard(choice: choices[index],),
            );
          }
          )
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
  //final Button button;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Grade 1', icon: Icons.person),
  const Choice(title: 'Grade 2', icon: Icons.person),
  const Choice(title: 'Grade 3', icon: Icons.person),
  const Choice(title: 'Grade 4', icon: Icons.person),
  const Choice(title: 'Grade 5', icon: Icons.person),
  const Choice(title: 'Grade 6', icon: Icons.person),
  const Choice(title: 'Grade 7', icon: Icons.person),
  const Choice(title: 'Grade 8', icon: Icons.person),
];

class SelectCard extends StatelessWidget {
  const SelectCard({required this.choice});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xffb388ff),
        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:50.0, color: Colors.white)),
              Text(choice.title, style: TextStyle(color: Colors.white)),
            ]
        ),
        )
    );
  }
}