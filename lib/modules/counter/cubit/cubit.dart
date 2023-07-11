import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirest/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CubitStates> {
  int counter = 1;

  CounterCubit() : super(CounterInitialState());

  //to be more easily when using this counter cubit in many places.
  static CounterCubit get(BuildContext context) => BlocProvider.of(context);

  void minus() {
    counter--;
    emit(CounterMinusState(counter));
  }

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }
}
