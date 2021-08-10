import 'package:demo_add_provider/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ListItemsView extends StatefulWidget {
  @override
  _ListItemsView createState() {
    return _ListItemsView();
  }
}

class _ListItemsView extends State<ListItemsView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addItems = Provider.of<AddListView>(context);
    return Padding(
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
                    onTap: () {
                      addItems.addListView(controller.text);
                    })
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Các cách nói xin chào",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.watch<AddListView>().listItems[i],
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
                itemCount: addItems.listItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
