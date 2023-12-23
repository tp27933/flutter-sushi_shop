import 'package:flutter/material.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/thmem/color.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.grey[900]),
          title: Text(
            "Tokyo",
            style: TextStyle(color: Colors.grey[900]),
          )),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: primaryColor),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: 
              // prom banner
              Row(
                children: [
                  // prom message
                  Text("Get 32% prom"),

                  // reedem button
                  CustomButton(text: "Redeem", onTap: (){})

                ],
              )
              // search banner
              // menu list
              )
            ],
          )
    );
  }
}
