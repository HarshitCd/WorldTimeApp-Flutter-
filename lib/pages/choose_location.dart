import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLoc extends StatefulWidget {
  @override
  _ChooseLocState createState() => _ChooseLocState();
}

class _ChooseLocState extends State<ChooseLoc> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata'),
  ];

  Future <void> updateTime(index) async{
    await locations[index].getTime();
    Navigator.pop(context, {
      'location': locations[index].location,
      'flag': locations[index].flag,
      'time': locations[index]. time,
      'isDay': locations[index].isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Change Location',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap:  () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('asset/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
