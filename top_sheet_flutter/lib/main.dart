import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),

          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          leading: IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                return showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  transitionDuration: Duration(milliseconds: 500),
                  barrierLabel: MaterialLocalizations.of(context).dialogLabel,
                  barrierColor: Colors.black.withOpacity(0.5),
                  pageBuilder: (context, _, __) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Card(
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                InkWell(child: Text("ff"), onTap: () {}),
                                ListTile(
                                  title: Text('Item 1'),
                                  onTap: () =>
                                      Navigator.of(context).pop('item1'),
                                ),
                                ListTile(
                                  title: Text('Item 2'),
                                  onTap: () =>
                                      Navigator.of(context).pop('item2'),
                                ),
                                ListTile(
                                  title: Text('Item 3'),
                                  onTap: () =>
                                      Navigator.of(context).pop('item3'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  transitionBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOut,
                      ).drive(Tween<Offset>(
                        begin: Offset(0, -1.0),
                        end: Offset.zero,
                      )),
                      child: child,
                    );
                  },
                );
              })),
      body: Column(children: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              return showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Card(
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                ListTile(
                                  title: Text('Item 1'),
                                  onTap: () =>
                                      Navigator.of(context).pop('item1'),
                                ),
                                ListTile(
                                  title: Text('Item 2'),
                                  onTap: () =>
                                      Navigator.of(context).pop('item2'),
                                ),
                                ListTile(
                                  title: Text('Item 3'),
                                  onTap: () =>
                                      Navigator.of(context).pop('item3'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }),
        // IconButton(icon: Icon(Icons.handyman), onPressed: (){
        //   return showCupertinoModalPopup(context: null, builder: null)
        // })
      ]),
    );
  }
}
