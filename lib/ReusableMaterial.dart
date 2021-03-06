import 'package:flutter/material.dart';

class ReusableMaterial {
  final primaryColorLeft = const Color(0xFF56E7A5);
  final primaryColorRight = const Color(0xFF30D7D7);

  getAppBar(String titleAB) {
    return AppBar(
      title: Text(titleAB, style: TextStyle(color: Colors.white, fontSize: 24)),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [primaryColorLeft, primaryColorRight],
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
            colors: [primaryColorLeft, primaryColorRight]
          )
        ),
      ),
    );
  }

  getTextFormField(String label, String hint) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter Some Text';
        }
        return null;
      }
    );
  }

  getNumberFormField(String label, String hint) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter Some Number';
        }
        return null;
      }
    );
  }

  getEmailFormField(String label, String hint) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Some Number';
          }
          return null;
        }
    );
  }

  getDateTimeFormField(String label, String hint) {
    return TextFormField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Some Number';
          }
          return null;
        }
    );
  }

  getWhiteTextStyle(double size) {
    return TextStyle(
      fontSize: size,
      color: Colors.white
    );
  }
}


class ThreeLineCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String upperText, lowerText;
  final bool transparent;
  final appBarColorleft = const Color(0xFF56E7A5);
  final appBarColorRight = const Color(0xFF30D7D7);

  const ThreeLineCustomAppBar({
    Key key,
    @required this.height,
    @required this.upperText,
    @required this.lowerText,
    @required this.transparent,
  }) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: getColor()
          ),
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
                  upperText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                child: Text(
                  lowerText,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }

  List<Color> getColor() {
    if (transparent == true) {
      return [Colors.transparent, Colors.transparent];
    }
    else {
      return [ReusableMaterial().primaryColorLeft, ReusableMaterial().primaryColorRight];
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}