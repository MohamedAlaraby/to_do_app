import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirest/shared/cubit/cubit.dart';

import '../cubit/states.dart';

Widget defaultButton({
   double width=double.infinity,
   Color backgroundColor=Colors.lightBlue,
  //null safety::
  // A Function can be anything, like Function(), Function(int), etc,
  // which is why with Dart null safety, you should explicitly tell what that Function is
  //you can replace the void Function() by VoidCallback
  required final void Function() function,
  required String text,
  double radius=5.0
})=>  Container(
  width: width,

  child: Container(
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:BorderRadius.circular(radius)
    ),
    child: MaterialButton(
      onPressed : function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ),
);

Widget defaultFormField({
   required  TextEditingController controller,
   required  TextInputType textInputType,
   required  String? Function(String? string)? validator,
   required  String label,
   required  IconData  prefix,
             IconButton? suffix,
   Function(String string)? onFieldSubmitted,
   Function(String string)? onChange,
   Function()? onTap,
   bool isClickable=true,
   bool isPassword=false,

})=>TextFormField(
  validator:validator,
  controller: controller,
  obscureText: isPassword,
  decoration: InputDecoration(
    labelText:label ,
    prefixIcon:  Icon(prefix) ,
    suffixIcon:  suffix != null ? suffix :null,
    border: OutlineInputBorder(),
  ),
  keyboardType:textInputType,
  onFieldSubmitted:onFieldSubmitted,
  onChanged:onChange,
  onTap: onTap,
  enabled: isClickable,
);

Widget buildTaskItem (Map model,BuildContext context) {
  return Dismissible(
    
    key:Key(model['id'].toString()),
    onDismissed:(direction){
          AppCubit.get(context).deleteRowFromDatabase(id: model['id']);
    } ,
    child: Padding(
    padding: const EdgeInsetsDirectional.only(
        start: 20.0,end: 20.0,top: 10.0,bottom: 10
    ),
    child:Row(
      children:[
        CircleAvatar (
          radius: 40.0,
          child: Text(
              '${model["time"]}'
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                '${model["title"]}',
                 style:TextStyle(
                    fontSize:20.0,
                    fontWeight: FontWeight.bold,

                ),
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text (
                '${model["date"]}',
                style:TextStyle(
                  fontSize:16.0,
                  color: Colors.grey,
                ),

              ),
            ],
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        IconButton(
          icon:Icon(Icons.check_box,color: Colors.green,),
          onPressed: (){
                  AppCubit.get(context).updateDatabase(status: 'done', id: model['id']);
          },
        ),
        IconButton(
          icon:Icon(Icons.archive,color: Colors.black45,),
          onPressed: (){
            AppCubit.get(context).updateDatabase(status: 'archived', id: model['id']);
          },

        ),

      ],
    ),
),
  );
}

Widget tasksBuilder({
  required List<Map> tasks
})=>ConditionalBuilder(
  condition:tasks.length>0,
    builder:(context)=> BlocConsumer<AppCubit,AppStates>(

    listener:(BuildContext context,AppStates state){},
    builder: (BuildContext context, AppStates state)=> ListView.separated(
        itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsetsDirectional.only(start:20.0 ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount:tasks.length
    ),
  ),
   fallback:(context)=>Center (
    child:  Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey[300],
        ),
        Text(
          'There is no tasks yet , please add some.',
          style: TextStyle(
              fontSize:16.0,
              color: Colors.grey[300],
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  ) ,
);









