import 'package:flutter/material.dart';
import 'more.dart';
import 'package:get/get.dart';
import 'explore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('검색 결과', style: TextStyle(color: Colors.white),),
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
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              DataTable(
                columnSpacing: 45.0,
                columns: const [
                  DataColumn(label: Text('출발지')),
                  DataColumn(label: Text('목적지')),
                  DataColumn(label: Text('출발시간')),
                  DataColumn(label: Text('더보기')),
                ],
                rows: [
                  DataRow(
                      cells: [
                        const DataCell(Text('taxi stop')),
                        const DataCell(Text('pohang univ')),
                        const DataCell(Text('13:30')),
                        DataCell(Container(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(width: 1.0, color: Color(0xFF38597E)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/chating',);
                            },
                            child: const Text("채팅", style: TextStyle(color: Color(0xFF38597E))),
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
  }
}