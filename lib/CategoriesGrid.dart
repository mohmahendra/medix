import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon, this.listChild});

  final String title;
  final IconData icon;
  final List listChild;

  choiceTitleGetter(){
    return this.title;
  }

  choiceListLength(){
    return this.listChild.length;
  }

  choiceListGetter(int x){
    return this.listChild[x];
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'General Medical', icon: Icons.directions_boat,
  listChild: ['General Checkup', 'X-Ray', 'Blood Test']),
  const Choice(title: 'Neurology', icon: Icons.directions_bike,
  listChild: ['Epilepsy Surgery', 'Parkinson Surgery', 'Brain Therapy']),
  const Choice(title: 'Orthopedics', icon: Icons.directions_transit,
  listChild: ['Hand Join Replacement', 'Hip Replacement', 'Spinal Surgery']),
  const Choice(title: 'Plastic Surgery', icon: Icons.directions_bus,
  listChild: ['Hair Transplant', 'Lip Reduction', 'Breast Implant']),
  const Choice(title: 'Cardiovascular', icon: Icons.directions_railway,
  listChild: ['Aortic Valve Replacement', 'ASD Surgery', 'Stress Echocardiogram']),
  const Choice(title: 'Cardiovascular', icon: Icons.directions_car,
  listChild: ['Aortic Valve Replacement', 'ASD Surgery', 'Stress Echocardiogram']),
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
            Text(choice.title, textAlign: TextAlign.center ,style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)),
          ],
        )
      ),
    );
  }
}