import 'package:flutter/material.dart';
import 'package:flutter_project_gemtalk/src/components/ys_color.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_office_controller.dart';
import 'package:flutter_project_gemtalk/src/controller/ys_office_group_controller.dart';
import 'package:flutter_project_gemtalk/src/models/ys_office_group.dart';
import 'package:flutter_project_gemtalk/src/pages_tabbar/ys_5_office_tabbar_page_officelist.dart';
import 'package:get/get.dart';

class YSungOfficeTabBarPage extends GetView<YSungOfficeGroupController> {
  const YSungOfficeTabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          //GridView를 생성
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 5, //자식 위젯 간 가로 간격 값을 지정
          //mainAxisSpacing: 10, //자식 위젯 간 세로 간격 값을 지정
          crossAxisCount:
          2, //한 행(row)에 몇 개의 위젯을 넣을지 정한다, 바꿔말하면 열(column)의 수를 지정한다
          children: List.generate(controller.officeGroups.length, (index)=>_buildOfficeGroup(controller.officeGroups[index]))
        )
    );
  }

  Widget _buildOfficeGroup(OfficeGroup officeGroup) {
    return TextButton(
            onPressed: () {
              Get.to(() => YSungOfficeListPage(
                title: officeGroup.title,
                sliverAppbarBackgroundImage: Image.asset(officeGroup.thumbnail!,fit: BoxFit.cover,),
              ),
              arguments: {'uid':officeGroup.uid},
              binding: BindingsBuilder((){
                Get.put(YSungOfficeController());
              })
              );
            },
            child: GridTile(
              child: Container(
                decoration: BoxDecoration(
                  color: YSungColor,
                  //★☆★//깍기-borderRadius//☆★☆//
                  // borderRadius: BorderRadius.only(
                  //   topRight: Radius.circular(15.0),
                  //   topLeft: Radius.circular(15.0),
                  // ),
                  //★☆★//윤곽-border//☆★☆//
                  border: Border.all(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
              ),
              footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(officeGroup.title!, style: TextStyle(fontSize: 20)),
                  trailing: Icon(Icons.arrow_forward_ios)),
            ),
          );
  }
}
