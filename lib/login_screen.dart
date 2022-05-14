// ignore_for_file: non_constant_identifier_names, deprecated_member_use, duplicate_ignore, unnecessary_import, body_might_complete_normally_nullable, unused_import

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'constant.dart';
// ignore: unused_import
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  _loginscreenState createState() => _loginscreenState();
}

// ignore: camel_case_types
class _loginscreenState extends State<loginscreen> {
  late String _Email, _Password;

  Future<void> signIn(BuildContext context) async => await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _Email, password: _Password)
          .catchError((onError) {
        print(onError);
      }).then((authUser) {
        if (authUser.user != null)
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Homescreen())));
      });

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        bgimage,
                        height: height * 0.40,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: height * 0.42,
                        width: width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                stops: [0.3, 0.7],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.white,
                                ])),
                        // color: Colors.orange.withOpacity(0.3),
                      ),
                      Positioned(
                          bottom: 40,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                    text: appname + '\n',
                                    children: [
                                      TextSpan(
                                          text: slogan,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15))
                                    ])),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Container(
                      child: Text(
                        '   $loginstring  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                primarycolor.withOpacity(0.3),
                                Colors.transparent
                              ]),
                          border: Border(
                              left: BorderSide(color: primarycolor, width: 5))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onSaved: (value) {
                        _Email = value!;
                      },
                      validator: (email) {
                        if (email!.isEmpty)
                          return 'enter the email';
                        else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) return 'its not a valid email';
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: primarycolor,
                        ),
                        labelText: ('Email Address'),
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      onSaved: (value) {
                        _Password = value!;
                      },
                      validator: (password) {
                        if (password!.isEmpty)
                          return 'enter the password';
                        else if (password.length < 8 || password.length > 15)
                          return 'minimum 8 character is allowed & no longer 15';
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: primarycolor,
                        ),
                        labelText: ('Password'),
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          child: Text(forgettext), onPressed: () {})),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: height * 0.08,
                        width: width - 30,
                        child: FlatButton(
                          color: primarycolor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              signIn(context);
                              //   if (_Email == 'srini@gmail.com' &&
                              //       _Password == '12345678') {
                              //     FocusScope.of(context).unfocus();
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => Homescreen(),
                              //       ),
                              //     );
                              //   } else {
                              //     print('invalid login detials');
                              //   }
                            }
                          },
                          child: Text(
                            'Login to Account',
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text("Don't have an account?"),
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Create an Account',
                            style: TextStyle(color: primarycolor, fontSize: 16),
                          ))
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
