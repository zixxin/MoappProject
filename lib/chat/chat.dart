import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatscreen.dart';
import 'package:temp/friends.dart';
import 'package:temp/newchat.dart';
import 'package:temp/main.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('나와같이', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF38597E),
        elevation: 0.0,
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 100,
              child: TextButton(
                  child: const Text("친구목록", style: TextStyle(fontSize: 15, color: Colors.white)),
                  onPressed: (){
                    Get.to(() => const FriendsPage(title: ''));
                  }),
            ),
          ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ListTile(
                title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 16.0),
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
                  },
                ),
              ),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text('한동익명녀', style: TextStyle(fontSize: 13.0)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text('히딩크 뒤 주차장으로 오시면 됩니다!',
                    style: TextStyle(fontSize: 13.0, color: Colors.grey[500])),
              ),
            ]),
          ],
        ),
                onTap: () {
                  Navigator.pushNamed(context, '/chating',);
                  //Get.to(const ChattingScreen(title: ''));
                },
              ),
            ),
            Divider(
              height: 15,
              thickness: 0.4,
              indent: 80,
              endIndent: 0,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}