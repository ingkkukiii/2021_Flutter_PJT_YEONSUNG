import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/components/ys_color.dart';
import 'package:flutter_project_gemtalk/src/pages_tabbar/ys_1_covid19_tabbar_page.dart';
import 'package:flutter_project_gemtalk/src/pages_tabbar/ys_2_news_tabbar_page.dart.dart';
import 'package:flutter_project_gemtalk/src/pages_tabbar/ys_3_notice_tabbar_page.dart.dart';
import 'package:flutter_project_gemtalk/src/pages_tabbar/ys_4_convenience_tabbar_page.dart.dart';
import 'package:flutter_project_gemtalk/src/pages_tabbar/ys_5_office_tabbar_page.dart';
import 'package:flutter_project_gemtalk/src/pages_tabbar/ys_6_club_tabbar_page.dart';

class YSungYeonsungPage extends StatefulWidget {
  const YSungYeonsungPage({Key? key}) : super(key: key);

  @override
  _YSungYeonsungPageState createState() => _YSungYeonsungPageState();
}

class _YSungYeonsungPageState extends State<YSungYeonsungPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        isScrollable: true,
        indicatorColor: YSungColor,
        indicatorWeight: 7.0,
        tabs: [
          YSungTabBar("코로나19"),
          YSungTabBar("연성뉴스"),
          YSungTabBar("공지사항"),
          YSungTabBar("편의시설"),
          YSungTabBar("학과사무실"),
          YSungTabBar("동아리실"),

        ],
      ),
      body: TabBarView(
        children: <Widget>[
          YSungCovid19TabBarPage(),
          YSungNewsTabBarPage(),
          YSungNoticeTabBarPage(),
          YSungConvenienceTabBarPage(),
          YSungOfficeTabBarPage(),
          YSungClubTabBarPage()
        ],
      ),
    );
  }
}

class YSungTabBar extends StatelessWidget {

  final String _name;
  const YSungTabBar(this._name, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        child: Text(
          _name,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }
}
