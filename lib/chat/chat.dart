import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatscreen.dart';
import 'package:temp/friends.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: 30.0, left: 20.0, bottom: 15.0),
              child: const Text('나와같이',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10.0, left: 15.0, right: 15.0, bottom: 25.0),
              child: people(context),
            ),
            Divider(
              height: 15,
              thickness: 0.4,
              indent: 80,
              endIndent: 0,
              color: Colors.grey[400],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 15.0),
              child: chat1(),
            ),
            Divider(
              height: 15,
              thickness: 0.4,
              indent: 80,
              endIndent: 0,
              color: Colors.grey[400],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 15.0),
              child: chat2(),
            ),
            Divider(
              height: 15,
              thickness: 0.4,
              indent: 80,
              endIndent: 0,
              color: Colors.grey[400],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 15.0),
              child: chat3(),
            ),
            Divider(
              height: 15,
              thickness: 0.4,
              indent: 80,
              endIndent: 0,
              color: Colors.grey[400],
            ),
            TextButton(
                child: const Text("친구목록", style: TextStyle(fontSize: 30, color: Colors.red)),
                onPressed: (){
                  Get.to(() => const FriendsPage(title: ''));
                }),
          ],
        ),
      ),
    );
  }
}

Widget people(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 92, 119, 150),
              borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
              ),
          child: IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            iconSize: 45.0,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return SingleChildScrollView(
                        child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: personinfo(context),
                    ));
                  });
            },
          ),
        ),
        const Text('한동익명남', style: TextStyle(fontSize: 13.0))
      ]),
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 152, 175, 202),
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
        const Text('한동전산짱', style: TextStyle(fontSize: 13.0))
      ]),
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
              color: Color(0xFF38597E),
              borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
              ),
          child: IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            iconSize: 45.0,
            onPressed: () {
              // showModalBottomSheet(
              //     context: context,
              //     isScrollControlled: true,
              //     builder: (context) {
              //       return SingleChildScrollView(
              //           child: Container(
              //         padding: EdgeInsets.only(
              //             bottom: MediaQuery.of(context).viewInsets.bottom),
              //         child: personinfo(context),
              //       ));
              //     });
            },
          ),
        ),
        const Text('한동익명녀', style: TextStyle(fontSize: 13.0))
      ]),
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius:
                  const BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
              ),
          child: const Icon(Icons.search_rounded, size: 35.0),
        ),
        const Text('검색하기', style: TextStyle(fontSize: 13.0))
      ]),
    ],
  );
}

Widget personinfo(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25.0, top: 25.0),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 92, 119, 150),
                borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                ),
            child: const Icon(Icons.person, size: 30.0, color: Colors.white),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // Row에서는 mainAxis가 가로, crossAxis가 세로
            // Column에서는 crossAxis가 가로, mainAxis가 세로
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 30.0),
                  child: const Text('한동익명남',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 5.0),
                  child: const Text('프로필 미공개',
                      style: TextStyle(fontSize: 12, color: Colors.grey))),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 140.0, top: 20.0),
            child: IconButton(
              icon: const Icon(Icons.emoji_people_rounded),
              color: const Color(0xFF38597E),
              iconSize: 45.0,
              onPressed: () {
                Get.to(const ChattingScreen(title: ''));
              },
            ),
          ),
        ],
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              width: width * 0.87,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius:
                      const BorderRadius.all(Radius.circular(15)) //모서리를 둥글게
                  ),
              margin:
                  const EdgeInsets.only(left: 25.0, top: 20.0, bottom: 30.0),
              child: relation()),
        ],
      ),
    ],
  );
}

Widget relation() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(children: [
        Container(
            margin: const EdgeInsets.only(left: 18.0, top: 10.0),
            child: const Text('나와같이카 횟수',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey))),
      ]),
      Column(children: [
        Container(
            margin: const EdgeInsets.only(left: 15.0, top: 17.0, right: 25.0),
            child: Text('1회',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]))),
      ]),
      Column(children: [
        Container(
            margin: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: const Text('한동같이카 횟수',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey))),
      ]),
      Column(children: [
        Container(
            margin: const EdgeInsets.only(left: 15.0, top: 17.0),
            child: Text('5회',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]))),
      ]),
    ],
  );
}

Widget chat1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 16.0),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 92, 119, 150),
              borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
              ),
          child: IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {
              Get.to(const ChattingScreen(title: ''));
            },
          ),
        ),
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('한동익명남', style: TextStyle(fontSize: 13.0)),
          Container(
            margin: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            width: 3,
            height: 3,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                ),
          ),
          const Text('방금',
              style: TextStyle(fontSize: 13.0, color: Colors.grey)),
        ]),
        Container(
          margin: const EdgeInsets.only(top: 5.0, right: 75.0),
          child: Text('히딩크 뒤 주차장으로 오시면 됩니다!',
              style: TextStyle(fontSize: 13.0, color: Colors.grey[500])),
        ),
      ]),
    ],
  );
}

Widget chat2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 16.0),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 152, 175, 202),
              borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
              ),
          child: const Icon(Icons.person, size: 30.0, color: Colors.white),
        ),
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('한동전산짱', style: TextStyle(fontSize: 13.0)),
          Container(
            margin: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            width: 3,
            height: 3,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                ),
          ),
          const Text('2분 전',
              style: TextStyle(fontSize: 13.0, color: Colors.grey)),
        ]),
        Container(
          margin: const EdgeInsets.only(top: 5.0, right: 84.0),
          child: Text('혹시 현재 어디쯤 오고 계신가요?',
              style: TextStyle(fontSize: 13.0, color: Colors.grey[500])),
        ),
      ]),
    ],
  );
}

Widget chat3() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 16.0),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              color: Color(0xFF38597E),
              borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
              ),
          child: const Icon(Icons.person, size: 30.0, color: Colors.white),
        ),
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('한동익명녀', style: TextStyle(fontSize: 13.0)),
          Container(
            margin: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            width: 3,
            height: 3,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                ),
          ),
          const Text('3분 전',
              style: TextStyle(fontSize: 13.0, color: Colors.grey)),
        ]),
        Container(
          margin: const EdgeInsets.only(top: 5.0, right: 82.0),
          child: Text('도착하시는 대로 바로 출발할게요!',
              style: TextStyle(fontSize: 13.0, color: Colors.grey[500])),
        ),
      ]),
    ],
  );
}
