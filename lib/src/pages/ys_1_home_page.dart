import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/components/ys_color.dart';

import 'package:flutter_project_gemtalk/src/provider/theme_provider.dart';
import 'package:flutter_project_gemtalk/src/ys_default_drawer.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
const colorizeColors = [
  Colors.white,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

class YSungHomePage extends StatefulWidget {
  const YSungHomePage({Key? key}) : super(key: key);

  @override
  _YSungHomePageState createState() => _YSungHomePageState();
}

class _YSungHomePageState extends State<YSungHomePage> {
  void showErrorDialog(String errMsg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('실패'),
          content: Text(errMsg),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('다시 시도하세요'),
            ),
          ],
        );
      },
    );
  }

  void launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      showErrorDialog('브라우저에서 $url 열기 실패!');
    }
  }

  void launchInWebViewOrSafariVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      showErrorDialog('앱 내에서 $url 열기 실패!');
    }
  }

  final List<String> bannerImgList = [
    'http://www.yeonsung.ac.kr/ajax/CMN_SVC/FileView.do?GBN=X04&SITE_NO=2&CONFIG_CD=C1433&SUB_SEQ=16&MOBILE=TRUE',
    'http://www.yeonsung.ac.kr/ajax/CMN_SVC/FileView.do?GBN=X04&SITE_NO=2&CONFIG_CD=C1433&SUB_SEQ=17&MOBILE=TRUE',
    'http://www.yeonsung.ac.kr/ajax/CMN_SVC/FileView.do?GBN=X04&SITE_NO=2&CONFIG_CD=C1433&SUB_SEQ=20&MOBILE=TRUE',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      endDrawer: YSungDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: _size.width * 1.35,
            flexibleSpace: Stack(children: [
              FlexibleSpaceBar(
                background: SizedBox(
                  height: _size.width * 1.35,
                  width: _size.width,
                  child: Swiper(
                    autoplay: true,
                    control: SwiperControl(),
                    pagination: SwiperPagination(),
                    itemCount: bannerImgList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: bannerImgList[index],
                        placeholder: (context, url) => Container(
                          child: Center(
                            child: new CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      );
                    },
                  ),
                ),
              ),
              /////////음영부분
            ]),
          ),
          SliverAppBar(
            title: Text("YeonSung Univ.",
                style: TextStyle(fontFamily: 'Pacifico', color: Colors.white)),
            backgroundColor: Color.fromARGB(255, 80, 176, 209),
            centerTitle: true,
            pinned: true,
            elevation: 0,
            expandedHeight: _size.width * 0.15,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: SizedBox(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 350,
                color: YSungColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          icon: Icon(
                            Icons.menu_book,
                            size: 80,
                          ),
                          text: Text("도서관", style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            launchInBrowser('https://library.yeonsung.ac.kr/');
                          },
                        ),
                        MyButton(
                          icon: Icon(
                            Icons.monitor_outlined,
                            size: 80,
                          ),
                          text: Text("E-Class", style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            launchInBrowser(
                                'https://eclass.yeonsung.ac.kr/index.jsp');
                          },
                        ),
                        MyButton(
                          icon: Icon(
                            Icons.sticky_note_2_outlined,
                            size: 80,
                          ),
                          text: Text("Carrey GEM",
                              style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            launchInBrowser('https://carry.yeonsung.ac.kr/');
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          icon: Icon(
                            Icons.directions_bus_rounded,
                            size: 80,
                          ),
                          text: Text("스쿨버스", style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            AlertDialog dialog = AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              //scrollable: true,
                              content: Scrollbar(
                                thickness: 5,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child:
                                      Image.asset("assets/images/ys_bus.jpg"),
                                ),
                              ),
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => dialog);
                          },
                        ),
                        MyButton(
                          icon: Icon(
                            Icons.fastfood,
                            size: 80,
                          ),
                          text: Text("식당메뉴", style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            AlertDialog dialog = AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              //scrollable: true,
                              content: Scrollbar(
                                thickness: 5,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child:
                                      Image.asset("assets/images/ys_food.jpg"),
                                ),
                              ),
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => dialog);
                          },
                        ),
                        MyButton(
                          icon: Icon(
                            Icons.screen_search_desktop_outlined,
                            size: 80,
                          ),
                          text: Text("대학포털", style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            launchInBrowser(
                                'https://portal.yeonsung.ac.kr/login.jsp');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ); //Colors.blue,//accents[index % Colors.accents.length]);
            }, childCount: 1),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _HeaderDelegate(
              minHeight: 60,
              maxHeight: 100,
              child: Container(
                width: _size.width,
                decoration: BoxDecoration(
                  //★☆★//색깔-collor//☆★☆//
                  color: YSungColor,
                  //★☆★//깍기-borderRadius//☆★☆//
                  // borderRadius: BorderRadius.only(
                  // topRight: Radius.circular(15.0),
                  // bottomLeft: Radius.circular(10.0),
                  // ),
                  //★☆★//윤곽-border//☆★☆//
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        launchInBrowser('http://vr2.dreamvrad.net/ysu/');
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'VR',
                          style: TextStyle(
                              color: YSungColor2,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '캠퍼스투어',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                    TextButton(
                      onPressed: () {
                        launchInBrowser(
                            'https://www.instagram.com/yeonsung.university/');
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text("instagram",
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'Pacifico')),
                    ),
                    TextButton(
                      onPressed: () {
                        launchInBrowser(
                            'https://www.facebook.com/Yeonsunguniversity/');
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text(
                        "facebook",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: YSungColor,
            //Color.fromARGB(255, 80, 176, 209),
            expandedHeight: _size.width * 1.7,
            //onStretchTrigger: ,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: SizedBox(
                    height: _size.width,
                    width: _size.width,
                    child: Center(
                      child: Container(
                        // alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  '학생의 성장을 돕는 교육 혁신의 중심',
                                  textStyle: TextStyle(
                                    letterSpacing: 0.1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  colors: colorizeColors,
                                ),
                              ],
                              isRepeatingAnimation: true,
                              totalRepeatCount: 10,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText(
                                  '연성대학교',
                                  textStyle: TextStyle(
                                    letterSpacing: 0.1,
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                              isRepeatingAnimation: true,
                              totalRepeatCount: 10,
                            ),
                            // Text(
                            //   "학생의 성장을 돕는 교육 혁신의 중심",
                            //   style: TextStyle(
                            //     letterSpacing: 0.1,
                            //     fontSize: 20,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(height: 15),
                            // Text(
                            //   "연성대학교",
                            //   style: TextStyle(
                            //     letterSpacing: 0.1,
                            //     fontSize: 40,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.w900,
                            //   ),
                            //),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverAppBar(
            iconTheme: IconThemeData.fallback(),
            backgroundColor: Color.fromARGB(255, 239, 35, 142),
            expandedHeight: _size.width * 1.7,
            flexibleSpace: Stack(children: [
              FlexibleSpaceBar(
                background: SizedBox(
                    height: _size.width,
                    width: _size.width,
                    child: Center(
                      child: Container(
                        // alignment: Alignment.center,
                        // color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                    '지성 · 창의 · 소통 능력을 갖춘\n\n전인적 인재를 양성하여 국가사회에 기여',
                                    textStyle: TextStyle(
                                      letterSpacing: 0.1,
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    //colors: colorizeColors,
                                    speed: const Duration(milliseconds: 80)),
                              ],
                              isRepeatingAnimation: true,
                              totalRepeatCount: 10,
                              pause: const Duration(milliseconds: 1000),
                            ),
                            // Text(
                            //   "지성 · 창의 · 소통 능력을 갖춘",
                            //   style: TextStyle(
                            //     letterSpacing: 0.1,
                            //     fontSize: 20,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(height: 15),
                            // Text(
                            //   "전인적 인재를 양성하여 국가사회에 기여",
                            //   style: TextStyle(
                            //     letterSpacing: 0.1,
                            //     fontSize: 20,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            //),
                          ],
                        ),
                      ),
                    )),
              ),
            ]),
          ),
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 181, 220, 16),
            expandedHeight: _size.width * 1.7,
            flexibleSpace: Stack(children: [
              FlexibleSpaceBar(
                background: SizedBox(
                    height: _size.width,
                    width: _size.width,
                    child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  '사회맞춤형 산학협력\n\n선도 전문대학(LINC+)',
                                  textStyle: TextStyle(
                                    letterSpacing: 0.1,
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  speed: const Duration(milliseconds: 80),
                                ),
                                // TyperAnimatedText(
                                //     '선도 전문대학(LINC+)',
                                // textStyle: TextStyle(
                                //   letterSpacing: 0.1,
                                //   fontSize: 32,
                                //   color: Colors.white,
                                //   fontWeight: FontWeight.bold,
                                // )
                                // ),
                              ],
                              totalRepeatCount: 10,
                              pause: const Duration(milliseconds: 2000),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                  height: 100,
                  color: Colors.accents[index % Colors.accents.length]);
            }, childCount: 10),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 Tel 031-441-1100",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Copyright 2021 Yeonsung University & Flutter Developer Hwang (WDM). All rights Reserved.",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                  ],
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _HeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.icon,
      required this.text,
      // required this.color,
      required this.onPressed})
      : super(key: key);

  final Icon icon;
  final Widget text;
  //final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          //SizedBox(height: 1),
          text,
        ],
      ),
      style: TextButton.styleFrom(
          primary: Colors.white,
          // shadowColor: Colors.red,
          // elevation: 20,
          //최소사이즈 지정
          minimumSize: Size(121, 128),
          //padding: EdgeInsets.all(4),
          backgroundColor: YSungColor,
          side: BorderSide(
            width: 2.0,
            color: Colors.white,
          )),
    );
  }
}

// ////////////////////MyButton//////////////////////////////////////
// class MyButton extends StatelessWidget {
//   const MyButton(
//       {required Key key, required this.icon, required this.text, required this.color, required this.radius, required this.onPressed})
//       : super(key: key);
//
//   final Icon icon;
//   final Widget text;
//   final Color color;
//   final double radius;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onPressed,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           icon,
//           //SizedBox(height: 1),
//           text,
//         ],
//       ),
//       style: TextButton.styleFrom(
//           primary: Colors.white,
//           // shadowColor: Colors.red,
//           // elevation: 20,
//           //최소사이즈 지정
//           minimumSize: Size(121, 128),
//           //padding: EdgeInsets.all(4),
//           backgroundColor: YSungColor,
//           side: BorderSide(
//             width: 2.0,
//             color: Colors.white,
//           )),
//     );
//   }
// }
