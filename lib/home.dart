import 'package:flutter/material.dart';
import 'package:temp/newcarInfo.dart';
import 'chat/chat.dart';
import 'explore.dart';
import 'mycar.dart';
import 'more.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> screen = [
    const ExploreScreen(title: ''),
    const ChatScreen(title: ''),
    const MyCarScreen(title: ''),
    const MoreScreen(title: '')
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        selectedItemColor: const Color(0xFF38597E),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _currentIndex, //현재 선택된 Index
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            label: '탐색하기',
            icon: Icon(Icons.location_searching_rounded, size: width * 0.08),
          ),
          BottomNavigationBarItem(
            label: '나와같이',
            icon: Icon(Icons.emoji_people_rounded, size: width * 0.08),
          ),
          BottomNavigationBarItem(
            label: '내차관리',
            icon: Icon(Icons.local_taxi_rounded, size: width * 0.08),
          ),
          BottomNavigationBarItem(
            label: '더보기',
            icon: Icon(Icons.more_horiz_rounded, size: width * 0.08),
          ),
        ],
      ),
      body: screen[_currentIndex],
    );
  }
}
