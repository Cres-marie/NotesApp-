import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/screens/createNote.dart';
import 'package:notes/screens/onboardingScreen.dart';
import 'package:notes/options.dart';
import 'package:notes/sqlite.dart';
import '../constants.dart';
import 'view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
     final mysql = sqlite();
     final options = Options();
     List<Map<String,dynamic>> notes=[];
    Future<void> getdata() async{
    List<Map<String, dynamic>> mynotes = await mysql.getdata();
    setState(() {
      notes = mynotes.take(6).toList();

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
              ),
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
                             style: TextStyle(color: Colors.black,fontSize: 16,letterSpacing: 0.5, height: 1.2,),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNote(note: {},)));
        },
        
        backgroundColor: Colors.black,
        
        child: const Icon(Icons.add),
        //child: Text('Create Invoice'),
      ),
    );
  }
}