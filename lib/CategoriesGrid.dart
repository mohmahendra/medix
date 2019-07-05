import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;

  choiceTitleGetter(){
    return this.title;
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'General Medical', icon: Icons.directions_boat),
  const Choice(title: 'Neurology', icon: Icons.directions_bike),
  const Choice(title: 'Orthopedics', icon: Icons.directions_transit),
  const Choice(title: 'Plastic Surgery', icon: Icons.directions_bus),
  const Choice(title: 'Cardiovascular', icon: Icons.directions_railway),
  const Choice(title: 'Cardiovascular', icon: Icons.directions_car),
  ];

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key key, this.choice}) : super(key : key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 40.0, color: textStyle.color),
            Text(choice.title, textAlign: TextAlign.center ,style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)), //textAlign: TextAlign.center,),),
          ],
        )
      ),
    );
  }
}