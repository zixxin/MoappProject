import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'login.dart';

bool isEdit = false;
TextEditingController _editingController =TextEditingController(text: initialText);
String initialText = "";

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

bool toggle = false;

class _ChatPageState extends State<ChatPage> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    String chats = "";
    String local_chats = "";
    final fb = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('한동익명녀',
            style: TextStyle(
                color: Colors.black
            )
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            color: const Color(0xFF38597E),
            iconSize: 28.0,
            onPressed: () => {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: fb
                  .collection("chats")
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    if ((snapshot.data?.docs[index]['userId'] == uid_google)) {
                      String chats = (snapshot.data?.docs[index]['text']).toString();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 15, 10, 5),
                            child: Row(children: [
                              Container(
                                margin: const EdgeInsets.only(top: 30.0, left: 5.0),
                                child:Text((snapshot.data?.docs[index]['timestamp']).toString(),
                                    style: const TextStyle(color: Colors.grey, fontSize: 10.0)),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                margin: const EdgeInsets.only(right: 5.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(chats, style: const TextStyle(color: Colors.white)),
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF38597E),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                ),
                              )
                            ]),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 15, 10, 5),
                            child: Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text((snapshot.data?.docs[index]['text']).toString()),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    margin: const EdgeInsets.only(top: 30.0, left: 5.0),
                                    child:Text((snapshot.data?.docs[index]['timestamp']).toString(),
                                        style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 15.0, bottom: 10.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: const Color(0xFF38597E),
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        fillColor: Colors.white,
                        hintText: '메세지를 입력하세요',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '메세지를 입력하세요';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: new Icon(Icons.emoji_people_rounded),
                    color: Color(0xFF38597E),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await addMessage(_controller.text);
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
  }

  Future addMessage(String text) async {
    await FirebaseFirestore.instance.collection("chats").add({
      "text": text,
      //'timestamp': DateTime.now().millisecondsSinceEpoch*1000,
      'timestamp': DateFormat('yyyy-MM-dd HH:mm:ss.sss').format(DateTime.now()),
          //.add(new Duration(hours: 9))),
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'email': FirebaseAuth.instance.currentUser!.email,
    });
  }

}