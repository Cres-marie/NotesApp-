import 'package:flutter/material.dart';
import 'package:notes/createNote.dart';
import 'package:notes/onboardingScreen.dart';

import 'constants.dart';
import 'view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background2,
      body: Container(
        margin: bmargintop,
        padding: bpadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset('images/emoji.png'),
                SizedBox(width: 10,),
                Expanded(child: Text('Hello,', style: TextStyle(fontSize: 20),)),
                IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoarding()));
                      },
                      icon: Transform.scale(
                        scale: 1.5 ,
                        child: Image.asset('images/HHome.png')
                      ),
                      
                    ),

              ],
            ),

            SizedBox(height: 40,),

            Container(
          
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
          
                child: TextField(
                      //controller: search,
                      onChanged: (value){
                        //Searchevent(value);
                      },
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: 'Search for note',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          //fillColor: biconcolor,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),    
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            //borderSide: BorderSide(color: Color.fromARGB(255, 14, 147, 19)),
                          ),
                    
                        ),
                    ),
              ),

              SizedBox(height: 50,),

              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  //IconButton(onPressed: onPressed, icon: icon),
                  Text('My Notes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                  //SizedBox(width: 50,),
                  IconButton(
                    onPressed: () {
                      
                    },
                    icon: Transform.scale(
                      scale: 1.0 ,
                      child: Image.asset('images/edit.png')
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewScreen()));
                    },
                    child: Text('View all', style: TextStyle(fontSize: 15), )
                  ),
                  
                  
                  
                ],
              )

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNote()));
        },
        
        backgroundColor: Colors.black,
        
        child: const Icon(Icons.add),
        //child: Text('Create Invoice'),
      ),
    );
  }
}