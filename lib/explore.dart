import 'dart:io';
import 'newchat.dart';
import 'login.dart';
import 'makeroom.dart';
import 'findroom.dart';
import 'search.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ExploreScreen> createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {

  File? _image ;
  var _user;
  String imgData = "";
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _prepareService();
  }

  @override
  Widget build(BuildContext context) {
    final fb = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF38597E),
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("profile").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

              if(snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting Page...'),
                    )
                  ],
                );
              }

              if(snapshot.hasError) {
                print(snapshot.data) ;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Text(
                      'Error : data is ${snapshot.data}',
                    ),
                  ],
                ) ;
              }

              if(snapshot.hasData) {
                for(final urlImg in snapshot.data!.docs) {
                  if(urlImg["userId"] == _firebaseAuth.currentUser!.uid) {
                    imgData = urlImg["imageURL"].toString() ;
                  }
                }
              }
              return Column(
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
                          icon: (imgData == "") ? const Icon(Icons.person) : Image.network(imgData),
                          color: Colors.white,
                          iconSize: 45.0,
                          onPressed: () => selectDialog(),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                            child: Text(
                              name_user,
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                              Get.to(() => const SearchPage(title: ''));
                            }),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1.0,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 10.0, left: 20.0),
                    child: const Text('근처 곧 마감되는 카풀', style: TextStyle(fontSize: 15.0)),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('rooms').orderBy('hour', descending: false).snapshots(),
                      builder: (context, snapshot) {
                        return Container(
                          height: 110,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 1,
                            itemBuilder: (ctx, index) => Container(
                              margin: const EdgeInsets.only(top: 5.0, left: 15.0, right: 5.0),
                              child: Row(
                                children: [
                                  DataTable(
                                    columnSpacing: 40.0,
                                    columns: const [
                                      DataColumn(label: Text('출발지', style: TextStyle(fontWeight: FontWeight.bold))),
                                      DataColumn(label: Text('목적지', style: TextStyle(fontWeight: FontWeight.bold))),
                                      DataColumn(label: Text('출발시간', style: TextStyle(fontWeight: FontWeight.bold))),
                                      DataColumn(label: Text('더보기', style: TextStyle(fontWeight: FontWeight.bold))),
                                    ],
                                    rows: [
                                      DataRow(
                                          cells: [
                                            DataCell(Container(
                                              alignment: Alignment.center,
                                              width: 45,
                                              height: 40,
                                              child: Text(
                                                snapshot.data?.docs[index]['start place'],
                                                style: const TextStyle(fontSize: 12.0),
                                                maxLines: 2,
                                              ),),),
                                            DataCell(Container(
                                              alignment: Alignment.center,
                                              width: 45,
                                              height: 40,
                                              child: Text(
                                                snapshot.data?.docs[index]['finish place'],
                                                style: const TextStyle(fontSize: 12.0),
                                                maxLines: 2,
                                              ),),),
                                            DataCell(Container(
                                              alignment: Alignment.center,
                                              width: 45,
                                              height: 40,
                                              child: Text(
                                                '${snapshot.data?.docs[index]['hour']}:${snapshot.data?.docs[index]['minute']}',
                                                style: const TextStyle(fontSize: 12.0),
                                                maxLines: 1,
                                              ),),),
                                            DataCell(Container(
                                              width: 55,
                                              height: 40,
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(width: 1.0, color: Color(0xFF38597E)),
                                                ),
                                                onPressed: () {
                                                  Navigator.pushNamed(context, '/chating',);
                                                },
                                                child: const Text("채팅", style: TextStyle(fontSize: 12.0, color: Color(0xFF38597E))),
                                              ),),),
                                          ]
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 10.0),
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
              );
            }
        ),
      ),
    );
  }

  void selectDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: const <Widget>[
                Text("이미지 선택"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "이미지를 가져올 곳을 선택해주세요.",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("갤러리"),
                onPressed: () {
                  Navigator.pop(context);
                  _uploadImageToStorage(ImageSource.gallery);
                },
              ),
              TextButton(
                child: const Text("카메라"),
                onPressed: (){
                  Navigator.pop(context);
                  _uploadImageToStorage(ImageSource.camera);
                },
              )
            ],
          );
        });
  }

  void _prepareService() async {
    _user = FirebaseAuth.instance.currentUser!;
    if(_user == null) {
      print("No login!");
      return;
    }
  }

  Future<String> storeImage() async {
    _user = await _firebaseAuth.currentUser!;
    final response = await _firebaseStorage
        .ref().child("profile/${_user.uid}").getDownloadURL();

    return response ;
  }

  Future addImage(final url) async {
    final findData = await FirebaseFirestore.instance
        .collection("profile").doc(_firebaseAuth.currentUser!.uid).delete();

    await FirebaseFirestore.instance.collection("profile")
        .doc(_firebaseAuth.currentUser!.uid).set({
      'imageURL': url,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'email': FirebaseAuth.instance.currentUser!.email,
    });
  }

  Future<void> _uploadImageToStorage(ImageSource source) async {
    final _picker = ImagePicker();
    final image = await ImagePicker.platform.getImage(source: source);
    //ImagePicker.platform.getImage(source: source);

    if (image == null) return;
    setState(() {
      _image = File(image.path);
      print(_image);
    });

    final storageReference =
    _firebaseStorage.ref().child("profile/${_user.uid}");

    final storageUploadTask = await storageReference.putFile(_image!);

    final response = await storeImage();
    await addImage(response);
  }
}