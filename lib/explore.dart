import 'package:flutter/material.dart';
import 'makeroom.dart';
import 'package:get/get.dart';
import 'findroom.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ExploreScreen> createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new_rounded),
          color: const Color(0xFF38597E),
          onPressed: () {
            //Navigator.pushNamed(context, '/home',);
          },
        ),
        title: const Text('HOME', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF38597E),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: const Text('내 프로필', style: TextStyle(fontSize: 15.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0, left: 30.0, right: 20.0, bottom: 20.0),
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: Color(0xFF38597E),
                      borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.person),
                    color: Colors.white,
                    iconSize: 45.0,
                    onPressed: () {
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: const Text(
                        '한동익명남',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: const Text(
                        '같이카 횟수 : 5회',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: const Text(
                        '자주타는 동네 : 한동대',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                  width: 170,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xFF98C9FF),
                      borderRadius: const BorderRadius.all(Radius.circular(10)) //모서리를 둥글게
                  ),
                  child: TextButton(
                      child: const Text("방만들기", style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: (){
                        Get.to(() => const MakeRoomPage(title: ''));
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
                  width: 170,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xFF98C9FF),
                      borderRadius: const BorderRadius.all(Radius.circular(10)) //모서리를 둥글게
                  ),
                  child: TextButton(
                      child: const Text("방찾기", style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: (){
                        Get.to(() => const FindRoomPage(title: ''));
                      }),
                ),
              ],
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
              child: const Text('근처 곧 마감되는 카풀', style: TextStyle(fontSize: 15.0)),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
              child: const Text('근처 카풀 지도 보기', style: TextStyle(fontSize: 15.0)),
            ),
            const Divider(
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}