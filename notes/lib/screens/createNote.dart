import 'package:flutter/material.dart';

import '../constants.dart';
import 'home.dart';
import 'onboardingScreen.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final _formKey = GlobalKey<FormState>();

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
                        children: [
                          
                          TextFormField(
                              //initialValue: 'Note Title',  
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Note Title',
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
                              //initialValue: 'Note Title',  
                              //keyboardType: TextInputType.multiline,
                              maxLines: null,
                              //textInputAction: TextInputAction.next,
                              //textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                hintText: 'Type to Continue ...',
                                border: InputBorder.none,
                                
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
                        onPressed: (){}, 
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
                        onPressed: (){}, 
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