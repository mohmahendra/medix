import 'package:flutter/material.dart';
import 'package:compfest_aic_2019/StringContent.dart';

class ServiceDetails {
  const ServiceDetails({this.title, this.quickDetails, this.procedure, this.gallery});

  final String title, quickDetails, procedure;
  final Image gallery;

  Widget longText() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        'Produce',
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
    )
  ],
);

}

const List<ServiceDetails> services = const <ServiceDetails>[
    const ServiceDetails(title: 'Hair Transplant', quickDetails:"" , procedure: ""),
    const ServiceDetails(title: 'Lip Reduction', quickDetails:"" , procedure: ""),
    const ServiceDetails(title: 'Breast Implant', quickDetails:"" , procedure: "")
];

Widget _buildCard() => SizedBox(
    height: 210,
    child: Card(
      child:ListTile(
        leading: FlutterLogo(size: 30.0),
        title: Text('Hair Transplant'),
        subtitle: Text('Hair Transplant is abluablu, research on progress'),
      ),
    ),
  );