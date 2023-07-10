import 'package:flutter/material.dart';

import 'constants.dart';
import 'home.dart';
import 'onboardingScreen.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background3,
      body: Container(
        margin: bmargintop,
        padding: bpadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      },
                      icon: Transform.scale(
                        scale: 1.5 ,
                        child: Image.asset('images/wback.png')
                      ),
                      
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoarding()));
                      },
                      icon: Transform.scale(
                        scale: 1.5 ,
                        child: Image.asset('images/VHome.png')
                      ),
                      
                    ),
              ],
            ),
            SizedBox(height: 40,),

            Text('Create a note ...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      
          ],
        ),
      ),
    );
  }
}