import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';
import 'home.dart';
import 'onboardingScreen.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: bcalendar,
      body: Column(
        children: [
          Container(
            height: 600,
              decoration: const BoxDecoration(
                color: calendar,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
                )
              ),
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
                              child: Image.asset('images/bwhite.png')
                            ),
                            
                          ),
          
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoarding()));
                            },
                            icon: Transform.scale(
                              scale: 1.5 ,
                              child: Image.asset('images/DHome.png')
                            ),
                            
                          ),
                    ],
                  ),
                  SizedBox(height: 40,),
          
                  TableCalendar(
                        calendarStyle: CalendarStyle(
                          defaultTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                          defaultDecoration:  BoxDecoration(
                            
                           
                          ),
                          weekendDecoration: BoxDecoration(      
                          ),
                          todayDecoration: BoxDecoration(
                             shape: BoxShape.circle,
                            color:  Color.fromARGB(255, 148, 61, 7),
                            
                          ) ,
                          selectedDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 233, 148, 95),
                            
                          ),
                          
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: true,
                          titleCentered: true,
                          formatButtonDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 148, 95),
                            borderRadius: BorderRadius.circular(10)
                          ),
      
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
        
                        ),
      
                        weekdayStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
        
                        ),
                      ),
      
      
                        currentDay: DateTime.now(),
                        firstDay: DateTime.now(),
                        lastDay: DateTime.utc(2230, 3, 14),
                        focusedDay:  DateTime.now(),
                        headerVisible: true,
                        daysOfWeekVisible: true,
                        //eventLoader: _getEventsfromDay,
                        
                        availableCalendarFormats: {
                          CalendarFormat.month: 'Month',
                          //CalendarFormat.week: 'Week',
                        },
                        // selectedDayPredicate: (day) {
                            
                        //   return isSameDay(_selectedDay, day);
                        // },
                      //   onDaySelected: (selectedDay, focusedDay) {
                      //     if (!isSameDay(_selectedDay, selectedDay)){
                      //       // Call `setState()` when updating the selected day
                      //       setState(() {
                      //       _selectedDay = selectedDay;
                      //      _focusedDay = focusedDay; // update `_focusedDay` here as well
                      //     });
                         
                      //     }
                      //  },
                        // calendarFormat: _calendarFormat,
                        //   onFormatChanged: (format) {
                        //     if (_calendarFormat != format) {
                        //      // Call `setState()` when updating calendar format 
                        //       setState(() {
                        //       _calendarFormat = format;
                        //       });
                        //     };
                        //   },
                              
                          // onPageChanged: (focusedDay) {
                          // // No need to call `setState()` here
                          //   _focusedDay = focusedDay;
                          // },
                              
                          
                        //availableGestures: AvailableGestures.none,
                        //CalendarFormat.month : 'Month',
                      ),
                   // ),
      
                ],
              ),
            ),
          ),
        ],
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