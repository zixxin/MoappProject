import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temp/explore.dart';
import 'registercar.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class CarImgController extends GetxController {
  final str = "".obs;

  void changed(final temp) {
    str.value = temp;
  }
}

class MyCarScreen extends StatefulWidget {
  const MyCarScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyCarScreen> createState() => MyCarScreenState();
}

class MyCarScreenState extends State<MyCarScreen> {
  final carImgController = Get.put(CarImgController());
  final carNumController = Get.put(ProImgController());
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내차관리',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF38597E),
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: const Text('차량 정보', style: TextStyle(fontSize: 15.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 30.0, right: 20.0),
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: Color(0xFF38597E),
                      borderRadius:
                          BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                      ),
                  child: IconButton(
                    icon: Obx(() {
                      return (carImgController.str.value == "")
                          ? const Icon(Icons.directions_car)
                          : CircleAvatar(
                              backgroundImage:
                                  NetworkImage(carImgController.str.value,),
                              radius: 60,
                              backgroundColor: Colors.transparent);
                    }),
                    color: Colors.white,
                    iconSize: 50.0,
                    onPressed: () {selectDialog();},
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: const Text(
                        '차량 번호',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      child: Obx(() {
                        return carNumController.carID.value == ""
                            ? const Text('챠랑번호 없음')
                            : Text(
                                carNumController.carID.value,
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 15),
                              );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, right: 20.0, bottom: 10.0),
                  width: 130,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xFF98C9FF),
                      borderRadius:
                          BorderRadius.all(Radius.circular(10)) //모서리를 둥글게
                      ),
                  child: TextButton(
                      child: const Text("정보 수정",
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: () {
                        Get.to(() => const RegisterCarScreen(title: ''));
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
              child: const Text('점검 및 청소 일자', style: TextStyle(fontSize: 15.0)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2021, 01, 01),
                lastDay: DateTime.utc(2023, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.

                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              ),
            ),
          ],
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
                onPressed: () {
                  Navigator.pop(context);
                  _uploadImageToStorage(ImageSource.camera);
                },
              )
            ],
          );
        });
  }

  Future<String> storeImage() async {
    final response = await _firebaseStorage
        .ref()
        .child("carImg/${FirebaseAuth.instance.currentUser!.uid}")
        .getDownloadURL();
    return response;
  }

  bool needDelExist = false;
  Future addImage(final url) async {
    final userInfo = FirebaseFirestore.instance
        .collection("carProfile")
        .doc(FirebaseAuth.instance.currentUser!.uid);

    userInfo.update({'imageURL': url});
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
    final storageReference = _firebaseStorage
        .ref()
        .child("carImg/${FirebaseAuth.instance.currentUser!.uid}");
    final storageUploadTask = await storageReference.putFile(_image!);

    final response = await storeImage();

    print(response);
    await addImage(response);
    carImgController.changed(response);
  }
}
