import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetupWorldtime() async {
    WorldTime worldTime = WorldTime(
        location: 'Bangladesh',
        flag: 'bd.png',
        url: 'Asia/Dhaka');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDaytime' : worldTime.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    SetupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Loading..',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 3,
              color: Colors.grey[700],
            ),
          ),
          SpinKitThreeBounce(
            size: 80,
            color: Colors.blueGrey[800],
          )
        ],
      ),
    );
  }
}
