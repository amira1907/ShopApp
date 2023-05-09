import 'package:ShopApp/Lay_out/Cubit/states.dart';
import 'package:ShopApp/Shareing/constant/constant.dart';
import 'package:ShopApp/moduls/Login/Login_Screen.dart';
import 'package:ShopApp/moduls/Login/cubit/cubit.dart';
import 'package:ShopApp/moduls/Login/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Lay_out/Cubit/cubit.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  void navigatAndfinshed(context, widget) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false,
      );

  dynamic nameController = TextEditingController();

  dynamic PhoneController = TextEditingController();

  dynamic emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var model = ShopCubit.get(context).getUserModel;
          if (model != null) {
            nameController.text = model.data!.name;
            PhoneController.text = model.data!.phone!;
            emailController.text = model.data!.email!;
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.orangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),

                          ),
                          labelText: 'NAME',
                          labelStyle: TextStyle(
                            color: Colors.black,

                          ),


                        ),
                        keyboardType: TextInputType.emailAddress,
                         controller: TextEditingController(
                           text: ShopCubit.get(context).getUserModel?.data?.name,
                         ),
                        // controller: nameController,
                        // text: ShopLoginCubit.get(context).loginModel.data.email,


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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),

                          ),
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                            color: Colors.black,

                          ),

                        ),
                        keyboardType: TextInputType.emailAddress,
                        // obscureText: true,
                        controller: emailController,
                        validator: (value) {},

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.orangeAccent,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),

                          ),
                          labelText: 'PHONE NUMBER',
                          labelStyle: TextStyle(
                            color: Colors.black,

                          ),

                        ),
                        keyboardType: TextInputType.emailAddress,
                        // obscureText: true,
                        controller: PhoneController,
                        validator: (value) {},

                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ConditionalBuilder(
                        builder: (context) =>Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(344),
                          ),
                          child: MaterialButton(

                            color: Colors.orangeAccent,
                            onPressed: () {
                              signOut(context);

                            },
                            child: Text(
                              'LOG OUT',
                              style: TextStyle(
                                  color: Colors.white
                              ),

                            ),

                          ),
                        ) ,
                        fallback: (context) => Center(child: CircularProgressIndicator(
                          color: Colors.orangeAccent,

                        )),
                        condition: state is ! ShopLoadingLogOutState,
                      ),
                    ],

                  ),

                ),
              ),
            ),
          );
        }
    );
  }
}
