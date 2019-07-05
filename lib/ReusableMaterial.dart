import 'package:flutter/material.dart';

class ReusableMaterial {
  final appBarColorleft = const Color(0xFF56E7A5);
  final appBarColorRight = const Color(0xFF30D7D7);

  getAppBar(String titleAB) {
    return AppBar(
      title: Text(titleAB, style: TextStyle(color: Colors.white, fontSize: 24)),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [appBarColorleft,appBarColorRight]
          )
        ),
      )
    );
  }

  getAppBarWithTabBar(String titleAB) {
    return AppBar(
      title: Text(titleAB, style: TextStyle(color: Colors.white, fontSize: 24)),
      centerTitle: true,
      bottom: TabBar(
        tabs: <Widget>[
          Tab(text: "Details",),
          Tab(text: "Hospital",)
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [appBarColorleft, appBarColorRight]
          )
        ),
      ),
    );
  }
}