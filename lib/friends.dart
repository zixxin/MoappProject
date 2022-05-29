import 'package:flutter/material.dart';
import 'more.dart';
import 'package:get/get.dart';
import 'explore.dart';
import 'newchat.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('친구 목록', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF38597E),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 25.0,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 20.0),
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                            color: Color(0xFF38597E),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              '한동익명남',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          const Text(
                            '나와 같이카한 횟수 : 3회',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 1.0, color: Color(0xFF38597E)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/chating',);
                    },
                    child: const Text("채팅", style: TextStyle(color: Color(0xFF38597E))),
                  ),
              ),
              const Divider(
                  indent: 90.0,
                  thickness: 1.0
              ),
            ],
          ),
        ),
      ),
    );
  }
}