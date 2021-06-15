import 'package:flutter_project_gemtalk/src/controller/ys_office_controller.dart';
import 'package:flutter_project_gemtalk/src/models/ys_office_info.dart';
import 'package:get/get.dart';


class YSungFavoriteController extends GetxController {
  static YSungFavoriteController get to => Get.find();
  var favoriteOfficeList = <OfficeInfo>[].obs;

  // void loadFavoriteOfficeList() {
  //   favoriteOfficeList(YSungOfficeController.to.officeList
  //       .where((office) => office.isFavorite)
  //       .toList());
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void updateFavoriteOfficeInfo(OfficeInfo officeInfo) {
    if(favoriteOfficeList.contains(officeInfo)){
      officeInfo.setFavorite(false);
      favoriteOfficeList.remove(officeInfo);
    }else{
      officeInfo.setFavorite(true);
      favoriteOfficeList.add(officeInfo);
    }
    //YSungOfficeController.to.updateFavoriteOfficeInfo(officeInfo);
    //loadFavoriteOfficeList();
  }
}
