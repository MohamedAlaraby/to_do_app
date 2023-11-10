import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirest/shared/components/components.dart';
import 'package:flutterfirest/shared/cubit/cubit.dart';
import 'package:flutterfirest/shared/cubit/states.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(BuildContext context,AppStates state){},
      builder: (BuildContext context,AppStates state)=>
        tasksBuilder(tasks: AppCubit.get(context).archivedTasks),
    );
  }
}
