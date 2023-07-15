import 'package:flutter/material.dart';
import 'package:notes/sqlite.dart';

import '../constants.dart';
import 'home.dart';
import 'onboardingScreen.dart';

class CreateNote extends StatefulWidget {
  final Map note;
   CreateNote({super.key, required this.note});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final mysqlite = sqlite();
  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.note.isNotEmpty){
    title = TextEditingController(text:widget.note['Title']);
    body = TextEditingController(text: widget.note['notes']);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background3,
      body: SingleChildScrollView(
        child: Container(
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
      
              SizedBox(height: 40,),
      
              Container(
                    width: MediaQuery.of(context).size.width / 1.0,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: note1
                    ),
                
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          TextFormField(
                              //initialValue: 'Note Title',  
                              controller: title,
                              style: TextStyle( fontSize: 20),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Note Title',
                                hintStyle: TextStyle( fontSize: 20),
                                border: InputBorder.none,
                                prefixIcon: Image.asset('images/editting.png',color: Colors.black,)
                              ),
                              validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the title';
                                  }
                                  return null;
                                },
                            ),
                          
                          Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                            ),
      
                            child: TextFormField(
                              controller: body,
                              //initialValue: 'Note Title',  
                              //keyboardType: TextInputType.multiline,
                              maxLines: null,
                              //textInputAction: TextInputAction.next,
                              //textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                hintText: 'Type to Continue ...',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),  // Add spacing or padding here
                                
                              ),
                              validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter notes';
                                  }
                                  return null;
                                },
                            ),
                          )
      
                        ],
                      )
                    
                    ),
                  ),
                
              SizedBox(height: 40,),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                        }, 
                        icon: Transform.scale(
                          scale: 1.5 ,
                          child: Image.asset('images/dontsave.png')
                        ),
                      ),
                      Text('Dont save')
                    ],
                  ),
      
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            if(widget.note.isEmpty){
                               final id = await mysqlite.insertdata(title.text, body.text);
                            if(id>0){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            }
                            }
                            else{
                              await mysqlite.update(widget.note['_id'], title.text, body.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            }
                           
                          }
                        }, 
                        icon: Transform.scale(
                          scale: 1.5 ,
                          child: Image.asset('images/save.png')
                        ),
                      ),
                      Text('Save')
                    ],
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