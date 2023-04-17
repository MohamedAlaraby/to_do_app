import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var emailTextController=TextEditingController();
  var passwordTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Text(
                    "Login",
                  style:TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                    color: Colors.black54
                  ),

                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  controller: emailTextController,
                    decoration: InputDecoration(
                      labelText:'Email Address' ,
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted:(value){
                       print(value);
                    },
                  onChanged: (val){
                      print(val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText:'Pasword' ,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted:(value){
                    print(value);
                  },
                  onChanged: (val){
                    print(val);
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                      onPressed: (){
                          print("The email value is ${emailTextController.text}");
                          print("The password value is ${passwordTextController.text}");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center ,
                    children:[
                      Text(
                          'Don\'t have an account?'
                      ),
                      TextButton(
                        child: Text('Register now'),
                          onPressed:(){
                          },
                      )
                    ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
