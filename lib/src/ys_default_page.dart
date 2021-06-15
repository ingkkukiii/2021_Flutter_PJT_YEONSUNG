import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/components/changetheme_button_widget.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_buttonbar_controller.dart';
import 'package:flutter_project_gemtalk/src/pages/ys_1_home_page.dart';
import 'package:flutter_project_gemtalk/src/pages/ys_2_youtube_page.dart';
import 'package:flutter_project_gemtalk/src/pages/ys_3_yeonsung_page.dart';
import 'package:flutter_project_gemtalk/src/pages/ys_4_phonebook_page.dart';
import 'package:flutter_project_gemtalk/src/pages/ys_5_more_page.dart';
import 'package:get/get.dart';


class YSungDefaultPage extends GetView<YSungButtonbarController> {
  const YSungDefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //☆★☆//★☆★//☆★☆//★☆★//디바이스 SIZE 알림 기능//☆★☆//★☆★//☆★☆//★☆★//
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          body: Obx(() {
            switch (RouteName.values[controller.currentIndex.value]) {
              case RouteName.YSungHomePage:
                return YSungHomePage();
                break;
              case RouteName.YSungYoutubePage:
                return YSungYoutubePage();
                break;
              case RouteName.YSungYeonsungPage:
                return YSungYeonsungPage();
                break;
              case RouteName.YSungTapBarOfficePage:
                return YSungPhonebookPage();
                break;
              case RouteName.YSungMorePage:
                return YSungMorePage();
                break;
            }
            return Container();
          }),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed, //바턴바를 정적으로 고정
              currentIndex: controller.currentIndex.value, //ys_appbar_controller에서 관리되는 부분 : 현재 페이지
              showSelectedLabels: false, //상단에 라벨이 보일 수 있도록 해주는 작업
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              // onTap: (index) {
              //   print(index);
              //   AppController.to.changePageIndex(index);
              // },
              onTap: controller.changePageIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: 35),
                    activeIcon: Icon(Icons.home, size: 35),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection_outlined, size: 35),
                  activeIcon: Icon(Icons.video_collection, size: 35),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset(
                        "assets/ys_logo/yslogo.png",
                        width: 40,
                        height: 35,
                      )),
                  activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset(
                        "assets/ys_logo/yslogo.png",
                        width: 40,
                        height: 35,
                      )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_outlined, size: 35),
                  activeIcon: Icon(Icons.account_balance_wallet, size: 35),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz, size: 35),
                  activeIcon: Icon(Icons.more_horiz, size: 35),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
