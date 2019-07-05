import 'package:flutter/material.dart';
import 'package:compfest_aic_2019/StringContent.dart';

class Service {
  const Service({this.title, this.quickDetails, this.procedure, this.gallery});

  final String title, quickDetails, procedure;
  final Image gallery;

  Widget detailsTabBarView() => TabBarView(
    children: <Widget>[
      ListView(
        children: <Widget>[
          Container(
            height: 20.0,
          ),
          scrollableGallery(),
          longText(),
        ],
      ),
      Text("You too")
    ]
  );

  Widget scrollableGallery() => Container(
    height: 150.0,
    child: Column(
      children: <Widget>[
        Text(
          "Gallery",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Buat Scrollable Image View (Slider)
        SizedBox(
          height: 100.0,
          child: Image.asset(
            "assets/medix.png",
            fit: BoxFit.contain,
          ),
        )
      ],
    )
  );

  Widget longText() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        'Quick Details',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        StringContent().hairtransplantqd,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
  ],
);

}

const List<Service> services = const <Service>[
    const Service(title: 'Hair Transplant', quickDetails:"" , procedure: ""),
    const Service(title: 'Lip Reduction', quickDetails:"" , procedure: ""),
    const Service(title: 'Breast Implant', quickDetails:"" , procedure: "")
];