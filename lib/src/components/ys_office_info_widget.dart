import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_project_gemtalk/src/components/ys_color.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class YSungOfficeInfoWidget extends StatelessWidget {

  final String? name;
  final bool? isFavorite;
  final String? teacher;
  final String? location;
  final String? number;
  final String? officeUrl;
  final String? instagram;
  final String? youtube;
  final Function? onpressed;

  const YSungOfficeInfoWidget({Key? key, this.name, this.isFavorite, this.teacher, this.location, this.number, this.officeUrl, this.instagram, this.youtube, this.onpressed}) : super(key: key);


  void showErrorDialog(String errMsg) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('실패'),
          content: Text(errMsg),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('다시 시도하세요'),
            ),
          ],
        );
      },
    );
  }

  void launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      showErrorDialog('브라우저에서 $url 열기 실패!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Text('$name 학과사무실'),
                  IconButton(
                    onPressed: onpressed as void Function()?,
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite!? Colors.red : Colors.grey,
                    ),
                  )
                  ,
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$teacher 조교'),
                  Text('$location'),
                ],
              ),
              trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(
                        number!);
                  },
                  color: YSungColor3,
                  iconSize: 35),
              //isThreeLine: true,
            ),
            ButtonBar(
              //alignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(Icons.home_outlined),
                    iconSize: 40,
                    color: YSungColor2,
                    onPressed: (){
                      launchInBrowser(officeUrl!);
                    }
                ),
                IconButton(
                    icon: Image.asset("assets/ys_images/ys_instagram.png"),
                    iconSize: 30,
                    onPressed: (){
                      launchInBrowser(instagram!);
                    }
                ),
                IconButton(
                    icon: Image.asset("assets/ys_images/ys_youtube.png"),
                    iconSize: 30,
                    onPressed: (){
                      launchInBrowser(youtube!);
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
