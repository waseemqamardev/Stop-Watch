import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    bool isTimerRunning = false;

  var timer;

  @override
  void initState() {
    
    super.initState();
  timer = Provider.of<TimerProvider>(context, listen: false   );
  }
  @override
  Widget build(BuildContext context) {
    print(' rebuilt');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff097179),
        appBar: AppBar(
      
      backgroundColor: Color(0xff68ff00),          centerTitle: true,
            title: Text(
              " STOP WATCH ",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2),
            )),
        body: Column(
          children: [
            SizedBox(height: 20,),
            
      
      
          Center(
            child: Column(
              children: [
              
                Consumer<TimerProvider>(
                  builder: (context, value, child) {
                    return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                               
                            Consumer<TimerProvider>(builder: (context, value, child) {
                          return Text(value.hour.toString().padLeft(2, '0')+":"+value.minute.toString().padLeft(2, '0')+":"+value.seconds.toString().padLeft(2, '0')+":"+value.milliseconds.toString().padLeft(2, '0'),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink
                          ));
      
                        },),
                          
                        
             
          
                          
                          ],
                        ),
                        height: 250,
                        alignment: Alignment.center,
                        
                        decoration: BoxDecoration(
                          image:DecorationImage(
                             image: AssetImage( 'lib/images/a.JPG',),
                              fit:  BoxFit.fill,
                            
                          ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            )));
                  },
                ),
                SizedBox(
                  height: 50,
                ),
            Column(
             
              children: [
                    GestureDetector(
                  onTap: () {
                    
                    setState(() {
                                if (isTimerRunning) {
                timer.stopTimer();
                                } else {
                timer.continueTimer();
                                }
                                isTimerRunning = !isTimerRunning;
                              });
                
                    },
                  child: Container(
                    child: Center(
                      child: Text(
                                         isTimerRunning ? "Pause" : "Continue", // Update button text based on timer state
                
                        style: TextStyle(fontSize: 25, letterSpacing: 1),
                      ),
                    ),
                    width: 125,
                    height: 60,
                    decoration: BoxDecoration(
                      // border: Border.all(width: 2,color: Colors.red,),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40), bottom: Radius.circular(10)),
                      color: Colors.blueGrey,
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightGreenAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          offset: Offset(10, 20),
                          blurRadius: 40,
                        )
                      ],
                    ),
                  ),
                ),
             SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    timer.stopTimer();
                    timer.startTimer();
      
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Restart",
                        style: TextStyle(fontSize: 25, letterSpacing: 1),
                      ),
                    ),
                    width: 125,
                    height: 60,
                    decoration: BoxDecoration(
      
                      color: Colors.blueGrey,
                      gradient: LinearGradient(
                          colors: [Colors.lightGreen, Colors.lightGreenAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(20),
                        bottomLeft:Radius.circular(30),
                        bottomRight:Radius.circular(40),),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightGreen,
                          offset: Offset(10, 20),
                          blurRadius: 40,
                        )
                      ],
                    ),
                  ),
                ),
                 SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    timer.startTimer();
                    timer.stopTimer();
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        " Reset",
                        style: TextStyle(fontSize: 25, letterSpacing: 2),
                      ),
                    ),
                    width: 125,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      gradient: LinearGradient(
                          colors: [Colors.redAccent, Colors.redAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40), bottom: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(10, 20),
                          blurRadius: 40,
                        )
                      ],
                    ),
                  ),
                ),
            
              ],
            )
              ],
            ),
          ),
      
        ],
      
        ),
      ),
    );
  }
}
