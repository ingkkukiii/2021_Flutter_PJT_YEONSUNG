import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/components/changetheme_button_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:url_launcher/url_launcher.dart';

class YSungDrawer extends StatefulWidget {
  const YSungDrawer({Key? key}) : super(key: key);

  @override
  _YSungDrawerState createState() => _YSungDrawerState();
}

class _YSungDrawerState extends State<YSungDrawer> {

  void showErrorDialog(String errMsg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('실패'),
          content: Text(errMsg),
          actions: <Widget>[
            TextButton(
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
// DrawerHeader(
//   child: Image.asset("assets/images/ys8.jpg",fit: BoxFit.fitWidth),
//   decoration: BoxDecoration(
//     color: Color.fromARGB(255, 80, 176, 209),
//   ),
// ),
          Stack(
            children: [
              Container(
                child: Image.asset(
                  "assets/ys_images/ys08.jpg",
                  fit: BoxFit.fitWidth,
                  colorBlendMode: BlendMode.hardLight,
                ),
              ),
              Container(
                height: 202,
                width: 304,
                color: Colors.black.withOpacity(0.4),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                    "assets/ys_logo/ys_signature_kor_eng_white.png",
                    height: 60),
              ),
              Container(
                alignment: Alignment.topRight,
                child: ChangeThemeButtonWidget(),
              ),
              Positioned(
                width: 304,
                height: 70,
                bottom: 1,
                child: Container(
//alignment: Alignment.bottomCenter,
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          AlertDialog dialog = AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("모바일 학생증"),
                                Image.asset(
                                  "assets/ys_logo/yslogo.png",
                                  height: 30,
                                  width: 30,
                                )
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/ys_images/ys_mobile_studentId.jpg"),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("User ID",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            Text("QR Code",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22)),
                                            Container(
                                              height: 100,
                                              child: SfBarcodeGenerator(
                                                value: 'https://www.naver.com',
                                                symbology: QRCode(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                    height: 170,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Text("이름 : 황인국"),
                                        Divider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Text("학번 : 2021200166"),
                                        Divider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Text("학과 : 컴퓨터소프트웨어학과"),
                                        Divider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Text("신분 : 학생"),
                                        Divider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                    height: 50,
                                    child: Image.asset(
                                      "assets/ys_logo/ys_signature_kor_eng_black.png",
                                    ))
                              ],
                            ),
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => dialog);
                          // Container(
                          //      height: 150,
                          //  child:
                          //      ),
                          //
                          //  );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.phone_android_rounded,
                                color: Colors.white),
                            Text(
                              "모바일신분증",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    _buildDrawerTextButton(context),
                    TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(Icons.calendar_today_outlined,
                                color: Colors.white),
                            Text(
                              "일정",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: () {
                          // Get.to(() => FavoritePage());
                        },
                        child: Column(
                          children: [
                            Icon(Icons.star_outline, color: Colors.white),
                            Text(
                              "즐겨찾기",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
// Icon(Icons.announcement_outlined,color: Colors.white),
// Icon(Icons.calendar_today_outlined,color: Colors.white),
// Icon(Icons.star_outline,color: Colors.white),
                  ],
                )),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.turned_in_not_outlined),
            title: Text("대학공지(Notice)"),
            onTap: () {
              // Get.to(() => YSungTabBarNoticePage());
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.school_rounded),
            title: Text("대학소개(About YeonSung)"),
            onTap: () {
              launchInBrowser(
                  'http://www.yeonsung.ac.kr/ko/cms/FR_CON/index.do?MENU_ID=70');
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text("학과소개(About Department)"),
            //Text("학과소개(About Department)"),
            onTap: () {
              launchInBrowser(
                  'http://www.yeonsung.ac.kr/ko/cms/FR_CON/index.do?MENU_ID=1450');
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.speaker_notes),
            title: Text("연성뉴스(YeonSung NEWS)"),
            onTap: () {},
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("주요학사일정(Academics Calendar)"),
            onTap: () {},
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.mobile_screen_share),
            title: Text("스마트서비스(Smart Services)"),
            onTap: () {
              AlertDialog dialog = AlertDialog(
                content: Text("서비스 준비 중입니다^^;"),
              );
              showDialog(
                  context: context, builder: (BuildContext context) => dialog);
            },
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new_outlined),
            title: Text("로그인(Login)"),
            onTap: () {
              AlertDialog dialog = AlertDialog(
                content: Text("서비스 준비 중입니다^^;"),
              );
              showDialog(
                  context: context, builder: (BuildContext context) => dialog);
            },
// trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  TextButton _buildDrawerTextButton(BuildContext context) {
    return TextButton(
                      onPressed: () {
                        ////////터치이벤트처리로 알림 창 띄우기////////
                        AlertDialog dialog = AlertDialog(
                          content: Text("서비스 준비 중입니다^^;"),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => dialog);
                      },
                      child: Column(
                        children: [
                          Icon(Icons.announcement_outlined,
                              color: Colors.white),
                          Text(
                            "알림",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ));
  }
}
