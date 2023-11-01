import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/constants.dart';
import 'package:shoes_shop_app/models/product.dart';
import 'package:shoes_shop_app/screens/PanierScreen.dart';
import 'package:shoes_shop_app/utils/utils.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shoes_shop_app/widgets/drawers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int nbrPanier = 0;

  increment() {
    setState(() {
      nbrPanier++;
    });
  }

  List<Product> items = [];
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    _showDialog(
      context,
      Product data,
    ) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              content: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      data.image,
                      height: 200,
                    ),
                    const Text(
                      "Voulez vous ajouter ce produit au panier",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Annuler')),
                    TextButton(
                        onPressed: () {
                          items.add(data);
                          print(items.length);
                          increment();
                          Get.back();
                        },
                        child: const Text('Ajouter')),
                  ],
                )
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: Constants.background,
      drawer: Drawers(
        items: items,
      ),
      appBar: AppBar(
        backgroundColor: Constants.background,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(PanierScreen(
                items: items,
              ));
            },
            icon: badges.Badge(
              badgeContent: Text(
                nbrPanier.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Shop",
                    style: TextStyle(
                        color: Constants.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "Selection une shoes dans cette liste de shoes premuim",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 2,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5,
                  crossAxisCount: 1,
                ),
                itemCount: Utils.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Product items = Utils.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 2,
                      color: Constants.background,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              items.image,
                              width: 350,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 10),
                              child: Text(
                                items.name,
                                style: TextStyle(
                                    color: Constants.textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Item description",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items.price.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showDialog(context, items);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Constants.containerColor,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Icon(
                                        Icons.add_shopping_cart_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            const Text(
              "Shoes Shop",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
