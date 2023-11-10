import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirest/modules/bmi/bmi_screen.dart';
import 'package:flutterfirest/modules/counter/counter_screen.dart';
import 'package:flutterfirest/modules/login/login_screen.dart';

import 'layout/home_layout.dart';
import 'modules/bmi_result/bmi_result_screen.dart';
import 'shared/bloc_observer.dart';
void main() {
  Bloc.observer =  MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp
      (
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
     );
  }


}

