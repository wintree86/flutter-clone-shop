import 'package:flutter/material.dart';
import 'package:flutter_dating_app/screens/home/best_tab.dart';
import 'package:flutter_dating_app/screens/home/hotdeal_tab.dart';
import 'package:flutter_dating_app/screens/home/new_tab.dart';
import 'package:flutter_dating_app/screens/home/today_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: true,
                floating: true,
                title: Text('Header'),
                actions: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[100]),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Icon(Icons.search,
                                color: Colors.grey, size: 20),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '상품이나 마켓을 검색해보세요!',
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  isDense: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                ],
                bottom: TabBar(
                  tabs: [
                    Tab(text: '투데이'),
                    Tab(text: 'NEW'),
                    Tab(text: 'BEST'),
                    Tab(text: '핫딜'),
                  ],
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          children: [TodayTab(), NewTab(), BestTab(), HotdealTab()],
        ),
      ),
    );
  }
}
