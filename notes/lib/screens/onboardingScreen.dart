import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/screens/home.dart';
import 'package:notes/screens/tasks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notes/notification.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SmolleyNotification.initialize(flutterLocalNotificationsPlugin);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background1,
      body: SingleChildScrollView(
        child: Container(
          margin: bmargintop,
          padding:bpadding,
          child: Column(
            children: [
              Image.asset('images/walking.png'),
              SizedBox(height: 20,),
              Center(child: Text('Welcome to my Smolleys toolbox', maxLines: 3, textAlign: TextAlign.center, style: TextStyle(color: greenColor, fontWeight: FontWeight.bold, fontSize: 30),)),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //IconButton(onPressed: onPressed, icon: icon),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    },
                    icon: Transform.scale(
                      scale: 4.0 ,
                      child: Image.asset('images/calendar.png')
                    ),
                    
                  ),
                  //SizedBox(width: 50,),
                  IconButton(
                    onPressed: () {
                      
                    },
                    icon: Transform.scale(
                      scale: 4.0 ,
                      child: Image.asset('images/calculator.png')
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Tasks()));
                    },
                    icon: Transform.scale(
                      scale: 4.8 ,
                      child: Image.asset('images/notes.png')
                    ),
                  ),
                  
                  
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}