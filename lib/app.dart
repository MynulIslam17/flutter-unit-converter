
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/ui/screens/home_screen.dart';

class UnitConverter extends StatelessWidget{
  const UnitConverter({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
       theme: ThemeData(

         textTheme: TextTheme(

           titleLarge: TextStyle(
             fontSize: 34,
             fontWeight: FontWeight.bold,
             color: Colors.white
           ),

           titleSmall: TextStyle(

             fontSize: 11,
             fontWeight:FontWeight.w500,
            // color:Colors.grey
               color: Color(0xFF5a616e)
           ),

             titleMedium: TextStyle(

             fontSize:14,
             fontWeight:FontWeight.w500,
            // color:Colors.grey
               color: Color(0xFFd1d5db)
           )


         )


       ),
      home:HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }


}