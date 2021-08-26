import 'package:demo_add_mobx/addListView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyAppT());
}

class MyAppT extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _Screen(title: 'Flutter Demo Home Page'),
    );
  }
}

class _Screen extends StatefulWidget {
  _Screen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ScreenT createState() {
    return _ScreenT();
  }
}

class _ScreenT extends State<_Screen> {
  final addStore = AddListView();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: TextButton(
                child: Text("Về"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 250,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Insert",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors.amber, style: BorderStyle.solid)),
                    ),
                    controller: controller,
                  ),
                ),
                InkWell(
                  onTap: () {
                    addStore.addItems(controller.text);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.add),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.amber,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Các cách nói xin chào",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemBuilder: (context, i) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      addStore.listItems[i],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),
                  itemCount: addStore.listItems.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
