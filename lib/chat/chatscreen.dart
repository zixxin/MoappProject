import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ChattingScreen> createState() => ChattingScreenState();
}

class ChattingScreenState extends State<ChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
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
            child: const Text('한동익명남',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0))),
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: const Color(0xFF38597E),
          iconSize: 25.0,
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            color: const Color(0xFF38597E),
            iconSize: 28.0,
            onPressed: () => {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('2022년 3월 21일 월요일',
                style: TextStyle(color: Colors.grey, fontSize: 12.0)),
            chatting1_1(),
            chatting2_1(),
            chatting1_2(),
            chatting2_2(),
            message(),
          ],
        ),
      ),
    );
  }
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

Widget message() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey,
                ),
                color: const Color.fromARGB(255, 234, 234, 234),
                borderRadius:
                    const BorderRadius.all(Radius.circular(15)) //모서리를 둥글게
                ),
            margin: const EdgeInsets.only(left: 15.0, top: 330.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            width: 300,
            height: 40,
            child: const TextField(
              cursorColor: Color(0xFF38597E),
              decoration: InputDecoration(
                hintText: '메시지를 입력하세요.',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5.0, top: 330.0),
            child: IconButton(
              icon: const Icon(Icons.emoji_people_rounded),
              color: const Color(0xFF38597E),
              iconSize: 30.0,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );
}

Widget chatting1_1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 18.0),
            width: 95,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Container(
                margin: const EdgeInsets.only(top: 12.0, left: 15.0),
                child: const Text('안녕하세요!',
                    style: TextStyle(color: Colors.black))),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7.0, left: 18.0),
                width: 225,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: Container(
                    margin: const EdgeInsets.only(top: 12.0, left: 15.0),
                    child: const Text('그할마 카풀 자리 아직 남아있나요?',
                        style: TextStyle(color: Colors.black))),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 5.0),
                  child: const Text('오후 3:05',
                      style: TextStyle(color: Colors.grey, fontSize: 10.0))),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget chatting2_1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 40.0, right: 5.0),
                child: const Text('오후 3:08',
                    style: TextStyle(color: Colors.grey, fontSize: 10.0))),
            Container(
              margin: const EdgeInsets.only(top: 15.0, right: 18.0),
              width: 155,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF38597E),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Container(
                  margin: const EdgeInsets.only(top: 12.0, left: 15.0),
                  child: const Text('네, 아직 남아있습니다!',
                      style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ]),
    ],
  );
}

Widget chatting1_2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15.0, left: 18.0),
            width: 162,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Container(
                margin: const EdgeInsets.only(top: 12.0, left: 15.0),
                child: const Text('지금 바로 가겠습니다 :)',
                    style: TextStyle(color: Colors.black))),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7.0, left: 18.0),
                width: 172,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
                child: Container(
                    margin: const EdgeInsets.only(top: 12.0, left: 15.0),
                    child: const Text('혹시 어디로 가면 될까요?',
                        style: TextStyle(color: Colors.black))),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 5.0),
                  child: const Text('오후 3:10',
                      style: TextStyle(color: Colors.grey, fontSize: 10.0))),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget chatting2_2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 25.0, right: 5.0),
                  child: const Text('읽음',
                      style: TextStyle(color: Colors.grey, fontSize: 10.0))),
              Container(
                  margin: const EdgeInsets.only(top: 3.0, right: 5.0),
                  child: const Text('오후 3:11',
                      style: TextStyle(color: Colors.grey, fontSize: 10.0))),
            ],
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 15.0, right: 18.0),
        width: 230,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFF38597E),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        child: Container(
            margin: const EdgeInsets.only(top: 12.0, left: 15.0),
            child: const Text('히딩크 뒤 주차장으로 오시면 됩니다!',
                style: TextStyle(color: Colors.white))),
      ),
    ],
  );
}
