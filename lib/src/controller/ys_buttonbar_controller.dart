import 'package:get/get.dart';

enum RouteName {YSungHomePage,YSungYoutubePage,YSungYeonsungPage,YSungTapBarOfficePage,YSungMorePage,}

class YSungButtonbarController extends GetxService{
  static YSungButtonbarController get to => Get.find();
  RxInt currentIndex = 0.obs;
  void changePageIndex(int index){
    currentIndex(index); //바튼탭에서 찍혀지는 index를 넘겨주는 것
  }
}