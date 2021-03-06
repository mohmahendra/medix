import 'package:compfest_aic_2019/CategoriesGrid.dart';
import 'package:compfest_aic_2019/ReusableMaterial.dart';
import 'package:compfest_aic_2019/Service.dart';
import 'package:compfest_aic_2019/StringContent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert' as convert;


//datetime_picker_formfield 0.4.0 author Jacob Phillips
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compfest Demo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  Future timer() async {
    //Todo Buat Timer Logo Screen 3-5 detik
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: GestureDetector(
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.centerRight,
                            colors: [
                              ReusableMaterial().primaryColorLeft,
                              ReusableMaterial().primaryColorRight
                            ]
                        )
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DashboardPage()),
              );
            },
          ),
        ),
        Center(
            child: SizedBox(
          height: 100.0,
          child: Image.asset(
            "assets/medix.png",
            fit: BoxFit.fill,
          ),
        ))
      ],
    ));
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo beresin appbar di page ini
//      appBar: ThreeLineCustomAppBar(
//          height: 150,
//          upperText: "YOUR DASHBOARD",
//          lowerText: "Have a healthy life!"
//      ),
      body: Stack(
        children: <Widget>[
          Center(
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.centerRight,
                          colors: [
                            ReusableMaterial().primaryColorLeft,
                            ReusableMaterial().primaryColorRight
                          ]
                      )
                  ),
                ),
              )
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ThreeLineCustomAppBar(
              height: 150,
              upperText: "YOUR DASHBOARD",
              lowerText: "Have a healthy life!",
              transparent: true,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 170,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text("Your Appoinment",
                        style: ReusableMaterial().getWhiteTextStyle(20)),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 180,
                width: 370,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Text(
                      "You Don't Have Any Appoinment",
                      style: ReusableMaterial().getWhiteTextStyle(24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text("News For You",
                        style: ReusableMaterial().getWhiteTextStyle(20)),
                  ),
                  Container(
                    width: 160,
                  ),
                  Text("Explore Article",
                      style: ReusableMaterial().getWhiteTextStyle(14))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlutterLogo(size: 100,),
                          Text(
                            "Kenapa Kita Harus Meminum Ibuprofen",
                            textAlign: TextAlign.center,
                            style: ReusableMaterial().getWhiteTextStyle(14),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsRouteIbuprofen())
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlutterLogo(size: 100,),
                          Text(
                            "Efek Samping Minuman Berkarbonasi",
                            textAlign: TextAlign.center,
                            style: ReusableMaterial().getWhiteTextStyle(14),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsRouteCarbonate())
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  height: 40,
                  minWidth: 380,
                  child: RaisedButton(
                      child: Text("Book New Appoinment",
                          style: ReusableMaterial().getWhiteTextStyle(20)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListCategoriesPage()));
                      }),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                child: ListTile(
                  leading: FlutterLogo(size: 40),
                  title: Text("Dashboard", style: TextStyle(fontSize: 20),),
                  subtitle: Text("Your Overview", style: TextStyle(fontSize: 12),),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage())
                  );
                }
            ),
            GestureDetector(
              child: ListTile(
                leading: FlutterLogo(size: 40),
                title: Text("Browse Surgery", style: TextStyle(fontSize: 20),),
                subtitle: Text("Find Your Next Surgery", style: TextStyle(fontSize: 12),),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListCategoriesPage())
                );
              },
            ),
            GestureDetector(
              child: ListTile(
                leading: FlutterLogo(size: 40),
                title: Text("My Appoinment", style: TextStyle(fontSize: 20),),
                subtitle: Text("History and Upcoming Appoinment", style: TextStyle(fontSize: 12),),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentRoute())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class DashboardPageHC extends StatefulWidget {
  @override
  _DashboardPageHCState createState() => _DashboardPageHCState();
}

class _DashboardPageHCState extends State<DashboardPageHC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.centerRight,
                          colors: [
                            ReusableMaterial().primaryColorLeft,
                            ReusableMaterial().primaryColorRight
                          ]
                      )
                  ),
                ),
              )
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ThreeLineCustomAppBar(
              height: 150,
              upperText: "YOUR DASHBOARD",
              lowerText: "Have a healthy life!",
              transparent: true,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 170,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text("Your Appoinment",
                        style: ReusableMaterial().getWhiteTextStyle(20)),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 180,
                width: 370,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  children: <Widget>[
                    FlutterLogo(size: 125),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                          child: Text("RSPP", style: TextStyle(fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                          child: Text("July 28, 16.00", style: TextStyle(fontSize: 27)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                          child: Text("Lip Reduction", style: TextStyle(fontSize: 27)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text("News For You",
                        style: ReusableMaterial().getWhiteTextStyle(20)),
                  ),
                  Container(
                    width: 160,
                  ),
                  Text("Explore Article",
                      style: ReusableMaterial().getWhiteTextStyle(14))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlutterLogo(size: 100,),
                          Text(
                            "Kenapa Kita Harus Meminum Ibuprofen",
                            textAlign: TextAlign.center,
                            style: ReusableMaterial().getWhiteTextStyle(14),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsRouteIbuprofen())
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlutterLogo(size: 100,),
                          Text(
                            "Efek Samping Minuman Berkarbonasi",
                            textAlign: TextAlign.center,
                            style: ReusableMaterial().getWhiteTextStyle(14),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsRouteCarbonate())
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  height: 40,
                  minWidth: 380,
                  child: RaisedButton(
                      child: Text("Book New Appoinment",
                          style: ReusableMaterial().getWhiteTextStyle(20)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListCategoriesPage()));
                      }),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                child: ListTile(
                  leading: FlutterLogo(size: 40),
                  title: Text("Dashboard", style: TextStyle(fontSize: 20),),
                  subtitle: Text("Your Overview", style: TextStyle(fontSize: 12),),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage())
                  );
                }
            ),
            GestureDetector(
              child: ListTile(
                leading: FlutterLogo(size: 40),
                title: Text("Browse Surgery", style: TextStyle(fontSize: 20),),
                subtitle: Text("Find Your Next Surgery", style: TextStyle(fontSize: 12),),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListCategoriesPage())
                );
              },
            ),
            GestureDetector(
              child: ListTile(
                leading: FlutterLogo(size: 40),
                title: Text("My Appoinment", style: TextStyle(fontSize: 20),),
                subtitle: Text("History and Upcoming Appoinment", style: TextStyle(fontSize: 12),),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentRoute())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class AppointmentRoute extends StatefulWidget {
  @override
  _AppointmentRouteState createState() => _AppointmentRouteState();
}

class _AppointmentRouteState extends State<AppointmentRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.centerRight,
                          colors: [
                            ReusableMaterial().primaryColorLeft,
                            ReusableMaterial().primaryColorRight
                          ]
                      )
                  ),
                ),
              )
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ThreeLineCustomAppBar(
              height: 150,
              upperText: "YOUR APPOINMENT",
              lowerText: "You Have 1 Upcoming Appoinment",
              transparent: true,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Container(
                  alignment: Alignment.center,
                  height: 180,
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: <Widget>[
                      FlutterLogo(size: 125),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                            child: Text(
                                "RSPP",
                                style: ReusableMaterial().getWhiteTextStyle(30)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 8, 4),
                            child: Text(
                                "July 28, 16.00",
                                style: ReusableMaterial().getWhiteTextStyle(25)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 8, 8),
                            child: Text(
                                "Lip Reduction",
                                style: ReusableMaterial().getWhiteTextStyle(25)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 8, 4),
                            child: Text("Cancel", style: TextStyle(fontSize: 25, color: Colors.red),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text("YOUR PAST APPOINMENT",
                        style: ReusableMaterial().getWhiteTextStyle(20)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
                child: Container(
                  alignment: Alignment.center,
                  height: 180,
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: <Widget>[
                      FlutterLogo(size: 125),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                            child: Text("RSPP", style: TextStyle(fontSize: 30)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 8, 4),
                            child: Text("July 20, 13.00", style: TextStyle(fontSize: 25)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 8, 8),
                            child: Text("Hair Transplant", style: TextStyle(fontSize: 25)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 8, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children:[
                                Icon(Icons.star,),
                                Icon(Icons.star,),
                                Icon(Icons.star,),
                                Icon(Icons.star,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                child: ListTile(
                  leading: FlutterLogo(size: 40),
                  title: Text("Dashboard", style: TextStyle(fontSize: 20),),
                  subtitle: Text("Your Overview", style: TextStyle(fontSize: 12),),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage())
                  );
                }
            ),
            GestureDetector(
              child: ListTile(
                leading: FlutterLogo(size: 40),
                title: Text("Browse Surgery", style: TextStyle(fontSize: 20),),
                subtitle: Text("Find Your Next Surgery", style: TextStyle(fontSize: 12),),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListCategoriesPage())
                );
              },
            ),
            ListTile(
              leading: FlutterLogo(size: 40),
              title: Text("My Appoinment", style: TextStyle(fontSize: 20),),
              subtitle: Text("History and Upcoming Appoinment", style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}

class ListCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThreeLineCustomAppBar(
        height: 150,
        upperText: "BOOK AN APPOINMENT",
        lowerText: "Search for a surgery",
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Type in a surgery",
                hintText: "e.g. Hair Transplant",
                prefixIcon: Icon(Icons.search),
              ),
              onTap: () {
                showSearch(context: context, delegate: Search());
              },
            ),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(choices.length, (index) {
                      return GestureDetector(
                        child: GridTile(
                            child: CategoriesGrid(
                          choice: choices[index],
                        )),
                        onTap: () {
                          goToCategoriesRoute(context, index);
                        },
                      );
                    })))
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                child: ListTile(
                  leading: FlutterLogo(size: 40),
                  title: Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "Your Overview",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardPage()));
                }),
            GestureDetector(
              child: ListTile(
                leading: FlutterLogo(size: 40),
                title: Text(
                  "Browse Surgery",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "Find Your Next Surgery",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListCategoriesPage()));
              },
            ),
            GestureDetector(
              child: ListTile(
                leading: FlutterLogo(size: 40),
                title: Text(
                  "My Appoinment",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "History and Upcoming Appoinment",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentRoute())
                );
              },
            )
          ],
        ),
      ),
    );
  }

  goToCategoriesRoute(BuildContext context, int index) {
    var details = choices[index];
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoriesRoute(
            categoriesChoice: details,
          ),
        ));
  }
}

