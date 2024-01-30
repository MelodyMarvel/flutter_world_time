import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'New York', flag: 'us.png', url: 'America/New_York');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    }); 
  }

  // this fires once when we first load up the state object
  @override
  void initState(){
    super.initState();//run the original function in the init state first
    setupWorldTime(); // then our extra code here
  }

  //while this first everytime we need to build up the widget tree
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center( 
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
),
)
);
  }
}