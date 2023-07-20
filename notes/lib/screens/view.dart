import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/constants.dart';
import 'package:notes/options.dart';
import 'package:notes/screens/createNote.dart';
import 'package:notes/screens/onboardingScreen.dart';
import 'package:notes/sqlite.dart';

import 'home.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
       final mysql = sqlite();
     final options = Options();
     List<Map<String,dynamic>> notes=[];
    Future<void> getdata() async{
    List<Map<String, dynamic>> mynotes = await mysql.getdata();
    setState(() {
      notes = mynotes;

    });
  }


  @override
  void initState() {
    super.initState();
    getdata();
  }
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
            Expanded(
                child: GridView.builder(
                 itemCount: notes.length, 
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                 itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                 onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNote(note: notes[index]),));
                 },
                 onLongPress: (){
                    HapticFeedback.mediumImpact();
                    options.deletenotemessage(context,notes[index]['_id']);
                 },
                 child: Container(
                  margin: EdgeInsets.symmetric( horizontal: 2, vertical: 5),
                  //constraints: BoxConstraints.tightFor(height: double.infinity),
                  
                  decoration: BoxDecoration(
                   color: cardColors[index % cardColors.length],
                   borderRadius: BorderRadius.circular(10)),
                   width: 150,
                   height: 130,
                  child: Padding(
                     padding: EdgeInsets.all(8),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           '${notes[index]['Title'][0].toUpperCase()}${notes[index]['Title'].substring(1)}',
                           overflow: TextOverflow.ellipsis,
                           style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,),
                         ),
                         Divider(height: 10, thickness:2 ,),
                         SizedBox(height: 12),
                         Expanded(
                           child: Text(
                              notes[index]['notes'],
                               //maxLines: 3,
                               overflow: TextOverflow.ellipsis,
                             style: TextStyle(color: const Color.fromARGB(255, 59, 43, 43),fontSize: 16,letterSpacing: 0.5, height: 1.2,),
                           ),
                         ),
                         SizedBox(height: 10),
                         
                         Text(
                           notes[index]['time'].toString(),
                           style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 36, 35, 35),letterSpacing: 0.5,),
                         ),
                       ],
                     ),
                   ),
                   ),
                    );
                 }
                 ),
              )
      
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