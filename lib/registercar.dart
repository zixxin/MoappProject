import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCarScreen extends StatefulWidget {
  const RegisterCarScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RegisterCarScreen> createState() => RegisterCarScreenState();
}

class RegisterCarScreenState extends State<RegisterCarScreen> {
  TextEditingController carnum = TextEditingController();
  TextEditingController fplace = TextEditingController();
  String pnselectedValue = '2';
  String scselectedValue1 = '14';
  String smselectedValue1 = '30';
  bool lent = true;
  bool mine = false;

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('내차등록', style: TextStyle(color: Colors.white),),
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
        actions: <Widget>[
          TextButton(
              child: const Text(
                  "완료", style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                Get.back();
              }),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: const Text('차량 종류', style: TextStyle(fontSize: 15.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                        color: lent ? const Color(0xFF98C9FF) : const Color(
                            0xFFF0EEEE),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)) //모서리를 둥글게
                    ),
                    child: TextButton(
                        child: const Text(
                            "리스", style: TextStyle(fontSize: 15, color: Colors
                            .black)),
                        onPressed: () {
                          setState(() {
                            lent = true;
                            mine = false;
                          });
                        }),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                        color: mine ? const Color(0xFF98C9FF) : const Color(
                            0xFFF0EEEE),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)) //모서리를 둥글게
                    ),
                    child: TextButton(
                        child: const Text(
                            "자가", style: TextStyle(fontSize: 15, color: Colors
                            .black)),
                        onPressed: () {
                          setState(() {
                            lent = false;
                            mine = true;
                          });
                        }),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: const Text('차량번호', style: TextStyle(fontSize: 15.0)),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, left: 20.0, right: 20.0),
                child: TextField(
                  controller: carnum,
                  decoration: const InputDecoration(
                    hintText: '차량 번호를 입력해주세요.',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                    child: const Text(
                        '탑승 가능 인원', style: TextStyle(fontSize: 15.0)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xFFF0EEEE),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)) //모서리를 둥글게
                    ),
                    margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: DropdownButton<String>(
                      iconSize: 30.0,
                      value: pnselectedValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          pnselectedValue = newValue!;
                        });
                      },
                      items: <String>['1', '2', '3', '4', '5']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 30.0, left: 10.0),
                      child: const Text('인승')
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: const Text(
                        '보험 여부', style: TextStyle(fontSize: 15.0)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, right: 20.0),
                    child: const SwitchWidget(),
                  ),
                ],
              ),
              const Divider(
                  indent: 20.0,
                  endIndent: 20.0,
                  thickness: 1.0
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                        '면허증 등록', style: TextStyle(fontSize: 15.0)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: const SwitchWidget(),
                  ),
                ],
              ),
              const Divider(
                  indent: 20.0,
                  endIndent: 20.0,
                  thickness: 1.0
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                        '차량 사진 등록', style: TextStyle(fontSize: 15.0)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: const SwitchWidget(),
                  ),
                ],
              ),
              const Divider(
                  indent: 20.0,
                  endIndent: 20.0,
                  thickness: 1.0
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                        '개인정보 이용 동의', style: TextStyle(fontSize: 15.0)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: const SwitchWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  SwitchWidgetClass createState() => SwitchWidgetClass();
}

class SwitchWidgetClass extends State {
  bool switchControl = false;

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;

      });
    } else {
      setState(() {
        switchControl = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
              scale: 1.5,
              child: Switch(
                onChanged: toggleSwitch,
                value: switchControl,
                activeColor: Colors.white,
                activeTrackColor: const Color(0xFF38597E),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[350],
              )),
        ]);
  }
}