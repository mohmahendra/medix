import 'package:compfest_aic_2019/CategoriesGrid.dart';
import 'package:compfest_aic_2019/ReusableMaterial.dart';
import 'package:compfest_aic_2019/ServiceDetails.dart';
import 'package:compfest_aic_2019/StringContent.dart';
import 'package:flutter/material.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  // _MyHomePageState createState() => _MyHomePageState();
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<MyHomePage> {

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
                    // colors: [appBarColorleft, appBarColorRight]
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    final categoriesButton = RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListCategoriesRoute()),
        );
      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: const Text(
          'Categories',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );

    final videoCallButton = RaisedButton(
      onPressed: null,
      child: const Text(
        'Video Call',
        style: TextStyle(fontSize: 20)
      ),
      
    );

    return Scaffold(
      appBar: new ReusableMaterial().getAppBar("Home Page"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 155.0,
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 50.0),
            categoriesButton,
            SizedBox(height: 100.0),
            videoCallButton,
          ],
        )
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
                      goToCategoriesPage(context, index);
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
  goToCategoriesPage(BuildContext context, int index) {
    // var details = CategoriesGrid(choice: choices[index],);
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
        children: <Widget>[
          Card(
            elevation: 5,
            child: ListTile(
              leading: FlutterLogo(size: 45.0),
              title: Text('Hair Transplant'),
              subtitle: Text('Hair Transplant is abluablu, research on progress'),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailsRoute()
                  )
                );
              }
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: FlutterLogo(size: 45.0),
              title: Text('Lip Reduction'),
              subtitle: Text('Lip Reduction is abluablu, research on progress'),
              isThreeLine: true,
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: FlutterLogo(size: 45.0),
              title: Text('Breast Implant'),
              subtitle: Text('Breast Implant is abluablu, research on progress'),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }

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
}

class ServiceDetailsRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableMaterial().getAppBar("Hair Transplant"),
      body: ListView(
        children: <Widget>[
          Container(
            height: 40.0,
          ),
          Container(
            height: 155.0,
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
                ),
              ],
            )
          ),
          const Text('Quick Details'),
          ServiceDetails().longText(),
        ],
      ),
    );
  }
}