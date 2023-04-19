import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget
{
  CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var counter =1;
  //1-constructor
  //2-initState function
  //3-build function
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter'
        ),
      ),
      body: Center(
        child: Row(
          mainAxisSize:MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            TextButton(
                onPressed:(){
                     setState(() {//this function will call the build function to display the new state.
                       counter--;
                       print(counter);
                     });
                },
                child: Text(
                  'MINUS',
                  style: TextStyle(
                      fontSize: 25.0
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '$counter',
                style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 40.0
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  setState(() {
                    counter++;
                    print(counter);
                  });

                },
                child: Text(
                    'PLUS',
                  style: TextStyle(
                      fontSize: 25.0
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
