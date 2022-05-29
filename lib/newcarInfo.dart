import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class carInfo extends StatefulWidget {
  const carInfo({Key? key}) : super(key: key);

  @override
  State<carInfo> createState() => _carInfoState();
}

class _carInfoState extends State<carInfo> {
  File? _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var _user;
  Future<String>? _currImage;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String _profileImageURL = "";

  @override
  void initState() {
    super.initState();
    _prepareService();
    //_currImage = storeImage();
  }

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser!;
    if (_user == null) {
      print("NO login");
      return;
    }
  }

  Future<String> storeImage() async {
    //_prepareService();
    _user = await _firebaseAuth.currentUser!;
    final response = await _firebaseStorage
        .ref()
        .child("profile/${_user.uid}")
        .getDownloadURL();
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${response}");
    return response;
  }

  String imgData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cloud Storage test")),
      body: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("profile").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: const [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting mypage...'),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                print(snapshot.data);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Text(
                      'Error : ${snapshot.data}',
                    ),
                  ],
                );
              }
              if (snapshot.hasData) {
                for (final urlImg in snapshot.data!.docs) {
                  if (urlImg["userId"] ==
                      FirebaseAuth.instance.currentUser!.uid) {
                    imgData = urlImg["imageURL"].toString();
                  }
                  print("여기까지 오긴 했니");
                }
              }
              //(snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: (imgData == "")
                        ? const NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/600px-Gull_portrait_ca_usa.jpg")
                        : NetworkImage(imgData),
                    // (_image != null)
                    //     ? FileImage(_image!) as ImageProvider
                    //     : NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/600px-Gull_portrait_ca_usa.jpg"),
                    radius: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: Text("Gallery"),
                        onPressed: () {
                          _uploadImageToStorage(ImageSource.gallery);
                        },
                      ),
                      ElevatedButton(
                        child: Text("Camera"),
                        onPressed: () {
                          _uploadImageToStorage(ImageSource.camera);
                        },
                      )
                    ],
                  ),
                  Text('User id : ${_user.uid}'),
                ],
              );
            },
          )),
    );
  }

  Future addImage(final url) async {
    final findData = await FirebaseFirestore.instance.collection("profile").doc(FirebaseAuth.instance.currentUser!.uid).delete();

    await FirebaseFirestore.instance.collection("profile").doc(FirebaseAuth.instance.currentUser!.uid).set({
      "imageURL": url,
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
    print("씨발 모르겠다!!!!!!!!\n");
    final storageUploadTask = await storageReference.putFile(_image!);

    final response = await storeImage();
    await addImage(response);
  }
}
