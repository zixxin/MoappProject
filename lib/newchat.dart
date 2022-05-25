import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/chat',);
          },
        ),
        title: const Text('대화방',
            style: TextStyle(
                color: Colors.white
            )
        ),
        backgroundColor: const Color(0xFF38597E),
        centerTitle: true,
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
                              Text((snapshot.data?.docs[index]['timestamp']).toString()),
                              const SizedBox(width: 8),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(chats),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
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
                                  Text((snapshot.data?.docs[index]['name']).toString()),
                                  const SizedBox(width: 8),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text((snapshot.data?.docs[index]['text']).toString()),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text((snapshot.data?.docs[index]['timestamp']).toString()),
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
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintText: '메세지를 입력하세요',
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
                    icon: new Icon(Icons.arrow_upward),
                    color: Colors.blue,
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