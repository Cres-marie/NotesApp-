import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/screens/onboardingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     final textTheme = Theme.of(context).textTheme;
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      //home: Home(),
      theme: ThemeData(
        //scaffoldBackgroundColor: backgroundColor,
        //   fontFamily: GoogleFonts.Bubblegum Sans().fontFamily,
        textTheme: GoogleFonts.bubblegumSansTextTheme(textTheme),
      ),

      home: OnBoarding(),

    );
  }
}