class CategoriesRoute extends StatefulWidget {
  final Choice categoriesChoice;

  CategoriesRoute({@required this.categoriesChoice});

  @override
  CategoriesRouteState createState() => CategoriesRouteState();
}

class CategoriesRouteState extends State<CategoriesRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableMaterial()
          .getAppBar(widget.categoriesChoice.choiceTitleGetter()),
      body: ListView(
        children: List.generate(widget.categoriesChoice.choiceListLength(),
            (indexes) {
          return Card(
              elevation: 5,
              child: ListTile(
                  leading: FlutterLogo(size: 45.0),
                  title:
                      Text(widget.categoriesChoice.choiceListGetter(indexes)),
                  subtitle:
                      Text('Hair Transplant is abluablu, research on progress'),
                  isThreeLine: true,
                  onTap: () {
                    goToServiceDetailsRoute(context, indexes);
                  }));
        }),
      ),
    );
  }

  goToServiceDetailsRoute(BuildContext context, int indexes) {
    var details = widget.categoriesChoice;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceDetailsRoute(
            categoriesChoice: details,
            indexNumber: indexes,
          ),
        ));
  }
}

class ServiceDetailsRoute extends StatefulWidget {
  final Choice categoriesChoice;
  final int indexNumber;

  ServiceDetailsRoute(
      {@required this.categoriesChoice, @required this.indexNumber});

