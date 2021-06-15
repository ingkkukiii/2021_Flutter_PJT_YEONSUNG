import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/components/ys_office_info_widget.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_office_controller.dart';
import 'package:flutter_project_gemtalk/src/models/ys_office_info.dart';
import 'package:get/get.dart';


class YSungOfficeListPage extends GetView<YSungOfficeController> {
  const YSungOfficeListPage({Key? key, this.title, this.sliverAppbarBackgroundImage}) : super(key: key);

  final String? title;
  final Image? sliverAppbarBackgroundImage;



  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(() =>CustomScrollView(
          slivers: [
            SliverAppBar(
              // actions: [
              //   IconButton(
              //       onPressed: (){
              //         Get.to(()=>YSungFavoritePage(saved3.toList()));
              //       },
              //       icon: Icon(Icons.favorite,color: Colors.white,))
              //
              // ],
              backgroundColor: Color.fromARGB(255, 80, 176, 209),
              centerTitle: true,
              pinned: true,
              elevation: 0,
              expandedHeight: _size.width * 0.5,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    title: Text(
                      title!,
                      style: TextStyle(color: Colors.white),
                    ),
                    background: SizedBox(
                        child: sliverAppbarBackgroundImage)
                    ),
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  OfficeInfo officeInfo = controller.officeList[index];
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
                }, childCount: controller.officeList.length))
          ],
        ),
        ),
    );
  }
}
