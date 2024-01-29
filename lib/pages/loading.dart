import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'New York', flag: 'us.png', url: 'America/New_York');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}