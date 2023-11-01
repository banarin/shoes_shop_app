import 'package:flutter/material.dart';
import 'package:shoes_shop_app/constants.dart';
import 'package:shoes_shop_app/models/product.dart';

class PanierScreen extends StatefulWidget {
  List items;
  PanierScreen({required this.items, super.key});

  @override
  State<PanierScreen> createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  @override
  double totalPrice = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      totalPrice = calculateTotal();
    });
  }

  double calculateTotal() {
    double total = 0;
    for (var item in widget.items) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "P A N I E R",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            Product item = widget.items[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Image.asset(
                        item.image,
                        height: 90,
                      ),
                      Text(
                        "${item.name} : ${item.price.toString()} \$",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: Constants.containerColor,
              borderRadius: BorderRadius.circular(12)),
          height: MediaQuery.sizeOf(context).height / 14,
          child: Center(
            child: Text("Acheter : $totalPrice"),
          ),
        ),
      ),
    );
  }
}
