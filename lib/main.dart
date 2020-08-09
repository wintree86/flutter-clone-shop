import 'package:flutter/material.dart';
import 'package:flutter_dating_app/screens/favorite/favorite_screen.dart';
import 'package:flutter_dating_app/screens/home/home_screen.dart';
import 'package:flutter_dating_app/screens/market/market_screen.dart';
import 'package:flutter_dating_app/screens/mypage/mypage_screen.dart';
import 'package:flutter_dating_app/screens/style/style_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  List<Widget> _tabs = [
    HomeScreen(),
    MarketScreen(),
    MypageScreen(),
    StyleScreen(),
    FavoriteScreen()
  ];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('홈')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), title: Text('스타일')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.shop), title: Text('마켓')),
          new BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('찜')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('마이페이지')),
        ],
      ),
    );
  }
}
