import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _anim = "spin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_anim == "spin")
                _anim = "spin_reverse";
              else
                _anim = "spin";
            });
          },
          child: Container(
            width: 150,
            height: 150,
            child: FlareActor("assets/AnimGears.flr", animation: _anim),
          ),
        ),
      ),
    );
  }
}
