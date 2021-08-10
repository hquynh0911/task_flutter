import 'package:demo_add_provider/listItemsView.dart';
import 'package:demo_add_provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ListenableProvider(create: (_) => AddListView())],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Demo"),
          ),
          body: ListItemsView(),
        ),
      ),
    );
  }
}
