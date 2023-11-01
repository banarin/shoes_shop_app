import 'package:flutter/material.dart';
import 'package:shoes_shop_app/constants.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  const ButtonWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Constants.containerColor,
          borderRadius: BorderRadius.circular(12)),
      child: Icon(icon, color: Colors.black,size: 18,),
    );
  }
}
