import 'dart:async';
import 'package:flutter/material.dart';
import 'package:i_task/helpers/shared_services.dart';

import '../splash/splash.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({this.url, this.name, Key? key}) : super(key: key);
  String? url;
  String? name;
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  Future<void> _signOut() async {
    removeUserFromLocal();
    Navigator.push(context, MaterialPageRoute(builder: (context) => splash()));
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    return SizedBox(
        width: 90 * w,
        child: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  width: w * 80,
                  height: h * 8,
                  margin: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      InkWell(
                        child: Image.asset(
                          'assets/Icons/Back Button.png',
                          width: 60,
                          height: 60,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.deepOrangeAccent,
                        child: widget.url != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(
                                  widget.url.toString(),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Image.asset(
                                'assets/Icons/Ellipse 3.png',
                              ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Hi,\n${widget.name ?? "User Name"}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: w * 31,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.black,
                  width: w * 75,
                  margin: const EdgeInsets.fromLTRB(26, 0, 26, 0),
                  height: 2,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 84.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black), "INBOX")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 83.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "MY PROFILE"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 81.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "WRITE A REVIEW"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 80.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "REGISTER A WEDDING"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 79.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "CONTACT US"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 78.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "ABOUT US"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 77.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black), "FAQs"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 76.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "PRIVACY POLICY"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 20, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 75.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "TERMS AND CONDITIONS"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 74.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                              style: TextStyle(color: Colors.black),
                              "SHARE APP"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
                SizedBox(height: h * 1),
                Container(
                  width: 75 * w,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Layer 73.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: w * 5,
                      ),
                      TextButton(
                          onPressed: () {
                            _signOut();
                          },
                          child: Text(
                              style: TextStyle(color: Colors.black), "LOGOUT"))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 75 * w,
                  height: .8,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  color: Colors.black,
                ),
              ],
            )));
  }
}
