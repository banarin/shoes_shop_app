import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/screens/PanierScreen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shoes_shop_app/screens/homeScreen.dart';
import 'package:shoes_shop_app/screens/settingScreen.dart';

class Drawers extends StatelessWidget {
  List items;
  Drawers({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SHOES",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text("V0.1"),
            ],
          )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Panier'),
            trailing: badges.Badge(
              badgeContent: Text(
                items.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              Get.to(PanierScreen(items: items));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres'),
            onTap: () {
              // Mettez ici la logique de navigation pour les paramètres
              Get.to(const SettingScreen());
            },
          ),
        ],
      ),
    );
  }
}
