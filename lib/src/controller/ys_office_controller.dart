import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_favorite_controller.dart';
import 'package:flutter_project_gemtalk/src/models/ys_office_info.dart';
import 'package:get/get.dart';

class YSungOfficeController extends GetxController {
  static YSungOfficeController get to => Get.find();
  var officeList = <OfficeInfo>[].obs;
  List<OfficeInfo>? list = <OfficeInfo>[];

  @override
  void onInit() {
    super.onInit();
    _loadJsonFile();
  }

  void _loadJsonFile() async {
    String data = await DefaultAssetBundle.of(Get.context!)
        .loadString("assets/office_infos.json");
    list = json
        .decode(data)
        .map<OfficeInfo>((item) => OfficeInfo.fromJson(item))
        .toList();
    updateFavoriteOfficeInfoData();
  }

  void updateFavoriteOfficeInfoData() {
    officeList.clear();
    officeList.addAll(list!
        .where((element) => element.parentGroup == Get.arguments['uid'])
        .map((e) {
      e.setFavorite(YSungFavoriteController.to.favoriteOfficeList.contains(e));
      return e;
    }).toList());
  }

  void updateFavoriteOfficeInfo(OfficeInfo officeInfo) {
    YSungFavoriteController.to.updateFavoriteOfficeInfo(officeInfo);
    updateFavoriteOfficeInfoData();
  }
}
