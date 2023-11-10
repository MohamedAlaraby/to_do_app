import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirest/modules/archived_tasks/archived_screen.dart';
import 'package:flutterfirest/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutterfirest/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutterfirest/shared/components/constants.dart';
import 'package:flutterfirest/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit():super(AppInitialState());
  static AppCubit get(BuildContext context) =>BlocProvider.of(context);
  //Here are the variables that i want to listen on them.
  int currentIndex=0;
  Database? database;
  List<Widget> screens = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchivedScreen(),
  ];
  List<String> titles=[
    'New Task',
    'Done Tasks',
    'Archived Tasks'
  ];
  List<Map> newTasks=[];
  List<Map> doneTasks=[];
  List<Map> archivedTasks=[];
  bool isBottomSheetShown=false;
  var iconData=Icons.edit;
  void changeIndex(index){
    currentIndex=index;
    emit(AppChangeBottomNavBarState());
  }


  void createDatabase()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database,version){
        database.execute(
            'CREATE TABLE tasks(id integer primary key ,title text ,date text,time text,status text)'
        )
            .then( (value){
                print('El-araby database created');
            })//then
            .catchError( (onError){
        print('El-araby error when creating database!!!!');
        });//catchError.
      },//on Create()
      onOpen: (database){
         print('database opened');
         getDataFromDatabase(database);
      },
     ).then((value) {
       database=value;
       emit(AppCreateDatabaseState());
     }
      );//open database
  }
  void insertToDatabase(
  {
    required String title,
    required String time,
    required String date,
  }) async{

     await database!.transaction((txn) {
      txn.rawInsert(
          'insert into tasks (title,date,time,status) values ("$title","$date","$time","new")'
      ).then((value){//here the value is the id of the raw starting from 1 .
        print('new item  added successfully');

        getDataFromDatabase(database!);
        emit(AppInsertDatabaseState());

       }).catchError((error){
        print('El-araby:error when inserting a raw in the database $error!!!!');
      });
      return Future(() => null);
    }
    );

  }
  void getDataFromDatabase(Database database)async{
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('select * from tasks')
        .then((value) {
        value.forEach((element) {
          if(element['status']=='new'){
              newTasks.add(element);
          }
          else if(element['status']=='done'){
            doneTasks.add(element);
          }
          else{
            archivedTasks.add(element);
          }
          print(element);
        });
        emit(AppGetDatabaseState());
        })
        .catchError((error){
          print('error when getting the data from database!!!!!');
        });
  }
  void changeBottomSheetState({required bool isShow,required IconData icon}){
         isBottomSheetShown=isShow;
         iconData=icon;
         emit(AppChangeBottomSheetState());
  }
  void updateDatabase({
      required String status,required int id
  }) async{
      database!.rawUpdate(
          'update tasks set status=? where id=?',['$status',id]
      )
      .then((value) {
            getDataFromDatabase(database!);
            emit(AppUpdateDatabaseState());
      })
      .catchError((error){
        print('error when updating the database');
      })
     ;
  }
  void deleteRowFromDatabase({required int id}){
         database!.rawDelete('delete from tasks where id=?',[id])
             .then((value) {
               print('item deleted successfully');
               getDataFromDatabase(database!);
               emit(AppDeleteDatabaseState());

             })
             .catchError((error){
           print('error when updating the database');
         });
  }
}

