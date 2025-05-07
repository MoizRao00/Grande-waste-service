import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final List<int> items = List<int>.generate(30, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Orders")),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 12),
          child: ReorderableListView(
            children: List.generate(
                items.length,
                (index) => ListTile(
                      key: Key('$index'),
                      minTileHeight: 79,
                      tileColor: items[index].isOdd
                          ? Colors.white
                          : Colors.green[700],
                      title: Text("Order no ${items [index]}\nDate:dd:mm:yyyy",style: TextStyle(
                        color: items[index].isOdd
                            ? Colors.green[1000]
                            : Colors.white,
                      ),),
                      trailing: Icon(
                        Icons.check,
                        color:items[index].isOdd
                            ? Colors.green[900]
                            : Colors.white,
                      ),
                 leading: Icon(Icons.image,color:items[index].isOdd
                     ? Colors.green[900]
                     : Colors.white,),
                    )),
            onReorder: (int oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex = -1;
                }
                final int item = items.removeAt(oldIndex);
                items.insert(newIndex, item);
              });
            },
          ),
        ));
  }
}
