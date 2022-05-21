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
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                child: const Text("내차등록", style: TextStyle(fontSize: 30, color: Colors.red)),
                onPressed: (){
                  Get.to(() => const RegisterCarScreen(title: ''));
                  // FirebaseAuth.instance.signOut,
                }),
          ],
        ),
      ),
    );
  }
}
