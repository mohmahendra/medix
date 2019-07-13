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
      ),
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


class ThreeLineCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final appBarColorleft = const Color(0xFF56E7A5);
  final appBarColorRight = const Color(0xFF30D7D7);

  const ThreeLineCustomAppBar({
    Key key,
    @required this.height
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [appBarColorleft, appBarColorRight]
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 20, 8),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
              child: Text(
                'BOOK AN APPOINTMENT',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: Text(
                'Search for a surgery',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white
                ),
              ),
            ),
          ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}