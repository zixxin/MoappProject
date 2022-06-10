import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController userLicense = TextEditingController();
TextEditingController userName = TextEditingController();
TextEditingController userIdName = TextEditingController();
TextEditingController userDate = TextEditingController();

class CarInfoController extends GetxController {
  bool CarInfoComplete = false;

  void initialState() {
    CarInfoComplete = false;
    update();
  }

  void changeState() {
    CarInfoComplete = true;
    update();
  }
}

class carInfo extends StatefulWidget {
  const carInfo({Key? key, required String title}) : super(key: key);

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
  List<String> printText = [] ;
  final _formKey = GlobalKey<FormState>();

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
    final controller = Get.put(CarInfoController());

    return Form(
      key: _formKey,
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("면허증 등록")),
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
                controller.initialState();
                //(snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30,),
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
                            printText.clear();
                            _uploadImageToStorage(ImageSource.gallery);
                            setState(() {});
                            //selectDialog(printText);
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
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                      child: const Text('운전면허증 번호', style: TextStyle(fontSize: 15.0)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: userLicense,
                        decoration: const InputDecoration(
                          hintText: "사용자 운전면허증 번호",
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) return '운전면허증 번호를 입력해주세요.';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                      child: const Text('이름', style: TextStyle(fontSize: 15.0)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: userName,
                        decoration: const InputDecoration(
                          hintText: "사용자 이름",
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) return '성함을 입력해주세요';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                      child: const Text('주민등록번호', style: TextStyle(fontSize: 15.0)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: userIdName,
                        decoration: const InputDecoration(
                          hintText: "사용자 주민등록번호 앞 7자리",
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) return '주민등록번호 앞 7자리를 입력해주세요';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                      child: const Text('적성검사 기간', style: TextStyle(fontSize: 15.0)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: userDate,
                        decoration: const InputDecoration(
                          hintText: "사용자 적성검사 기간",
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) return '적성검사 기간을 입력해주세요.';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(60,30,60,0),
                      child: ElevatedButton(
                        child: Text("확인"),
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            controller.changeState();
                            Get.back();
                          }
                        },
                      ),
                    )
                  ],
                );
              },
            )),
      ),
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
    List<String> recogText = [] ;
    //ImagePicker.platform.getImage(source: source);

    if (image == null) return;
    setState(() {
      _image = File(image.path);
      print(_image);
    });

    final InputImage inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);

    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    String tttt = recognizedText.text;
    print("@@" + tttt) ;
    for (TextBlock block in recognizedText.blocks) {
      final String test = block.text;

      for (TextLine line in block.lines) {
        final String text = line.text;
        recogText.add(text);
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }

    bool savingText = false;
    int cntSave = 3 ;
    for(String temp in recogText) {
      if(temp.isCaseInsensitiveContainsAny("운전")) {
        savingText = true ;
        continue;
        print("@#@#@#@#@#@#");
      }
      if(temp.isCaseInsensitiveContainsAny("적성")) {
        printText.add(temp.substring(temp.lastIndexOf(RegExp('적성검사'))+5,).trim());
        print(temp+"@@@@");
      }
      if(temp.isCaseInsensitiveContainsAny("기간")) {
        printText.add(temp.substring(temp.lastIndexOf(RegExp('기간'))+3,));
        print(temp+"@@@@!!!!");
      }
      if(savingText) {
        if(cntSave == 1) {
          int lastIdx = 6 ;
          temp = temp.trim();
          String resultText = temp.replaceRange(temp.length - 6, temp.length, '*' * 6);
          print(resultText + "AQAAAAAAAAAAAAAAAA");
          printText.add(resultText);
        }
        else {
          printText.add(temp);
        }

        print(temp+"@@@@####" + cntSave.toString());
        cntSave--;
      }
      if(cntSave == 0) savingText = false ;
    }
    print(printText.length.toString() + "@@");
    selectDialog(printText);
    // final storageReference =
    // _firebaseStorage.ref().child("profile/${_user.uid}");
    // print("씨발 모르겠다!!!!!!!!\n");
    // final storageUploadTask = await storageReference.putFile(_image!);
    //
    // final response = await storeImage();
    // await addImage(response);
  }

  void selectDialog(List<String> pl) {
    List<String> name = ['일련번호', '이름', '주민등록번호', '적성검사 기간'];
    List<TextEditingController> changeText = [userLicense, userName, userIdName, userDate] ;
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
                Text("인식된 운전면허증"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: pl.length,
                    itemBuilder: (context, index) {
                      return Text(name[index] + ": " + pl[index]);
                    }
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text("수정"),
                onPressed: () {
                  for(int i = 0 ; i < pl.length ; i++) {
                    changeText[i].text = pl[i];
                    changeText[i].selection = TextSelection.fromPosition(
                      TextPosition(offset: changeText[i].text.length),
                    );
                  }
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
