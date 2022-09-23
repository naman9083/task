import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_task/services/getRestauntServiceModel.dart';
import 'package:i_task/services/restroModel.dart';
import 'package:i_task/views/drawer/Navdrawer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;
import 'package:outline_search_bar/outline_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<dynamic>? _future;
  Data? data;
  _fetchData() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.flunkey.app/api/explore/restaurants?&pageNo=0&size=10&direction=asc'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    } else {}
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRestroDetails().then((value) {
      setState(() {
        data = value;
      });
    });

    _future = _fetchData();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height / 100;
    var w = MediaQuery.of(context).size.width / 100;
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 30 * h,
              color: Colors.white,
              width: 100 * w,
              child: Center(
                child: LoadingAnimationWidget.waveDots(
                  color: Colors.pinkAccent,
                  size: 200,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return Scaffold(
                key: _scaffoldKey,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startTop,
                floatingActionButton: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: w * 6,
                        ),
                        InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Image.asset(
                            'assets/Icons/Menu Button.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                drawer: NavDrawer(),
                body: Container(
                  height: 145.5 * h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF7F7F7),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/Icons/BG T.png',
                              height: h * 35,
                              fit: BoxFit.fill,
                            ),
                          )),
                      Positioned(
                        top: 25,
                        left: 20,
                        right: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 60.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: w * 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFAEB6B6FF),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  width: 78 * w,
                                  height: 5 * h,
                                  child: const OutlineSearchBar(
                                    searchButtonIconColor: Colors.white,
                                    hintText: ('Search'),
                                    borderColor: Colors.transparent,
                                    textInputAction: TextInputAction.search,
                                    autoCorrect: true,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h * 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/Images/icon2.svg',
                                  height: 45,
                                  width: 45,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "F L U N K Y",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24,
                                      fontFamily: 'oswald'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h * 2,
                            ),

                            Container(
                              height: h * 24,
                              width: w * 82,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Image.network(
                                    width: w * 100,
                                    "",
                                    // data!.data[0].imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  right: 20,
                                  left: 20,
                                  bottom: 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        height: h * 4,
                                        width: w * 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: const InkWell(
                                          child: Text(
                                            "SEE MORE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: h * 3,
                            ),
                            Container(
                              height: h * 24,
                              width: w * 82,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Image.asset(
                                    width: w * 100,
                                    'assets/Icons/Catering.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  right: 20,
                                  left: 20,
                                  bottom: 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        height: h * 4,
                                        width: w * 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "SEE MORE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: h * 3,
                            ),
                            Container(
                              height: h * 24,
                              width: w * 82,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Image.asset(
                                    width: w * 100,
                                    'assets/Icons/Decorator.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  right: 20,
                                  left: 20,
                                  bottom: 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        height: h * 4,
                                        width: w * 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "SEE MORE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: h * 3,
                            ),
                            Container(
                              height: h * 24,
                              width: w * 82,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Image.asset(
                                    width: w * 100,
                                    'assets/Icons/Photographer.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  right: 20,
                                  left: 20,
                                  bottom: 20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        height: h * 4,
                                        width: w * 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Text(
                                            "SEE MORE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),

                            // Container(
                            //   height: h * 105,
                            //   width: w * 100,
                            //   child: ListView.builder(
                            //     itemCount: 4,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       return Column(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         children: [
                            //
                            //         ],
                            //       );
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: 2.5 * h,
                            ),
                            InkWell(
                              child: Image.asset(
                                'assets/Icons/View All Service Button.png',
                                width: w * 90,
                                height: h * 6,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        });
  }
}
