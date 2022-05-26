import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search.dart';

class FindRoomPage extends StatefulWidget {
  const FindRoomPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FindRoomPage> createState() => _FindRoomPageState();
}

class _FindRoomPageState extends State<FindRoomPage> {
  TextEditingController splace = TextEditingController();
  TextEditingController fplace = TextEditingController();
  String pnselectedValue = '2';
  String scselectedValue1 = '14';
  String smselectedValue1 = '30';
  String scselectedValue2 = '14';
  String smselectedValue2 = '35';
  String scselectedValue3 = '14';
  String smselectedValue3 = '50';
  bool car = true;
  bool taxi = false;

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('방찾기', style: TextStyle(color: Colors.white),),
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
              child: const Text("검색", style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                Get.to(() => const SearchPage(title: ''));
            }),
          ],
        ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: const Text('탑승 차량', style: TextStyle(fontSize: 15.0)),
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
                        color: car ? const Color(0xFF98C9FF) : const Color(
                            0xFFF0EEEE),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)) //모서리를 둥글게
                    ),
                    child: TextButton(
                        child: const Text(
                            "카풀", style: TextStyle(fontSize: 15, color: Colors
                            .black)),
                        onPressed: () {
                          setState(() {
                            car = true;
                            taxi = false;
                          });
                        }),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                        color: taxi ? const Color(0xFF98C9FF) : const Color(
                            0xFFF0EEEE),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)) //모서리를 둥글게
                    ),
                    child: TextButton(
                        child: const Text(
                            "택시", style: TextStyle(fontSize: 15, color: Colors
                            .black)),
                        onPressed: () {
                          setState(() {
                            car = false;
                            taxi = true;
                          });
                        }),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: const Text('출발지', style: TextStyle(fontSize: 15.0)),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, left: 20.0, right: 20.0),
                child: TextField(
                  controller: splace,
                  decoration: const InputDecoration(
                    hintText: '출발 장소를 입력해주세요.',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: const Text('도착지', style: TextStyle(fontSize: 15.0)),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, left: 20.0, right: 20.0),
                child: TextField(
                  controller: fplace,
                  decoration: const InputDecoration(
                    hintText: '도착 장소를 입력해주세요.',
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
                      child: const Text('명')
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: const Text(
                    '출발 희망 시간', style: TextStyle(fontSize: 15.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
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
                      value: scselectedValue2,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          scselectedValue2 = newValue!;
                        });
                      },
                      items: <String>[
                        '07',
                        '08',
                        '09',
                        '10',
                        '11',
                        '12',
                        '13',
                        '14',
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23'
                      ]
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
                      child: const Text('시')
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
                      value: smselectedValue2,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          smselectedValue2 = newValue!;
                        });
                      },
                      items: <String>[
                        '00',
                        '05',
                        '10',
                        '15',
                        '20',
                        '25',
                        '30',
                        '35',
                        '40',
                        '45',
                        '50',
                        '55'
                      ]
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
                      child: const Text('분 부터')
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
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
                      value: scselectedValue3,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          scselectedValue3 = newValue!;
                        });
                      },
                      items: <String>[
                        '07',
                        '08',
                        '09',
                        '10',
                        '11',
                        '12',
                        '13',
                        '14',
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23'
                      ]
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
                      child: const Text('시')
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
                      value: smselectedValue3,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          smselectedValue3 = newValue!;
                        });
                      },
                      items: <String>[
                        '00',
                        '05',
                        '10',
                        '15',
                        '20',
                        '25',
                        '30',
                        '35',
                        '40',
                        '45',
                        '50',
                        '55'
                      ]
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
                      child: const Text('분 까지')
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