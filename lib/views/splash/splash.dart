import 'dart:async';

import 'package:flutter/material.dart';

import '../../helpers/shared_services.dart';
import '../home/home.dart';
import '../login/login.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  bool loggedIn = false;
  _asyncMethod() async {
    loggedIn = (await getUserFromLocal())!;
  }

  @override
  void initState() {
    super.initState();
    _asyncMethod();
    Timer(
        const Duration(seconds: 2),
        () => loggedIn
            ? Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()))
            : Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        "assets/Images/BG.png",
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
