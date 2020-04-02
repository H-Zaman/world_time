import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/word_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(location: 'America US-ET',url: 'America/New_York',flag: 'us.png'),
    WorldTime(location: 'UTC',url: 'Etc/UTC',flag: 'utc.png'),

  ];

  void updateTime(index) async{

    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    //navigate to home
    Navigator.pop(context, {
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDaytime' : worldTime.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[500],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
            child: (
              Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('pic/${locations[index].flag}'),
                  ),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
