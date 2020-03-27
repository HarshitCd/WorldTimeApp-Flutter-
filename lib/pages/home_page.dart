import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
Map data = {};
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    //print(data['isDay']);
    String flag = data['flag'];
    String bgimg = data['isDay'] ? 'day.png' : 'night.png';
    return Scaffold(
      //backgroundColor: data['isDay'] ? Colors.lightBlue[300] : Colors.blue[800],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/$bgimg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 135.0, 0, 0),
          child: Column(
            children: <Widget>[
                FlatButton.icon (
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'location': result['location'],
                          'flag': result['flag'],
                          'time': result['time'],
                          'isDay': result['isDay'],
                        };
                      });
                    }
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Change Location'),
                  color: Colors.blueGrey[200],
                ),
              SizedBox(height: 40,),
              CircleAvatar(
                backgroundImage: AssetImage('asset/$flag'),
                radius: 40.0,

              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location']+ ":",
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 30,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w400,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
