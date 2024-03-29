import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Map? data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    // set background
    String bgImage = data?['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data?['isDaytime'] ? Colors.blue : Colors.indigo[700] ??Colors.grey;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding( 
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                 children: <Widget>[
                  TextButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    icon:const Icon(Icons.edit_location),
                    label:const Text('Edit Location'),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data?['location'],
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data?['time'],
                    style: const TextStyle(
                          fontSize: 66.0,
                     )
                  )
                ],
              
              ),
            
          ),
        )
        ), 
    );
  }
}