  @override
  ServiceDetailsRouteState createState() => ServiceDetailsRouteState();
}

class ServiceDetailsRouteState extends State<ServiceDetailsRoute> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: ReusableMaterial().getAppBarWithTabBar(
              widget.categoriesChoice.choiceListGetter(widget.indexNumber)),
          body: TabBarView(children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  height: 20.0,
                ),
                Service().scrollableGallery(),
                Service().longText(),
              ],
            ),
            ListView(
              children: <Widget>[
                GestureDetector(
                    child: Service().hospitalListView(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservationPage()),
                      );
                    }),
                Divider(
                  height: 1,
                ),
                Service().hospitalListView(),
                Divider(
                  height: 1,
                ),
                Service().hospitalListView(),
                Divider(
                  height: 1,
                ),
                Service().hospitalListView(),
                Divider(
                  height: 1,
                ),
                Service().hospitalListView(),
              ],
            )
          ]),
        ));
  }
}

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

enum SingingCharacter { lafayette, jefferson }

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
//      Text('Basic date & time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}

class _ReservationPageState extends State<ReservationPage> {
  String _dateValue = "";
  String _timeValue = "";
  final format = DateFormat("yyyy-MM-dd HH:mm");
  SingingCharacter _character = SingingCharacter.lafayette;
  final _formKey = GlobalKey<FormState>();

