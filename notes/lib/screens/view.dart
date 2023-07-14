import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/screens/onboardingScreen.dart';

import 'home.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background2,
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

            Text('All My Notes ...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:() {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNote()));
        },
        
        backgroundColor: Colors.black,
        
        child: Image.asset('images/editting.png'),
        //child: Text('Create Invoice'),
      ),

    );
  }
}