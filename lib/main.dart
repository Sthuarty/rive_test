import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:rive_test/stateful_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () {
          initState(context);
        },
        child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Flutter + Rive",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center),
                Container(
                  width: 100,
                  height: 100,
                  child: FlareActor("assets/AnimHeart.flr", animation: "pulse"),
                )
              ]),
        ));
  }

  void initState(_context) {
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(_context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    });
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
