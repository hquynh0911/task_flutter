import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  List<String> listItems = ["Hello", "Hi", "Bye"];

  void _addListView() {
    setState(() {
      listItems.insert(0, controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Insert",
                          hintText: "Add something",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.amber),
                          )),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    onTap: _addListView,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Danh sách các string",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        listItems[i],
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  },
                  itemCount: listItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
