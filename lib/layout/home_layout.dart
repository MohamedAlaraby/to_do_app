import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirest/shared/components/components.dart';
import 'package:flutterfirest/shared/cubit/cubit.dart';
import 'package:flutterfirest/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
class HomeLayout extends StatelessWidget {

  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();
  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(BuildContext context,AppStates state){
             if(state is AppInsertDatabaseState){
               Navigator.pop(context);
               titleController.text="";
               dateController.text="";
               timeController.text="";
             }
        },
        builder:(context,state) {
          AppCubit cubit= AppCubit.get(context);
             return Scaffold(
               key:scaffoldKey,
               appBar: AppBar(
                 title: Text(
                     cubit.titles[cubit.currentIndex]
                 ),
               ),
               bottomNavigationBar: BottomNavigationBar(
                 type:BottomNavigationBarType.fixed ,
                 currentIndex:cubit.currentIndex,
                 onTap: (index){
                   //   //call build function to work with the new value of currentIndex.
                   cubit.changeIndex(index);
                 },
                 items: const [
                   BottomNavigationBarItem(
                       icon: Icon(Icons.task),
                       label: 'tasks'
                   ),
                   BottomNavigationBarItem(
                       icon: Icon(Icons.done),
                       label:'done'
                   ),
                   BottomNavigationBarItem(
                       icon: Icon(Icons.archive),
                       label:'archived'
                   ),
                 ],

               ),
               body:ConditionalBuilder(
                 condition:state is!  AppGetDatabaseLoadingState,
                 builder :(context)  => cubit.screens[cubit.currentIndex],
                 fallback:(context)  =>  const Center(child: CircularProgressIndicator()),
               ),
               floatingActionButton: FloatingActionButton(
                 onPressed: () async
                 {
                   if(cubit.isBottomSheetShown){
                     if(formKey.currentState!.validate()){

                       cubit.insertToDatabase(
                         title:titleController.text,
                         date: dateController.text,
                         time: timeController.text,
                       );
                     }
                   }else{
                     scaffoldKey.currentState?.showBottomSheet((context) =>
                         Container(
                           padding: const EdgeInsets.all(20.0),
                           color: Colors.white,
                           child: Form(
                             key: formKey,
                             child: Column(
                               mainAxisSize:MainAxisSize.min ,
                               children: [
                                 defaultFormField(
                                     controller: titleController,
                                     textInputType:TextInputType.text,
                                     validator:(String? value)//the value that you have been written in the text filed
                                     {
                                       if(value!.isEmpty){
                                         return 'Sorry the title can not be null!!!!!!';
                                       }
                                       return null;
                                     },
                                     label: 'Task title',
                                     prefix: Icons.title,
                                     onTap: (){
                                       print('tapped');
                                     }
                                 ),
                                 const SizedBox(
                                   height: 16.0,
                                 ),
                                 defaultFormField(
                                     controller: timeController,
                                     textInputType:TextInputType.datetime,
                                     validator:(String? value)//the value that you have been written in the text filed
                                     {
                                       if(value!.isEmpty){
                                         return 'Sorry the time can not be null!!!!!!';
                                       }
                                       return null;
                                     },
                                     label: 'Task time',
                                     prefix: Icons.watch_later_outlined,
                                     onTap: (){
                                       showTimePicker(
                                           context: context,
                                           initialTime: TimeOfDay.now()
                                       ).then((value) {
                                         var time=value?.format(context).toString();
                                         timeController.text=time!;
                                       }
                                       );
                                     }
                                 ),
                                 const SizedBox(
                                   height: 16.0,
                                 ),
                                 defaultFormField(
                                     controller: dateController,
                                     textInputType:TextInputType.datetime,
                                     validator:(String? value)//the value that you have been written in the text filed
                                     {
                                       if(value!.isEmpty){
                                         return 'Sorry the date can not be null!!!!!!';
                                       }
                                       return null;
                                     },
                                     label: 'Task date',
                                     prefix: Icons.calendar_today,
                                     onTap: (){
                                       showDatePicker(
                                         context: context,
                                         initialDate:DateTime.now(),
                                         firstDate: DateTime.now(),
                                         lastDate: DateTime.parse("2024-01-01"),

                                       ).then((value) {
                                         dateController.text= DateFormat.yMMMd().format(value!);

                                       }
                                       );

                                     }
                                 ),
                               ],
                             ),
                           ),
                         ),
                         elevation: 20.0,

                     ).closed.then((value) //this method called when the bottom sheet closed manually ny your hand.
                     {
                       cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                     }
                     );//showBottomSheet()
                     cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                   }//else
                 },//end of onPressed Function
                 child: Icon(
                     cubit.iconData
                 ),
               ),
             );
        }
      ),
    );
  }//build function
}//HomeLayout
















