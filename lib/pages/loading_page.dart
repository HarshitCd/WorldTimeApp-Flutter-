import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    //print(instance.isDay);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance. time,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SpinKitDualRing(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
