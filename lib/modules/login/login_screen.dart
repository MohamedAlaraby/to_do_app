import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirest/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailTextController=TextEditingController();

  var passwordTextController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  var isPasswordHidden=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey,
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
                  defaultFormField(
                      controller: emailTextController,
                      textInputType: TextInputType.emailAddress,
                      validator: (String? value){
                         if(value!.isEmpty){
                              return 'Sorry the email must not be empty';
                         }
                         return null;
                      },
                      label: 'Email address',
                      prefix: Icons.email
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      controller: passwordTextController,
                      textInputType: TextInputType.visiblePassword,
                      validator: (string) {
                         if(string!.length<6){
                            return 'Sorry the password is too short!';
                         }
                         return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock,
                      suffix:IconButton(
                          onPressed: (){
                            setState(() {
                              isPasswordHidden= ! isPasswordHidden;
                            });
                          },
                          icon:isPasswordHidden? Icon(Icons.visibility):Icon(Icons.visibility_off),
                      ),
                      isPassword: isPasswordHidden,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultButton(
                      function: (){
                          if(formKey.currentState!.validate()){
                            //if the 2 forms is valid we will get here.
                            print(emailTextController.text);
                            print(passwordTextController.text);
                          }else{
                            //if the 2 forms is not valid we will get here.

                          }

                      },
                      text: 'LOGIN'
                  ),//defaultButton
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
      ),
    );
  }
}
