import 'package:flutter_project_gemtalk/src/controller/ys_buttonbar_controller.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_favorite_controller.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_office_group_controller.dart';
import 'package:get/get.dart';


class InitBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(YSungYoutubeRepository(), permanent: true);
    Get.put(YSungOfficeGroupController(), permanent: true);
    Get.put(YSungFavoriteController(), permanent: true);
    Get.put(YSungButtonbarController());
    // Get.put(DropdownButtonController());
  }
}
