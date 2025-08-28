

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final TextEditingController _inputTEController=TextEditingController();

  String fromUnit="Meter";
  String toUnit="Centimeter";
  double result=0.00;

  Map<String,double> unitsValue={
    'Meter': 1.0,                // base unit (all units values bases on the base unit)
    'Millimeter': 1000.0,        // 1 meter = 1000 mm
    'Centimeter': 100.0,         // 1 meter = 100 cm
    'Kilometer': 0.001,          // 1 meter = 0.001 km
    'Inch': 39.3701,             // 1 meter = 39.3701 in
    'Feet': 3.28084,             // 1 meter = 3.28084 ft
    'Yard': 1.09361,             // 1 meter = 1.09361 yd
    'Mile': 0.000621371,         // 1 meter = 0.000621371 mi
    'Nautical Mile': 0.000539957 // 1 meter = 0.000539957 nmi
  };




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
       backgroundColor: Color(0xFF1d2332),
      appBar: AppBar(
        title: Text("MeasureMe",style: TextStyle(color: Colors.white,fontSize: 22),),
        backgroundColor:Color(0xFF2C354B),
        elevation: 4,
        centerTitle: true,

      ),


      body: Column(

        children: [

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20,vertical:20),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Center(child: Text("Unit Converter",style: TextTheme.of(context).titleLarge,)),
                    const SizedBox(height: 5,),
                    Center(child: Text("convert length units with ease",style: TextStyle(fontSize:15,color: Colors.grey,fontWeight: FontWeight.w500))),
                    const SizedBox(height: 25,),

                    Text("Value to convert ",style: TextTheme.of(context).titleMedium,),

                    const SizedBox(height: 8,),

                    /// input part
                    TextField(
                      controller: _inputTEController,
                      keyboardType:TextInputType.number,

                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                      decoration: InputDecoration(

                          fillColor: Color(0xFF2C354B),
                          filled: true,
                          hintText: "Enter value",

                          hintStyle: TextTheme.of(context).titleMedium!.copyWith(fontSize: 15),

                          enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1
                            ),

                          ),

                          focusedBorder: OutlineInputBorder(

                              borderRadius:  BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2
                              )

                          )


                      ),

                    ),

                    const SizedBox(height: 25,),


                    /// set input unit part
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [


                        /// first dropdown button  with header title
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing:8,
                          children: [

                            Text("From",style: TextTheme.of(context).titleMedium,),

                            ///  dropdown button
                            Container(
                              decoration: BoxDecoration(

                                  border: Border.all(

                                      color: Colors.white

                                  ),
                                  borderRadius: BorderRadius.circular(6)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.only(left:5),
                                child: DropdownButton(
                                    underline: SizedBox(),
                                    value: fromUnit,
                                    dropdownColor: Colors.white,
                                    items: unitsValue.keys.map((unit){

                                      return DropdownMenuItem(

                                          value: unit,
                                          child: unit==fromUnit ?Container(

                                            decoration: BoxDecoration(
                                                color: Color(0xFF2C354B)
                                            ),
                                            child: Text(unit,style: TextStyle(color: Colors.white),),
                                          )
                                              : Text(unit,style: TextStyle(color: Color(0xFF2C354B)),)
                                      );

                                    }).toList(),
                                    onChanged: (String ?  newValue){
                                      setState(() {
                                        fromUnit=newValue!;
                                      });
                                    }
                                ),
                              ),
                            ),
                          ],
                        ),


                        /// arrow part
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(Icons.arrow_forward,color: Colors.white,),
                            Icon(Icons.arrow_back,color: Colors.white,),

                          ],
                        ),



                        /// second  dropdown button with header titile

                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("To",style: TextTheme.of(context).titleMedium,),

                            ///dropdown button
                            Container(
                              decoration: BoxDecoration(

                                  border: Border.all(

                                      color: Colors.white

                                  ),
                                  borderRadius: BorderRadius.circular(6)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.only(left:6),
                                child: DropdownButton(
                                    underline: SizedBox(),
                                    value: toUnit,
                                    dropdownColor: Colors.white,
                                    items: unitsValue.keys.map((unit){

                                      return DropdownMenuItem(
                                          value: unit,
                                          child: unit==toUnit ?Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xFF2C354B)
                                            ),
                                            child: Text(unit,style: TextStyle(color: Colors.white),),
                                          )
                                              : Text(unit,style: TextStyle(color: Color(0xFF2C354B)),)
                                      );

                                    }).toList(),
                                    onChanged: (String ?  newValue){
                                      setState(() {
                                        toUnit=newValue!;
                                      });
                                    }
                                ),
                              ),
                            )

                          ],
                        )







                      ],




                    ),


                    const SizedBox(height: 20,),



                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: _unitCalculate,

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF2C354B),
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)
                            )

                        ),

                        child: Text("Convert",style: TextTheme.of(context).titleMedium!.copyWith(color:
                        Color(0xFF2C354B)),
                        ),

                      ),
                    )








                  ],

                ),
              ),
            ),
          ),




          /// output part


          Container(

            width: double.maxFinite,
             height: MediaQuery.of(context).size.height * 0.2,
           // height:MediaQuery.of(context).size.height *  0.15,
            decoration: BoxDecoration(
              color:Color(0x661e3a8a).withOpacity(0.6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),
              border: Border.all(
                color: Color(0xFF1e40af),
                width: 3
              )
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Converted Result ",style: TextTheme.of(context).titleSmall!.copyWith(color: Color(0xFF93c5fd),fontSize: 13)),
                const SizedBox(height: 4,),
                Text("${result.toStringAsFixed(7)} $toUnit",style: TextTheme.of(context).titleLarge!.copyWith(color: Color(0xFFbfdbfe),fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis)),


              ],
            ),



          )



        ],


      ),



    );



  }

  // Unit convert calculation


  void _unitCalculate(){

    String stringInput=_inputTEController.text;

    double ? input=double.tryParse(stringInput) ?? 0 ;


    setState(() {
      result= input / unitsValue[fromUnit] ! * unitsValue[toUnit]!;
    });







  }





}
