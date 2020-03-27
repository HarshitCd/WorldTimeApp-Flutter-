import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //
  String time; //
  String flag; //url to an asset flag icon
  String url; //Location url for api end point
  bool isDay;
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          'http://www.worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //Get dateTime
      String datetime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);
      // print(datetime);
      // print(offsetHour);
      // print(offsetMin);

      //Creating datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      isDay = now.hour >= 6 && now.hour < 20 ? true : false;
      //print(isDay);
      time = DateFormat.jm().format(now); //set time property
    }

    catch (e) {
      time = 'Error';
    }
  }
}

