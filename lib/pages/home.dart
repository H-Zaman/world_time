import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//    print (data);

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.orange[200] : Colors.blue[500];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('pic/$bgImage'),
                fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Column(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'location' : result['location'],
                            'isDaytime' : result['isDaytime'],
                            'flag' : result['flag'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 2,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
    );
  }
}