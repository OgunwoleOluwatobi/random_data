import 'package:flutter/material.dart';
import 'package:random_data/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage())),
          child: Text(
            'Navigate'
          )
        ),
      ),
    );
  }
}