import 'package:flutter/material.dart';
//import 'package:fb_auth/fb_auth.dart';
import './router.dart';
import 'current_language.dart';

void main() {
  /*FbApp(
    apiKey: " AIzaSyCrYqY8optvP8lHc3D-iK24YNYo6mkgkZI",
    authDomain: "localhost",
    databaseURL: "https://cityprog-24974.firebaseio.com/",
    projectId: "cityprog-24974",
    storageBucket: "gs://cityprog-24974.appspot.com/");*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => Router.generateRoute(settings),
      localeResolutionCallback: (deviceLocale, _) {
        _initLanguage(deviceLocale.toLanguageTag());
      }
    );
  }

  void _initLanguage(String localeId) {
    CurrentLanguage.setNewFromString(localeId);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// Some updating data source
/* setState(() {
    }); */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<String> entries = <String>['Uutinen', 'Uutinen', 'Tapahtuma'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child: Column(
            children: <Widget>[
              new Text(
                'Cityproggis',
                // style: TextStyle(color: Colors.blue, fontSize: 50),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin:
                          EdgeInsets.only(right: 40.0, left: 40.0, bottom: 5.0),
                      height: 50,
                      color: Colors.blue[colorCodes[index]],
                      child: Center(child: Text('${entries[index]}')),
                    );
                  }),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new FlatButton(
                    color: Colors.amber,
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                  new FlatButton(
                    color: Colors.amber,
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                  new FlatButton(
                    color: Colors.amber,
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
