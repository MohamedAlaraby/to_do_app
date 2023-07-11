import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final int result;
  final int age;
  final bool isMale ;

  BmiResultScreen({
    required this.result,
    required this.age,
    required this.isMale
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Result'),
        leading:IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GENDER : ${isMale?'MALE':'FEMALE'}',
              style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:25.0
              ),
        ),
            Text(
            'RESULT : ${result}',
            style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:25.0
            ),
          ),
            Text(
              'AGE :${age}',
              style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:25.0
              ),
            ),
          ],
          ),
      ),
    );
  }
}
