import 'package:flutter/material.dart';
import 'registercar.dart';
import 'package:get/get.dart';

class MyCarScreen extends StatefulWidget {
  const MyCarScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyCarScreen> createState() => MyCarScreenState();
}

class MyCarScreenState extends State<MyCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내차관리', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF38597E),
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: const Text('차량 정보', style: TextStyle(fontSize: 15.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 20.0, left: 30.0, right: 20.0),
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: Color(0xFF38597E),
                      borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.directions_car),
                    color: Colors.white,
                    iconSize: 50.0,
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
                        '차량 번호',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      child: const Text(
                        '123 가 1234',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
                  width: 130,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xFF98C9FF),
                      borderRadius: BorderRadius.all(Radius.circular(10)) //모서리를 둥글게
                  ),
                  child: TextButton(
                      child: const Text("정보 수정", style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: (){
                        Get.to(() => const RegisterCarScreen(title: ''));
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
              child: const Text('점검 및 청소 일자', style: TextStyle(fontSize: 15.0)),
            ),
          ],
        ),
      ),
    );
  }
}
