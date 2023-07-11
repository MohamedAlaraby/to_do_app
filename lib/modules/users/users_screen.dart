import 'package:flutter/material.dart';
import 'package:flutterfirest/models/user/user_model.dart';

class UsersScreen extends StatelessWidget {
  var imageUrl =
      'https://avatars.githubusercontent.com/u/73850729?s=400&u=3860a9f9bc398700e099f2b9f36c85df68143784&v=4';
  List<UserModel> users=[
    UserModel(id:1, name:'mohamed alaraby', number:'0101359153'),
    UserModel(id:2, name:'mohamed saad', number:'0101359153'),
    UserModel(id:3, name:'mohamed alshenawy', number:'0101359153'),
    UserModel(id:4, name:'mohamed taha', number:'0101359153'),
    UserModel(id:1, name:'mohamed alaraby', number:'0101359153'),
    UserModel(id:2, name:'mohamed saad', number:'0101359153'),
    UserModel(id:3, name:'mohamed alshenawy', number:'0101359153'),
    UserModel(id:4, name:'mohamed taha', number:'0101359153'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(

          itemBuilder:(context,index)=>buildItem(users[index]),
          separatorBuilder:(context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(start:16.0),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          itemCount:users.length,
      ),
    );
  }

  //steps to make a list view
  //1-build the item.
  //2-build list.
  //3-add the item to the list.
  Widget buildItem(UserModel userModel) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              child: Text(
                userModel.id.toString(),
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              //take all the available space horizontally because we are in a row.
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userModel.number,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
