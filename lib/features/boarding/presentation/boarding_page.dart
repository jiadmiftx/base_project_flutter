import 'package:flutter/material.dart';


class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton( 
        onPressed: (){
          // context.r
        },
        child: Text("next"),)),
    );
  }
}