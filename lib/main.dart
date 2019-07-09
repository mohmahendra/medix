import 'package:compfest_aic_2019/CategoriesGrid.dart';
import 'package:compfest_aic_2019/ReusableMaterial.dart';
import 'package:compfest_aic_2019/Service.dart';
import 'package:flutter/material.dart';
import 'dart:async';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compfest Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
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
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.centerRight,
                    colors: [ReusableMaterial().appBarColorleft, ReusableMaterial().appBarColorRight]
                  )
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListCategoriesRoute()),
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
            )
          )
        ],
      )
    );
  }
}

class ListCategoriesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new ReusableMaterial().getAppBar("Categories"),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "e.g. Hair Transplant",
                prefixIcon: Icon(Icons.search)
              ),
            ),
            new Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(choices.length, (index) {
                  return GestureDetector(
                    child: GridTile(
                      child: CategoriesGrid(choice: choices[index],)
                      ),
                    onTap: () {
                      goToCategoriesRoute(context, index);
                    },
                  );
                })
              )
            )
          ],
        ),
      )
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
      )
    );
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
      appBar: ReusableMaterial().getAppBar(widget.categoriesChoice.choiceTitleGetter()),
      body: ListView(
        children: List.generate(widget.categoriesChoice.choiceListLength(), (indexes) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: FlutterLogo(size: 45.0),
              title: Text(widget.categoriesChoice.choiceListGetter(indexes)),
              subtitle: Text('Hair Transplant is abluablu, research on progress'),
              isThreeLine: true,
              onTap: () {
                goToServiceDetailsRoute(context, indexes);
              }
            )
          );
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
      )
    );
  }
}


class ServiceDetailsRoute extends StatefulWidget {

  final Choice categoriesChoice;
  final int indexNumber;

  ServiceDetailsRoute({@required this.categoriesChoice, @required this.indexNumber});

  @override
  ServiceDetailsRouteState createState() => ServiceDetailsRouteState();

}

class ServiceDetailsRouteState extends State<ServiceDetailsRoute> {

  void _showModalSheet() {
    showModalBottomSheet(context: context, builder: (builder) {
      return Container(
        child: Text('Hellooow'),
        padding: EdgeInsets.all(40.0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ReusableMaterial().getAppBarWithTabBar(widget.categoriesChoice.choiceListGetter(widget.indexNumber)),
        body: TabBarView(
          children: <Widget>[
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
                      MaterialPageRoute(builder: (context) => BookServiceRoute()),
                    );
                  }
                ),
                Divider(height: 1,),
                Service().hospitalListView(),
                Divider(height: 1,),          
                Service().hospitalListView(),
                Divider(height: 1,),
                Service().hospitalListView(),
                Divider(height: 1,),
                Service().hospitalListView(),
              ],
            )
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Sort'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Filter')
            )
          ],
        ),
      )
    );
  }
}

class BookServiceRoute extends StatefulWidget{

  @override
  _BookServiceRouteState createState() => _BookServiceRouteState();
}

class _BookServiceRouteState extends State<BookServiceRoute> {

  String _dateValue = "";
  String _timeValue = "";

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2022)
    );
    if(picked != null) setState(() {
      _dateValue = picked.toString();
    });
  }

  Future _selectTime() async {
    TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
    if(picked != null) setState(() {
      _timeValue = picked.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: ReusableMaterial().getAppBar("Booking"),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _selectDate,
              child: Text("Select Date"),
            ),
            RaisedButton(
              onPressed: _selectTime,
              child: Text("Select Time"),
            )
          ],
//        child: RaisedButton(
//          onPressed: _selectDate,
//          child: Text('Click me'),
        ),
      ),
    );
  }
}