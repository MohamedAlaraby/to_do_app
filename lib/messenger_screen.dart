import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  var imageUrl =
      'https://avatars.githubusercontent.com/u/73850729?s=400&u=3860a9f9bc398700e099f2b9f36c85df68143784&v=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chats',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 16.0,
                )),
          ),
          SizedBox(
            width: 8.0,
          ),
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16.0,
                )),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Search')
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  itemCount: 10,
                  //the number of items you have the list to create via the builder.
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),//because we can't make two vertical scrollable in the same screen.
                  shrinkWrap: true,//build the whole list because you are part of a scrollable.
                  itemBuilder:(context,index) =>
                      buildChatItem(),//this is an anonymous function that give me the context and the index in case i need it.
                  separatorBuilder:(context,index) => SizedBox(
                    height: 10.0,
                  ) ,
                  itemCount: 30
              )
            ],
          ),
        ),
      ),
    );
  }

  //1-build item via arrow function (function that contain only returning an object).
  //2-build list.
  //3-add item to list.

  //reusable items.
  Widget buildStoryItem() => Container(
        width: 70.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                    radius: 30.0, backgroundImage: NetworkImage(imageUrl)),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3, end: 3),
                  child:
                      CircleAvatar(radius: 5.0, backgroundColor: Colors.green),
                ),
              ],
            ),
            Text(
              'Mohamed Mohamed Al-araby',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                  radius: 30.0, backgroundImage: NetworkImage(imageUrl)),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 3, end: 3),
                child: CircleAvatar(radius: 5.0, backgroundColor: Colors.green),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            //expanded(take the remaining space) horizontally because we are in a row.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mohamed Mohamed Al-araby Mohamed Mohamed Al-araby',
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Here is the message Here is the message Here is the message Here is the message',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 7.0,
                        width: 7.0,
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                      ),
                    ),
                    Text(
                      '.20-12',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
}
