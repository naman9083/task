import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_task/helpers/shared_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errortext1 = "";
  String errortext2 = "";
  bool errorCtrl1 = false;
  bool errorCtrl2 = false;
  customSignIn() {
    if ((email.text == "flunkey" && pass.text == "password123") ||
        (email.text == "user" && pass.text == "password123")) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SizedBox(
              height: h,
              child: Image.asset(
                "assets/Images/BG.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              left: 20,
              right: 20,
              top: 90,
              child: Container(
                height: .85 * h,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/Images/icon2.svg',
                      height: 120,
                      width: 120,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: .04 * h,
                    ),
                    const Text(
                      "F L U N K Y\n Sign In",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          fontFamily: 'oswald'),
                    ),
                    SizedBox(
                      height: .08 * h,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: .02 * h, bottom: .02 * h),
                      width: .80 * w,
                      height: .08 * h,
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              offset: Offset(.4, .4),
                            )
                          ]),
                      child: TextFormField(
                        controller: email,
                        onChanged: (text) {
                          if (text.isEmpty) {
                            setState(() {
                              errortext1 = "Can't be empty";
                              errorCtrl1 = true;
                            });
                          } else if (text.length < 4) {
                            setState(() {
                              errortext1 = "Too Short";
                              errorCtrl1 = true;
                            });
                          } else if (text.length > 10) {
                            setState(() {
                              errortext1 = "Too long";
                              errorCtrl1 = true;
                            });
                          } else {
                            setState(() {
                              errorCtrl1 = false;
                            });
                          }
                        },
                        style: const TextStyle(fontFamily: 'Luxia'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                            ),
                            icon: const Icon(
                              Icons.person_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: 'Enter Username',
                            errorText: errorCtrl1 ? errortext1 : null,
                            hintStyle: const TextStyle(
                                fontFamily: 'Luxia Regular',
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        validator: (name) {
                          if (name!.length < 3 || name.length > 11) {
                            return "Invalid Details";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: .02 * h, bottom: .02 * h),
                      width: .80 * w,
                      height: .08 * h,
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                              offset: Offset(.4, .4),
                            )
                          ]),
                      child: TextFormField(
                        controller: pass,
                        onChanged: (text) {
                          if (text.isEmpty) {
                            setState(() {
                              errortext2 = "Can't be empty";
                              errorCtrl2 = true;
                            });
                          } else if (text.length < 4) {
                            setState(() {
                              errortext2 = "Too Short";
                              errorCtrl2 = true;
                            });
                          } else if (text.length > 10) {
                            setState(() {
                              errortext2 = "Too long";
                              errorCtrl2 = true;
                            });
                          } else {
                            setState(() {
                              errorCtrl2 = false;
                            });
                          }
                        },
                        style: const TextStyle(fontFamily: 'Luxia'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _passwordVisible!,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            icon: const Icon(
                              Icons.lock_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                            errorText: errorCtrl2 ? errortext2 : null,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible!
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible!;
                                });
                              },
                            ),
                            hintText: 'Enter Password',
                            hintStyle: const TextStyle(
                                fontFamily: 'Luxia Regular',
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        validator: (pass) {
                          if (pass!.length < 3 || pass.length > 12) {
                            return "Invalid Details";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () {
                          if (customSignIn()) {
                            Fluttertoast.showToast(
                                msg: "Welcome to Flunkey Restro",
                                backgroundColor: Colors.green,
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                timeInSecForIosWeb: 1,
                                fontSize: 16.0,
                                toastLength: Toast.LENGTH_SHORT);
                            putUsertoLocal();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Home()));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Invalid Details",
                                backgroundColor: Colors.red,
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                timeInSecForIosWeb: 1,
                                fontSize: 16.0,
                                toastLength: Toast.LENGTH_SHORT);
                          }
                        },
                        child: Container(
                          width: .37 * w,
                          height: h * .06,
                          padding: const EdgeInsets.all(5.0),
                          child: const Center(
                            child: Text("LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
