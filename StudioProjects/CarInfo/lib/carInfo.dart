import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class carInfo extends StatefulWidget {
  const carInfo({Key? key}) : super(key: key);
  
  @override
  State<carInfo> createState() => _carInfoState() ;
}

class _carInfoState extends State<carInfo> {
  File? _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var _user;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String _profileImageURL = "";

  void initState() {
    super.initState();
    _prepareService();
  }

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser!;
    if(_user == null) {
      print("NO login"); return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cloud Storage test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:
              (_image != null)
                  ? FileImage(_image!) as ImageProvider
                  : NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/600px-Gull_portrait_ca_usa.jpg"),
              // ? FileImage(File(_image!.path)) as ImageProvider : Text("NO IMAGE")
              //? NetworkImage("") : NetworkImage(""),
              radius: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Gallery"),
                  onPressed: () {
                    _uploadImageToStorage(ImageSource.gallery);
                  },
                ),
                RaisedButton(
                  child: Text("Camera"),
                  onPressed: () {
                    _uploadImageToStorage(ImageSource.camera);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _uploadImageToStorage(ImageSource source) async {
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

    final storageUploadTask = storageReference.putFile(_image!);
  }
}