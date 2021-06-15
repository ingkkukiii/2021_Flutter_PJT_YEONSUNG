import 'package:flutter_project_gemtalk/src/models/ys_office_info.dart';

class OfficeGroup{
  final String? uid;
  final String? title;
  final String? thumbnail;
  List<OfficeInfo>? officeList;
  OfficeGroup({this.uid, this.title, this.thumbnail});
  OfficeGroup.fromJson(Map<String, dynamic> map)
      :  this(
          uid: map['uid'],
          title: map['title'],
          thumbnail: map['thumbnail'],
      );

  void updateOfficeList(List<OfficeInfo> officeList){
    this.officeList = officeList;
  }
}