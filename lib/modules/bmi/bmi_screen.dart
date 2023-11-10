import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterfirest/modules/bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height=120;
  double weight=60;
  int age=20;


  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            title: Text(
              'Bmi Calculator'
            ),
          ),
          body:Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:(){
                            setState(() {
                              isMale=true;
                            });
                          } ,
                          child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                   10.0
                              ),
                              color:isMale==true? Colors.blue : Colors.grey[400]
                            ),
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Image(
                                      image:AssetImage(
                                        'assets/images/male.png',
                                      ),
                                     height: 90.0,
                                     width: 90.0,
                                  ),
                                  SizedBox(
                                    height:16.0,
                                  ),
                                  Text(
                                      'MALE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0
                                    ),
                                  ),
                                ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                               setState(() {
                                 isMale=false;
                               });
                          },
                          child: Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10.0
                                ),
                                color:isMale==false ?Colors.blue:Colors.grey[400]
                            ),
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children:[
                                Image(
                                  image:AssetImage(
                                    'assets/images/female.png',
                                  ),
                                  height: 90.0,
                                  width: 90.0,
                                ),
                                SizedBox(
                                  height:16.0,
                                ),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal:20.0 ),
                  child: Container(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${height.round()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                'cm',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),
                              ),

                            ],
                          ),
                          Slider(
                              min:120,
                              max:200,
                              value:height,
                              onChanged: (value){
                                setState(() {
                                  height=value;
                                });

                              },

                          ),
                        ],
                      ),
                    ),
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20.0),
                      color: Colors.grey[400],
                    )
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                  children:[
                    Expanded(
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(20.0),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0
                              ),
                            ),
                            Text(
                                '${age}',
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0
                              ),
                              ),
                            Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children:[
                                 FloatingActionButton(
                                   child: Icon(Icons.remove),
                                     onPressed:() {
                                         setState(() {
                                             age--;
                                         });
                                     },
                                   heroTag: 'age--',
                                 mini: true,
                                 ),
                                 FloatingActionButton(
                                   child: Icon(Icons.add),
                                     onPressed:() {
                                        setState(() {
                                             age++;
                                        });
                                     },
                                   heroTag: 'age++',
                                 mini: true,
                                 ),
                               ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(20.0),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0
                              ),
                            ),
                            Text(
                                '${weight.round()}',
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0
                              ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children:[
                                 FloatingActionButton(
                                   child: Icon(Icons.remove),
                                     onPressed:() {
                                          setState(() {
                                               weight--;
                                          });
                                     },
                                     heroTag: 'weight--',
                                 mini: true,
                                 ),
                                 FloatingActionButton(
                                   child: Icon(Icons.add),
                                     onPressed:() {
                                            setState(() {
                                                weight++;
                                            });
                                     },
                                   heroTag: 'weight++',
                                 mini: true,
                                 ),
                               ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
                ),
              Container(
                width:double.infinity ,
                color: Colors.blue,
                height: 60.0,
                child: MaterialButton(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  ),
                  onPressed: () {
                      double result =weight/pow(height/100,2);
                      print('The result is ${result.round()}');
                      Navigator.push(//give you the context and need the route or the destination.
                          context,
                          MaterialPageRoute(
                            builder:(context) =>//it give me the context
                               BmiResultScreen(
                                result:result.round() ,
                                age:age,
                                isMale:isMale
                              ),
                          ),
                      );
                  },
                ),
              ),

            ],
          ) ,
    );
  }


}
