import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirest/modules/counter/cubit/cubit.dart';

import 'cubit/states.dart';

class CounterScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CubitStates>(
         listener:(BuildContext context,CubitStates state){
            if(state is CounterMinusState){
              print('the current value of the counter is ${state.CounterValue}');
            }
            if(state is CounterPlusState){
              print('the current value of the counter is ${state.counterValue}');
            }
         } ,
        builder: (context,state)=> Scaffold(
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
                      CounterCubit.get(context).minus();
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
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0
                    ),
                  ),
                ),
                TextButton(
                    onPressed: (){
                      CounterCubit.get(context).plus();
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
        ),//the builder will rebuild depending on the state
      ),
    );
  }
}
