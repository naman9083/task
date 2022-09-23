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
              return Center(
                child: const Text(
                  'No Internet Connection!',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              );
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
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
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
                                          textInputAction:
                                              TextInputAction.search,
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
                                        height: 55,
                                        width: 55,
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
                                            fontSize: 25,
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            width: w * 100,
                                            "https://storage.googleapis.com/flunkey-main.appspot.com/restaurantPics/5YjdiCasknr5zbrFhGLQ/tl3n4pxcx.jpeg?GoogleAccessId=firebase-adminsdk-hdasw%40flunkey-main.iam.gserviceaccount.com&Expires=16447017600&Signature=t8AK15woVXz9%2FdJhF0gfkq0aXXsjBYX9b%2BgaTppcpf5qmAHCEkH6ECD8PX7YaNyyZmh18uwh3ExEUrf77%2F2q%2BPZyebRYVwOWnFAQOp456m3gl3nGuTnQxicRpGMRU3D9jVCvAndd3liFG6h9JvtjjppK2knXN4Jqc7%2BY8B27jKZK0RPZMVvCP7aHbN4tFDLopwj7K3aNOTlvgacXg6CTNYhBape61xVoEFiqhJy86rsFgmUznizM%2B5TxXPRv7T81RL6LqYcl%2B1myjyYkVk2wGvzj5IskpKh7k%2FTYPycP8HzqbdGIZ0yeTpO8bMx%2BgwQWg1m6%2BREQ6wpfWzApT5u0fg%3D%3D",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 20,
                                        left: 20,
                                        bottom: 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              height: h * 4,
                                              width: w * 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: InkWell(
                                                onTap: () {},
                                                child: const Text(
                                                  "SEE MORE",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            width: w * 100,
                                            "https://storage.googleapis.com/flunkey-main.appspot.com/restaurantPics/ckpksyl7q00003e5gp3e582fc/wkyzj3m3p.jpeg?GoogleAccessId=firebase-adminsdk-hdasw%40flunkey-main.iam.gserviceaccount.com&Expires=16447017600&Signature=JNXAuR0ME2fs74%2BHWoRktjK8HWLEdiNDxkks88CChuRbHccMgaVVQqKkrfQ2VpRGmz7jqMmOpSyiJLvtm%2FYhYCvBKWBpFRgJEHkH%2BPLoFX4gguhsgVS%2BWV8FfLVnCmVBoJ0JQmE5lj7zImaZIkAxfyipgE3x%2B6DPX2DxfL%2FLJHIVVbjxqB44N6kDxgveso1vy2o7voG1yGmJ0GueMBX09oga%2BqwVLA5GkXr1M%2B5%2BQUDU8NQmidsH0fcWyf0%2Fc1M6YSrAoItqCd3ahoo1SgwDTJcEkAhIKqPRB3ZCh7dhYQh2Q76MsCK0rpXLbBXbBrC3%2FxfY3mpBDpUG26A9yxssCg%3D%3D",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 20,
                                        left: 20,
                                        bottom: 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              height: h * 4,
                                              width: w * 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: InkWell(
                                                onTap: () {},
                                                child: const Text(
                                                  "SEE MORE",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            width: w * 100,
                                            "https://storage.googleapis.com/flunkey-main.appspot.com/restaurantPics/ckpksyl7q00003e5gp3e582fc/wkyzizbm4.jpeg?GoogleAccessId=firebase-adminsdk-hdasw%40flunkey-main.iam.gserviceaccount.com&Expires=16447017600&Signature=P8yrMuGihnKZm1Eswv1nrloVno6nO37XZe6qLQKVEW1sEN7POnrRMkbZxkVcEP1TQGK9RcOUe7WpKxmJ77iGHcwjplPxHiVmk8JshTbgVcbL6lCzMAfSRxGENJcRcdGm8%2FEblog8ds12yKbbdmPOKX80szpiMxlA7%2FiDb5CqBagTykqq8mctrxq02Bu3O0SretplSpikOOUMyMG7QJ9YD2euCcRvzjbxk6OKxWP6Z5JYWpKEKX2405giHqlZgpUugFHG42BcsEfvjrcvZOr6xP0bL4HxeM5SRXaiFHr4mcTw%2FlAw9cYTEviAxp%2FFBt4XwcUIrs6ZD8MXb1dqE3fVIQ%3D%3D",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 20,
                                        left: 20,
                                        bottom: 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              height: h * 4,
                                              width: w * 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: InkWell(
                                                onTap: () {},
                                                child: const Text(
                                                  "SEE MORE",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            width: w * 100,
                                            "https://storage.googleapis.com/flunkey-main.appspot.com/restaurantPics/N9DeoVcIdtMUJ8CzPuLp/wl058me8w.jpeg?GoogleAccessId=firebase-adminsdk-hdasw%40flunkey-main.iam.gserviceaccount.com&Expires=16447017600&Signature=L2zhXBDEEwon5uo4pRfnOoHkLhGGUayS%2FSzNvrX1vfOOkKbAfCTef1NJkZNghjZ1%2FoVT7UsaXblFggYTZkGQ9IQJL0etzgjdzVhuEwWOEpWxukCXdCkUgXLBxtOpxzbvGtumbBxaq3WsuKY6GUGkgHZ41t6VHyYRCJsEVeyq8GHDAmFI4IF%2FQYYqgcJkaEVEtFhnAUnnXKgMZ5dU9X1ty2NnkFVCv9%2FefmzRYDK9mumoCocCP9SY3necI4p4vvzFOsI7YEL2h5obcVBWNxm2wfq0Vv9CFSrfHAreXsBlTQ6yd2sCTWMNiaKLg25sk3vsImBoaxMDOF4v04BIV%2BAIUw%3D%3D",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 20,
                                        left: 20,
                                        bottom: 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              height: h * 4,
                                              width: w * 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: InkWell(
                                                onTap: () {},
                                                child: const Text(
                                                  "SEE MORE",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
