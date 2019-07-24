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
//    home: Scaffold(
//      appBar: AppBar(
//        title: Text("Tes Form"),
//      ),
//      body: MyCustomForm(),
//    ),
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
                        ReusableMaterial().appBarColorleft,
                        ReusableMaterial().appBarColorRight
                      ]
                    )
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
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

class DashboardPage extends StatefulWidget {

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo beresin appbar di page ini

      appBar: ThreeLineCustomAppBar(
          height: 150,
          upperText: "YOUR DASHBOARD",
          lowerText: "Have a healthy life!"
      ),
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
                      ReusableMaterial().appBarColorleft,
                      ReusableMaterial().appBarColorRight
                    ]
                  )
                ),
              ),
            )
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text("Your Appoinment", style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 180,
                width: 370,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Text(
                      "You Don't Have Any Appoinment",
                      style: TextStyle(fontSize: 24),
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
                      child: Text("News For You", style: TextStyle(fontSize: 20),),
                    ),
                    Container(
                      width: 160,
                    ),
                    Text("Explore Article", style: TextStyle(fontSize: 14),)
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
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
                        Text("Kenapa Kita Harus Meminum Ibuprofen", textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                  Container(
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
                        Text("Efek Samping Minuman Berkarbonasi", textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  height: 40,
                  minWidth: 380,
                  child: RaisedButton(
                    child: Text(
                      "Book New Appoinment",
                      style: TextStyle(fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListCategoriesPage())
                      );
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
                prefixIcon: Icon(Icons.search)
              ),
            ),
           Expanded(
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
                      MaterialPageRoute(builder: (context) => ReservationPage()),
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

class ReservationPage extends StatefulWidget{

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {

  String _dateValue = "";
  String _timeValue = "";
  final _formKey = GlobalKey<FormState>();


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

  getForm() {
    final String x = "s";
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 4),
            child: ReusableMaterial().getTextFormField(
                "Full Name", "What is your full name?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 4),
            child: ReusableMaterial().getDateTimeFormField(
                "Date of Birth", "Ex: 25/08/1997"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 4),
            child: ReusableMaterial().getNumberFormField(
                "Phone Number", "What is your phone number?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 4),
            child: ReusableMaterial().getEmailFormField(
                "Email", "What is your email?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 4),
            child: ReusableMaterial().getNumberFormField(
                "Weight (Kg)", "How much you weigh?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 4),
            child: ReusableMaterial().getNumberFormField(
                "Height (Cm)", "How tall are you?"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            )
          )
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
        child: Column(
          children: <Widget>[
            getForm(),
            RaisedButton(
              onPressed: _selectDate,
              child: Text("Select Date"),
            ),
            RaisedButton(
              onPressed: _selectTime,
              child: Text("Select Time"),
            )
          ],
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}