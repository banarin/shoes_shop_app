import 'package:flutter/material.dart';
import 'package:shoes_shop_app/constants.dart';
import 'package:shoes_shop_app/screens/homeScreen.dart';
import 'package:shoes_shop_app/widgets/buttonWidget.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: 200),
            const SizedBox(
              height: 20,
            ),
            Text("Shoes Shop",
                style: TextStyle(
                    color: Constants.textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            const Text("Made By <LECODEUR/>",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.normal)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.off(const HomeScreen());
                },
                child: const ButtonWidget(icon: Icons.arrow_right_alt))
          ],
        ),
      ),
    );
  }
}
