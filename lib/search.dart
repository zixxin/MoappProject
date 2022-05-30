import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: const Text('방 찾기', style: TextStyle(color: Colors.white),),
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
        bottom: PreferredSize(
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey[50],
              height: 50.0,
              child: DataTable(
              columnSpacing: 40.0,
              columns: const [
                DataColumn(label: Text('출발지', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('목적지', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('출발시간', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('더보기', style: TextStyle(fontWeight: FontWeight.bold))),
                ], rows: [],
            ),
            ),
        preferredSize: const Size.fromHeight(50.0)),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('rooms').orderBy('hour', descending: false).snapshots(),
          builder: (context, snapshot) {
            return Container(
              height: 1000,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (ctx, index) => Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                  child: Row(
                    children: [
                      DataTable(
                        columnSpacing: 40.0,
                        columns: [
                          DataColumn(label: Container(width: 10.0)),
                          DataColumn(label: Container(width: 10.0)),
                          DataColumn(label: Container(width: 10.0)),
                          DataColumn(label: Container(width: 10.0)),
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
    );
  }
}