import 'package:flutter/material.dart';

import 'logic/models/game.dart';
import 'logic/DAO/DAO.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        accentColor: Colors.orange
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Game> games;

  void _readandprintGames() {
    games.forEach((item) => item.toPrint());
  }

  void _exportGames() {
    if(games != null || games.length > 0) {
      exportGames(games);
    }
  }

  @override
  void initState() {
    super.initState();
    games = getAllGamesfromfile();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  child: Text('Import data', style: TextStyle(fontSize: 20)),
                  onPressed: _readandprintGames,
                )
              ),
              SizedBox(height: 150,),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  child: Text('Export data',style: TextStyle(fontSize: 20)),
                  onPressed: _exportGames,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
