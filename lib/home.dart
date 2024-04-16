import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/item.dart';
import './model/cart.dart';
import 'package:consumer/consumer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  List<Item> items = [
    Item(name: 'item 1', price: 100),
    Item(name: 'item 2', price: 200),
    Item(name: 'item 3', price: 300),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/cart');
                  }),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text("${cart.count}");
                    // return Text(cart.count.toString());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(
              child: Consumer<Cart>(builder: (context, cart, child) {
                return ListTile(
                  title: Text(items[i].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cart.add(items[i]);
                    },
                  ),
                );
              }),
            );
          }),
    );
  }
}
