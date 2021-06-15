import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/models/ys_office_group.dart';
import 'package:get/get.dart';


class YSungOfficeGroupController extends GetxController {

  static YSungOfficeGroupController get to => Get.find();
  var officeGroups = <OfficeGroup>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadJsonFile();
  }

  void _loadJsonFile() async {
    if (Get.context != null) {
      String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/office.json");
      List<OfficeGroup> list = json
          .decode(data)
          .map<OfficeGroup>((item) => OfficeGroup.fromJson(item))
          .toList();
      officeGroups.addAll(list);
    } else {
      Future.delayed(Duration(milliseconds: 200), _loadJsonFile);
    }
  }

  // void updateFavoriteOfficeInfo(OfficeInfo officeInfo) {
  //   var officeListValues = officeList.map((element) {
  //     if (element.uid == officeInfo.uid) {
  //       element.isFavorite = !element.isFavorite;
  //     }
  //     return element;
  //   }).toList();
  //   officeList.clear();
  //   officeList.addAll(officeListValues);
  // }
}
