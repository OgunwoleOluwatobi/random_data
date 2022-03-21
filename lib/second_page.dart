import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final List<String> names = ['Tobi', 'Paul', 'Mayowa'];

  SecondPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Data'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: 10,
        itemBuilder: (context, index) {
          // final String name = names[index];

          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            title: Text(
              '$index'
            ),
          );
        },
      ),
    );
  }
}