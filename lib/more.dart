import 'package:flutter/material.dart';
import 'mycar.dart';
import 'package:get/get.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MoreScreen> createState() => MoreScreenState();
}

class MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30.0, bottom: 25.0, left: 30.0, right: 20.0),
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
                  children: const [
                    Text('내 정보',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey)),
                    SizedBox(height: 5),
                    Text(
                      '한동익명남',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 20.0, left: 15.0),
              child: const Text('일반', style: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              child: ListTile(
                title: const Text('한동 같이카 횟수', style: TextStyle(fontSize: 15)),
                trailing: const Text('5회', style: TextStyle(fontSize: 15, color: Colors.grey)),
                onTap: () {},
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              child: ListTile(
                title: const Text('차랑 등록 여부', style: TextStyle(fontSize: 15)),
                trailing: const Text('미등록', style: TextStyle(fontSize: 15, color: Colors.grey)),
                onTap: () {
                  Get.to(() => const MyCarScreen(title: ''));
                },
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              child: ListTile(
                title: const Text('알림 서비스', style: TextStyle(fontSize: 15)),
                trailing: const SwitchWidget(),
                onTap: () {},
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 20.0, left: 15.0),
              child: const Text('계정', style: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            const Divider(
                thickness: 1.0
            ),
            Container(
              child: ListTile(
                title: const Text('로그아웃', style: TextStyle(fontSize: 15, color: Color(0xFFC95555))),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFC95555)),
                onTap: () {
                  // FirebaseAuth.instance.signOut,
                },
              ),
            ),
            // TextButton(
            //     child: const Text("로그아웃", style: TextStyle(fontSize: 15, color: Colors.red)),
            //     onPressed: (){
            //       // FirebaseAuth.instance.signOut,
            //     }),
            const Divider(
              thickness: 1.0,
            ),
          ],
          ),
        ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  SwitchWidgetClass createState() => SwitchWidgetClass();
}

class SwitchWidgetClass extends State {
  bool switchControl = false;

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;

      });
    } else {
      setState(() {
        switchControl = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
              scale: 1.5,
              child: Switch(
                onChanged: toggleSwitch,
                value: switchControl,
                activeColor: Colors.white,
                activeTrackColor: const Color(0xFF38597E),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[350],
              )),
        ]);
  }
}