  Future _selectDateTimeField() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2022));
    if (date != null) {
      TimeOfDay time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      setState(() {
        String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm")
            .format(DateTimeField.combine(date, time));
        _dateValue = formattedDateTime;
      });
    }
//    if(picked != null) setState(() {
//      _dateValue = picked.toString();
//    });
  }

  Future _selectTime() async {
    TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null)
      setState(() {
        _timeValue = picked.toString();
      });
  }

  getForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
            child: ReusableMaterial()
                .getTextFormField("Full Name", "What is your full name?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
            child: ReusableMaterial()
                .getDateTimeFormField("Date of Birth", "Ex: 25/08/1997"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
            child: ReusableMaterial().getNumberFormField(
                "Phone Number", "What is your phone number?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
            child: ReusableMaterial()
                .getEmailFormField("Email", "What is your email?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
            child: ReusableMaterial()
                .getNumberFormField("Weight (Kg)", "How much you weigh?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
            child: ReusableMaterial()
                .getNumberFormField("Height (Cm)", "How tall are you?"),
          ),
          Text(
            'Gender',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text(
                'Male',
                style: TextStyle(fontSize: 16),
              ),
              Radio(
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text(
                'Female',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          GestureDetector(
            child: Container(
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  _dateValue,
                ),
              ),
            ),
            onTap: _selectDateTimeField,
          ),
          RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPageHC()),
                  );
                }
              },
              child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableMaterial().getAppBar("Reservation"),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: ListView(
          children: <Widget>[
            getForm(),
//            RaisedButton(
//              onPressed: _selectDate,
//              child: Text("Select Date"),
//            ),
//            RaisedButton(
//              onPressed: _selectTime,
//              child: Text("Select Time"),
//            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}

class NewsRouteIbuprofen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableMaterial().getAppBar("Article"),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 25, 8, 8),
            child: Text(
                "Kenapa Kita Harus Meminum Ibuprofen",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 8, 8, 16),
            child: Opacity(
              child: Text(
                "09 July 2019",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              opacity: 0.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
            child: Opacity(
              child: Container(
                alignment: Alignment.center,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey
                ),
              ),
              opacity: 0.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(StringContent().newsText),
          )
        ],
      ),
    );
  }
}

class NewsRouteCarbonate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableMaterial().getAppBar("Article"),
      body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 25, 8, 8),
              child: Text(
                "Efek Samping Minuman Berkarbonasi",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 8, 8, 16),
              child: Opacity(
                child: Text(
                  "09 July 2019",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                opacity: 0.7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
              child: Opacity(
                child: Container(
                  alignment: Alignment.center,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey
                  ),
                ),
                opacity: 0.7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(StringContent().newsText),
            )
          ],
        ),
    );
  }
}

class Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var services = [];
    choices.forEach((choice) => services.addAll(choice.listChild));
    final results =
        services.where((service) => service.toLowerCase().contains(query));
    return ListView(
        children: results
            .map<ListTile>((result) => ListTile(
                  title: Text(result,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontSize: 16.0)),
                  leading: Icon(Icons.local_hospital),
                  onTap: () {
                    final categoriesChoice = choices
                        .where((choice) => choice.listChild.contains(result))
                        .toList()[0];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailsRoute(
                            categoriesChoice: categoriesChoice,
                            indexNumber:
                                categoriesChoice.listChild.indexOf(result),
                          ),
                        ));
                  },
                ))
            .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var services = [];
    choices.forEach((choice) => services.addAll(choice.listChild));
    final results =
        services.where((service) => service.toLowerCase().contains(query));
    return ListView(
        children: results
            .map<ListTile>((result) => ListTile(
                  title: Text(result,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontSize: 16.0)),
                  onTap: () {
                    final categoriesChoice = choices
                        .where((choice) => choice.listChild.contains(result))
                        .toList()[0];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailsRoute(
                            categoriesChoice: categoriesChoice,
                            indexNumber:
                                categoriesChoice.listChild.indexOf(result),
                          ),
                        ));
                  },
                ))
            .toList());
  }
}
