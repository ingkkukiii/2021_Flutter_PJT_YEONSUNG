import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/components/ys_color.dart';
import 'package:flutter_project_gemtalk/src/components/ys_office_info_widget.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_favorite_controller.dart';
import 'package:flutter_project_gemtalk/src/models/ys_office_info.dart';
import 'package:flutter_project_gemtalk/src/ys_default_drawer.dart';
import 'package:get/get.dart';

class YSungPhonebookPage extends GetView<YSungFavoriteController> {
  const YSungPhonebookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: YSungColor,
        title: Text("즐겨찾기"),
      ),
      endDrawer: YSungDrawer(),
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            OfficeInfo officeInfo = controller.favoriteOfficeList[index];
            return YSungOfficeInfoWidget(
                name: officeInfo.name,
                isFavorite: officeInfo.isFavorite,
                teacher: officeInfo.teacher,
                location: officeInfo.location,
                number: officeInfo.number,
                officeUrl: officeInfo.officeUrl,
                instagram: officeInfo.instagram,
                youtube: officeInfo.youtube,
                onpressed: (){
                  controller.updateFavoriteOfficeInfo(officeInfo);
                }
            );
          },
          itemCount: controller.favoriteOfficeList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
              color: Colors.grey[400],
              height: 3,
              indent: 10,
              endIndent: 10,
            );
          },
        ),
      ),
    );
  }
}
