import 'package:ShopApp/moduls/Login/Login_Screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  void navigatAndfinshed(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REGISTER',
                style:TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Email Id',
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.orangeAccent,
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),

                  ) ,
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),

                  ) ,
                  labelText:   'Enter Your Email',
                  labelStyle: TextStyle(
                    color:Colors.black,

                  ),


                ),
                keyboardType: TextInputType.emailAddress,

                controller: TextEditingController(),
                validator: (value) {
                },

              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: Colors.orangeAccent,
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),

                  ) ,
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),

                  ) ,
                  labelText:   'Enter Your Password',
                  labelStyle: TextStyle(
                    color:Colors.black,

                  ),

                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                controller: TextEditingController(),
                validator: (value) {
                },

              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Confirm Password',
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: Colors.orangeAccent,
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),

                  ) ,
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),

                  ) ,
                  labelText:   'Confirm Your Password',
                  labelStyle: TextStyle(
                    color:Colors.black,

                  ),

                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                controller: TextEditingController(),
                validator: (value) {
                },

              ),
              // Row(
              //   children: [
              //     Text(""),
              //     Spacer(),
              //     MaterialButton(
              //       onPressed: (){},
              //       child: Text(
              //         'Forgot Password ?',
              //         style: TextStyle(
              //           fontWeight: FontWeight.w300,
              //           fontSize: 17,
              //           color: Colors.grey,
              //           decoration: TextDecoration.underline,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 8,
              // ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(344),
                ),
                child: MaterialButton(

                  color: Colors.orangeAccent,
                  onPressed: (){},
                  child: Text(
                    'SING UP',
                    style: TextStyle(
                        color: Colors.white
                    ),

                  ),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ARE YOU A EXISTING USER ?!',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigatAndfinshed(context, LoginScreen());
                    },
                    child:Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),

                ],
              ),
            ],

          ),

        ),
      ),
    );
  }
}
