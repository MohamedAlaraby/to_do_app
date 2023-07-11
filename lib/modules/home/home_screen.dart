import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title:  Text("First App"),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important) ,
            onPressed: onNotificationClicked,
          ),
           Icon(
            Icons.search,
          ),
        ],
        elevation: 20.0,
        backgroundColor: Colors.brown,
      ),
      body: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 200.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius:BorderRadiusDirectional.only(
                      topStart:Radius.circular(20.0),
                      topEnd:Radius.circular(20.0),
                  )
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                        image:NetworkImage(
                          "https://www.allaboutgardening.com/wp-content/uploads/2022/01/Types-of-Flowers-in-Garden.jpg",
                        ),
                      height: 200.0,
                      width:200.0,
                      fit: BoxFit.cover,

                    ),
                    Container(
                      width:double.infinity,
                      alignment: Alignment.bottomCenter,
                      color: Colors.lightBlue.withOpacity(0.0),
                      padding: EdgeInsets.symmetric(
                         vertical: 10.0,
                      ),
                      child: Text(
                          "Mohamed al-araby",
                          style: TextStyle(
                          fontSize: 20.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                        ),
                        textAlign:TextAlign.center ,
                      ),
                    )
                  ],
                ),
              ),
            )

        ],
      ),
      );

  }

  void onNotificationClicked() {
      print("notification clicked!");
  }
}


